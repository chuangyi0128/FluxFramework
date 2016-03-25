//
//  HYGStore.m
//  NeteaseLottery
//
//  Created by SongLi on 1/20/16.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "FluxStore.h"
#import "FluxAction.h"

@implementation FluxStore

- (instancetype)init
{
    self = [super init];
    if (self) {
        _isInitialized = NO;
    }
    return self;
}

- (nonnull instancetype)initWithIdentifier:(nullable NSString *)identifier
{
    self = [self init];
    if (self) {
        _identifier = identifier;
    }
    return self;
}

- (nonnull SEL)actionHandler
{
    return @selector(handleActionNotification:);
}


#pragma mark - Private Methods

/**
 *  检测identifier是否匹配:
 *  store没有 +  action没有  ->   YES；
 *  store有   +  action没有  ->   YES；
 *  store没有 +  action有    ->   NO；
 *  store有   +  action有    ->  isEqual?
 */
- (BOOL)isIdentifierValid:(nullable NSString *)identifier
{
    if (self.identifier && identifier) {
        return [self.identifier isEqualToString:identifier];
    } else if (identifier) {
        return NO;
    } else if (self.identifier) {
        return YES;
    } else {
        return YES;
    }
}

- (void)handleActionNotification:(NSNotification *)notification
{
    FluxAction *action = notification.userInfo[@"action"];
    if (![self isIdentifierValid:action.identifier]) {
        return;
    }
    
    if ([self respondsToSelector:@selector(actionRecieverDict)]) {
        NSDictionary *dict = [self performSelector:@selector(actionRecieverDict)];
        SEL actionReciever = NSSelectorFromString(dict[NSStringFromClass([action class])]);
        if (actionReciever && [self respondsToSelector:actionReciever]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self performSelector:actionReciever withObject:action];
#pragma clang diagnostic pop
        }
    }
}

@end

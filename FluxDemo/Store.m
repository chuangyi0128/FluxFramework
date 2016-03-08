//
//  Store.m
//  FluxDemo
//
//  Created by SongLi on 3/8/16.
//  Copyright © 2016 SongLi. All rights reserved.
//

#import "Store.h"
#import "TodoAction.h"

@interface Store ()
@property (nonatomic, assign) BOOL statusA;
@end

@implementation Store
@synthesize isInitialized = _isInitialized;

- (nullable NSDictionary *)actionRecieverDict
{
    return @{NSStringFromClass([TodoAction class]) : NSStringFromSelector(@selector(handleTodoAction:))};
}

#pragma mark - Private Methods

- (void)handleTodoAction:(TodoAction *)action
{
    switch (action.type) {
        case TodoActionType1:
            [self todoA:action.data];
            break;
        case TodoActionType2:
            [self todoB:action.data];
            break;
            
        default:
            return;
            break;
    }
    _isInitialized = YES;
}

- (void)todoA:(NSDictionary *)dict
{
    self.statusA = YES;
    
    if ([self.delegate respondsToSelector:@selector(store:didRefreshList:)]) {
        [self.delegate store:self didRefreshList:@[]];
    }
}

- (void)todoB:(NSError *)error
{
    self.statusA = NO;
    
    if ([self.delegate respondsToSelector:@selector(store:didRefreshList:)]) {
        [self.delegate store:self didRefreshList:nil];
    }
}

@end

//
//  ActionCreator.m
//  FluxDemo
//
//  Created by SongLi on 3/8/16.
//  Copyright © 2016 SongLi. All rights reserved.
//

#import "ActionCreator.h"
#import "FluxDispatcher.h"
#import "TodoAction.h"

@implementation ActionCreator

+ (void)sendActionWithId:(nullable NSString *)idStr params:(nonnull NSDictionary *)params
{
    // Do Asynchronous Tasks like network
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        TodoAction *action = [[TodoAction alloc] initWithType:TodoActionType1 data:nil identifier:idStr];
        [FluxDispatcher dispatchAction:action];
    });
}

@end

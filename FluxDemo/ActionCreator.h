//
//  ActionCreator.h
//  FluxDemo
//
//  Created by SongLi on 3/8/16.
//  Copyright © 2016 SongLi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActionCreator : NSObject

+ (void)sendActionWithId:(nullable NSString *)idStr params:(nonnull NSDictionary *)params;

@end

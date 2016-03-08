//
//  FluxDispatcher.h
//  NeteaseLottery
//
//  Created by SongLi on 1/20/16.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FluxAction;
@class FluxStore;
@protocol FluxStore;
@interface FluxDispatcher : NSObject

/**
 *  向Dispatcher注册Store，用于接收Action
 *
 *  @warning   registerStore与unregisterStore需要成对出现！
 */
+ (BOOL)registerStore:(nonnull FluxStore<FluxStore> *)store;

/**
 *  向Dispatcher注销Store
 *
 *  @warning   registerStore与unregisterStore需要成对出现！
 */
+ (void)unregisterStore:(nonnull FluxStore<FluxStore> *)store;

/**
 *  向Dispatcher发送一个Action
 */
+ (void)dispatchAction:(nonnull FluxAction *)action;

@end

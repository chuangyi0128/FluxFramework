//
//  FluxStore.h
//  FluxFramework
//
//  Created by SongLi on 1/20/16.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

/**
 *  Store用于存储当前状态和ViewModel数据；
 *  Store接收Action并处理Action的数据，完成后回调View-Controller更新视图；
 *  每个Store对应一个View-Controller，每个View-Controller根据视图复杂情况可能对应多个Store；
 *  在需要的时候，View-Controller应该在didDisappear时向Dispatcher注销Store，在willAppear时向Dispatcher注册Store。
 *  在需要的时候，Store可以带标识符，指定处理带有某标识符的Action。
 */

#import <Foundation/Foundation.h>

@protocol FluxStore <NSObject>

/** 
 *  提供一个action与接收处理它的method的对应字典。
 *  需要FluxStore的子类实现此方法。
 *
 *  例：return @{NSStringFromClass([Action class]) : NSStringFromSelector(@selector(handleAction:))};
 */
- (nullable NSDictionary *)actionRecieverDict;

@end


@interface FluxStore : NSObject

/**
 *  标识store是否为初始化状态，若为空则可能需要重新加载数据。
 */
@property (nonatomic, assign, readonly) BOOL isInitialized;

/** 
 *  store标识，可以为nil。
 *  不为nil时store只处理带有相同标识的action。
 */
@property (nonatomic, copy, readonly, nullable) NSString *identifier;

/**
 *  @param  identifier  store标识，可以为nil，不为nil时store只处理带有相同标识的action
 */
- (nonnull instancetype)initWithIdentifier:(nullable NSString *)identifier;

@end

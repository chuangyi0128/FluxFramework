//
//  FluxAction.h
//  NeteaseLottery
//
//  Created by SongLi on 1/20/16.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FluxAction : NSObject

/** Action的类型 */
@property (nonatomic, assign, readonly) NSInteger type;

/** Action所带的数据 */
@property (nonatomic, strong, readonly, nullable) id data;

/** Action的标识 */
@property (nonatomic, copy, readonly, nullable) NSString *identifier;

/** 
 *  @param  type    Action的类型
 */
- (nonnull instancetype)initWithType:(NSInteger)type NS_DESIGNATED_INITIALIZER;

/**
 *  @param  type        Action的类型
 *  @param  identifier  若不为nil则只有带有相同标识的store才会接受
 */
- (nonnull instancetype)initWithType:(NSInteger)type identifier:(nullable NSString *)identifier;

/**
 *  @param  type    Action的类型
 *  @param  data    Action所带的数据
 */
- (nonnull instancetype)initWithType:(NSInteger)type data:(nullable id)data;

/**
 *  @param  type        Action的类型
 *  @param  data        Action所带的数据
 *  @param  identifier  若不为nil则只有带有相同标识的store才会接受
 */
- (nonnull instancetype)initWithType:(NSInteger)type data:(nullable id)data identifier:(nullable NSString *)identifier;

@end

//
//  FluxAction.m
//  NeteaseLottery
//
//  Created by SongLi on 1/20/16.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "FluxAction.h"

@implementation FluxAction

- (nonnull instancetype)init
{
    return [self initWithType:-1];
}

- (nonnull instancetype)initWithType:(NSInteger)type
{
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
}

- (nonnull instancetype)initWithType:(NSInteger)type identifier:(nullable NSString *)identifier
{
    self = [self initWithType:type];
    if (self) {
        _identifier = identifier;
    }
    return self;
}

- (nonnull instancetype)initWithType:(NSInteger)type data:(nullable id)data
{
    self = [self initWithType:type];
    if (self) {
        _data = data;
    }
    return self;
}

- (nonnull instancetype)initWithType:(NSInteger)type data:(nullable id)data identifier:(nullable NSString *)identifier
{
    self = [self initWithType:type];
    if (self) {
        _data = data;
        _identifier = identifier;
    }
    return self;
}

@end

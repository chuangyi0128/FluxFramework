//
//  Store.h
//  FluxDemo
//
//  Created by SongLi on 3/8/16.
//  Copyright © 2016 SongLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FluxFramework/FluxFramework.h>
#import "ListModel.h"


@class Store;
@protocol StoreDelegate <NSObject>

- (void)store:(nonnull Store *)store didRefreshList:(nullable NSArray<ListModel *> *)listContent;

@end


@interface Store : FluxStore <FluxStore>

@property (nonatomic, weak, nullable) id<StoreDelegate> delegate;

@property (nonatomic, assign, readonly) BOOL statusA;

@end

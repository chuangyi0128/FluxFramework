//
//  ViewController.m
//  FluxDemo
//
//  Created by SongLi on 3/8/16.
//  Copyright © 2016 SongLi. All rights reserved.
//

#import "ViewController.h"
#import "ActionCreator.h"
#import "Store.h"
#import <FluxFramework/FluxFramework.h>

@interface ViewController () <StoreDelegate>
@property (nonatomic, strong) Store *store;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.store = [[Store alloc] initWithIdentifier:@"id"];
    [FluxDispatcher registerStore:self.store];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (![self.store isInitialized]) {
        [ActionCreator sendActionWithId:@"id" params:@{}];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    [FluxDispatcher unregisterStore:self.store];
}


#pragma mark - StoreDelegate

- (void)store:(nonnull Store *)store didRefreshList:(nullable NSArray<ListModel *> *)listContent
{
    NSLog(@"ViewController recieved store event!");
}

@end

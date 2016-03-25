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
#import "FluxDispatcher.h"

@interface ViewController () <StoreDelegate>
@property (nonatomic, strong) Store *store;
@end

@implementation ViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.store = [[Store alloc] initWithIdentifier:@"id"];
        self.store.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [FluxDispatcher registerStore:self.store];
    
    if (![self.store isInitialized]) {
        [ActionCreator sendActionWithId:@"id" params:@{}];
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [FluxDispatcher unregisterStore:self.store];
}

- (void)dealloc
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - StoreDelegate

- (void)store:(nonnull Store *)store didRefreshList:(nullable NSArray<ListModel *> *)listContent
{
    NSLog(@"ViewController recieved store event!");
}

@end

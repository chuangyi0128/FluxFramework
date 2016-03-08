//
//  TodoAction.h
//  FluxDemo
//
//  Created by SongLi on 3/8/16.
//  Copyright © 2016 SongLi. All rights reserved.
//

#import <FluxFramework/FluxFramework.h>

typedef NS_ENUM(NSInteger, TodoActionType)
{
    TodoActionType1,
    TodoActionType2,
};

@interface TodoAction : FluxAction

@property (nonatomic, copy, nullable) NSString *infoStr;

@end

//
//  ZYLNSNotification.h
//  通知的使用
//
//  Created by qianfeng on 15/3/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYLNSNotification : NSObject


//相当于手机用户
@property (nonatomic, retain) NSObject *observer;
//方法名
@property (nonatomic, assign) SEL selector;
//注册通知登记的名字
@property (nonatomic, copy) NSString *name;
//参数
@property (nonatomic, retain) NSObject *object;


//初始化方法
- (instancetype)initWithObserver:(NSObject *)observer selector:(SEL)selector name:(NSString *)name object:(NSObject *)object;


@end

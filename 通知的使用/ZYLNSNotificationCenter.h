//
//  ZYLNSNotificationCenter.h
//  通知的使用
//
//  Created by qianfeng on 15/3/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYLNSNotificationCenter : NSObject
{
    @private   //主要是用来存储ZYLNSNotification创建数据模型对象
    NSMutableArray *_observers;

}

//工厂方法
+ (id)defaultCerter;

//通过监听的方法
- (void)addObserver:(NSObject *)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject;

//移除通知
- (void)removeObserver:(NSObject *)observer name:(NSString *)aName object:(id)anObject;

//发送通知
- (void)postNotificationName:(NSString *)aName object:(id)anObject;

@end

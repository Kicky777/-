//
//  ZYLNSNotificationCenter.m
//  通知的使用
//
//  Created by qianfeng on 15/3/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLNSNotificationCenter.h"
#import "ZYLNSNotification.h"

static ZYLNSNotificationCenter *notificationCenter = nil;
@implementation ZYLNSNotificationCenter

+ (id)defaultCerter {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        notificationCenter = [[super allocWithZone:NULL] init];
    });
    
    return notificationCenter;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        //开辟空间
        _observers = [[NSMutableArray alloc] init];
    }
    return self;
}


//通过监听的方法
- (void)addObserver:(NSObject *)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject {
    
    //创建对象
    ZYLNSNotification *noti = [[ZYLNSNotification alloc] initWithObserver:observer selector:aSelector name:aName object:anObject];
    //将noti添加到observes数组里面
    [_observers addObject:noti];
    
}

//移除通知
- (void)removeObserver:(NSObject *)observer name:(NSString *)aName object:(id)anObject {
    //遍历数组
    [_observers enumerateObjectsUsingBlock:^(ZYLNSNotification *noti, NSUInteger idx, BOOL *stop) {
       //当名字和监听者对象一样时 从数组里面将对象移除
        if ([noti.name isEqualToString:aName] && noti.observer == observer) {
            [_observers removeObjectAtIndex:idx];
        }
    }];
}

//发送通知
- (void)postNotificationName:(NSString *)aName object:(id)anObject {
    [_observers enumerateObjectsUsingBlock:^(ZYLNSNotification *noti, NSUInteger idx, BOOL *stop) {
       //如果名字相同
        if ([aName isEqualToString:noti.name]) {
            //重置一下参数
            noti.object = anObject;
            SEL sel = noti.selector;
            
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [noti.observer performSelector:sel withObject:nil];
        }
        
    }];
}

@end

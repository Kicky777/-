//
//  ZYLNSNotification.m
//  通知的使用
//
//  Created by qianfeng on 15/3/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLNSNotification.h"

@implementation ZYLNSNotification

- (instancetype)initWithObserver:(NSObject *)observer selector:(SEL)selector name:(NSString *)name object:(NSObject *)object
{
    self = [super init];
    if (self) {
        self.observer = observer;
        self.selector = selector;
        self.name = name;
        self.object = object;
    }
    return self;
}

@end

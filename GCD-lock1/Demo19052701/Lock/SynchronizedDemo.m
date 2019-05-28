//
//  SynchronizedDemo.m
//  Demo19052701
//
//  Created by Yaanco on 2019/5/28.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "SynchronizedDemo.h"

@implementation SynchronizedDemo

- (void)__saveMoney {
    @synchronized ([self class]) {
        [super __saveMoney];
    }
}

- (void)__drawMoney {
    @synchronized ([self class]) {
        [super __drawMoney];
    }
}

- (void)__saleTicket {
    static NSObject *object;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[NSObject alloc] init];
        NSLog(@"1 - %p",object);
    });
    @synchronized (object) {
        [super __saleTicket];
    }
}

- (void)otherTest {
    // 支持递归锁
    static NSObject *object;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[NSObject alloc] init];
        NSLog(@"2 - %p",object);
    });
    @synchronized (object) {
        static NSUInteger count = 0;
        count++;
        if (count < 10) {
            NSLog(@"%s",__func__);
            [self otherTest];
        }
    }
}

@end

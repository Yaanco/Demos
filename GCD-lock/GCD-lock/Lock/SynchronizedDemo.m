//
//  SynchronizedDemo.m
//  GCD-lock
//
//  Created by Yaanco on 2019/5/11.
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
    static NSObject *lock;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lock = [[NSObject alloc] init];
    });
    @synchronized (lock) {
        [super __saleTicket];
    }
}

- (void)otherTest {
    NSLog(@"%s",__func__);
    @synchronized (self) {
        [self otherTest];
    }
}

@end

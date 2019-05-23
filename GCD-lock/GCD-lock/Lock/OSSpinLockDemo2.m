//
//  OSSpinLockDemo2.m
//  GCD-lock
//
//  Created by Yaanco on 2019/5/10.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "OSSpinLockDemo2.h"
#import <libkern/OSAtomic.h>

@implementation OSSpinLockDemo2
static OSSpinLock moneyLock_;
+ (void)initialize
{
    if (self == [OSSpinLockDemo2 class]) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            moneyLock_ = OS_SPINLOCK_INIT;
        });
    }
}

- (void)__saveMoney {
    // 取钱和存钱要使用同一个锁，因为这两个方法不能在同一时间执行
    OSSpinLockLock(&moneyLock_);
    [super __saveMoney];
    OSSpinLockUnlock(&moneyLock_);
}

- (void)__drawMoney {
    OSSpinLockLock(&moneyLock_);
    [super __drawMoney];
    OSSpinLockUnlock(&moneyLock_);
}

- (void)__saleTicket {
    static OSSpinLock ticketLock = OS_SPINLOCK_INIT;
    OSSpinLockLock(&ticketLock);
    [super __saleTicket];
    OSSpinLockUnlock(&ticketLock);
}

@end

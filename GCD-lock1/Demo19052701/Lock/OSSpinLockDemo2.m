//
//  OSSpinLockDemo2.m
//  Demo19052701
//
//  Created by Yaanco on 2019/5/27.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "OSSpinLockDemo2.h"
#import <libkern/OSAtomic.h>

static OSSpinLock moneyLock;

@implementation OSSpinLockDemo2

+ (void)initialize
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        moneyLock = OS_SPINLOCK_INIT;
    });
}

- (void)__saveMoney {
    OSSpinLockLock(&moneyLock);
    [super __saveMoney];
    OSSpinLockUnlock(&moneyLock);
}

- (void)__drawMoney {
    OSSpinLockLock(&moneyLock);
    [super __drawMoney];
    OSSpinLockUnlock(&moneyLock);
}

- (void)__saleTicket {
    static OSSpinLock ticketLock = OS_SPINLOCK_INIT;
    OSSpinLockLock(&ticketLock);
    [super __saleTicket];
    OSSpinLockUnlock(&ticketLock);
}

@end

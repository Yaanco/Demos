//
//  OSUnfairLockDemo.m
//  Demo19052701
//
//  Created by Yaanco on 2019/5/27.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "OSUnfairLockDemo.h"
#import <os/lock.h>

static os_unfair_lock moneyLock;

@implementation OSUnfairLockDemo

+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        moneyLock = OS_UNFAIR_LOCK_INIT;
    });
}

- (void)__saveMoney {
    os_unfair_lock_lock(&moneyLock);
    [super __saveMoney];
    os_unfair_lock_unlock(&moneyLock);
}

- (void)__drawMoney {
    os_unfair_lock_lock(&moneyLock);
    [super __drawMoney];
    os_unfair_lock_unlock(&moneyLock);
}

- (void)__saleTicket {
    static os_unfair_lock ticketLock = OS_UNFAIR_LOCK_INIT;
    os_unfair_lock_lock(&ticketLock);
    [super __saleTicket];
    os_unfair_lock_unlock(&ticketLock);
}

@end

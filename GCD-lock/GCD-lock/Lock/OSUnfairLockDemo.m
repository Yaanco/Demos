//
//  OSUnfairLockDemo.m
//  GCD-lock
//
//  Created by Yaanco on 2019/5/10.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "OSUnfairLockDemo.h"
#import <os/lock.h>

@interface OSUnfairLockDemo ()
// Low-level lock:低级锁
// 互斥锁：等不到锁时，处于休眠状态
@property (nonatomic, assign) os_unfair_lock moneyLock;
@property (nonatomic, assign) os_unfair_lock ticketLock;
@end

@implementation OSUnfairLockDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.moneyLock = OS_UNFAIR_LOCK_INIT;
        self.ticketLock = OS_UNFAIR_LOCK_INIT;
    }
    return self;
}

- (void)__saveMoney {
    os_unfair_lock_lock(&_moneyLock);
    [super __saveMoney];
    os_unfair_lock_unlock(&_moneyLock);
}

- (void)__drawMoney {
    os_unfair_lock_lock(&_moneyLock);
    [super __drawMoney];
    os_unfair_lock_unlock(&_moneyLock);
}

- (void)__saleTicket {
    os_unfair_lock_lock(&_ticketLock);
    [super __saleTicket];
    os_unfair_lock_unlock(&_ticketLock);
}

@end

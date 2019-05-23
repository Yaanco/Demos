//
//  MutexDemo.m
//  GCD-lock
//
//  Created by Yaanco on 2019/5/10.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "MutexDemo.h"
#import <pthread.h>

@interface MutexDemo ()
@property (nonatomic, assign) pthread_mutex_t moneyMutex;
@property (nonatomic, assign) pthread_mutex_t ticketMutex;
@property (nonatomic, assign) pthread_mutex_t otherMutex;
@end

@implementation MutexDemo

- (void)__initMutex:(pthread_mutex_t *)mutex {
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
    pthread_mutex_init(mutex, &attr);
    pthread_mutexattr_destroy(&attr);
}

- (void)__initOtherMutex:(pthread_mutex_t *)otherMutex {
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE); // 递归锁
    pthread_mutex_init(otherMutex, &attr);
    pthread_mutexattr_destroy(&attr);
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self __initMutex:&_moneyMutex];
        [self __initMutex:&_ticketMutex];
        [self __initOtherMutex:&_otherMutex];
    }
    return self;
}

- (void)__saveMoney {
    pthread_mutex_lock(&_moneyMutex);
    [super __saveMoney];
    pthread_mutex_unlock(&_moneyMutex);
}

- (void)__drawMoney {
    pthread_mutex_lock(&_moneyMutex);
    [super __drawMoney];
    pthread_mutex_unlock(&_moneyMutex);
}

- (void)__saleTicket {
    pthread_mutex_lock(&_ticketMutex);
    [super __saleTicket];
    pthread_mutex_unlock(&_ticketMutex);
}

/**
 使用普通锁，会产生死锁
 递归锁：允许同一线程进行重复加锁
 */
- (void)otherTest {
    pthread_mutex_lock(&_otherMutex);
    NSLog(@"%s",__func__);
    static int count = 0;
    if (count < 10) {
        count++;
        [self otherTest];
    }
    pthread_mutex_unlock(&_otherMutex);
}

- (void)dealloc
{
    // 销毁锁
    pthread_mutex_destroy(&_moneyMutex);
    pthread_mutex_destroy(&_ticketMutex);
}

@end

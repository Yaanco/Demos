//
//  MutexDemo.m
//  Demo19052701
//
//  Created by Yaanco on 2019/5/27.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "MutexDemo.h"
#import <pthread.h>

@interface MutexDemo ()
@property (nonatomic, assign) pthread_mutex_t moneyLock;
@property (nonatomic, assign) pthread_mutex_t ticketLock;
@end

@implementation MutexDemo

- (void)__initWithMutex:(pthread_mutex_t *)mutex {
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
    pthread_mutex_init(mutex, &attr);
    pthread_mutexattr_destroy(&attr);
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self __initWithMutex:&_moneyLock];
        [self __initWithMutex:&_ticketLock];
    }
    return self;
}

- (void)__saveMoney {
    pthread_mutex_lock(&_moneyLock);
    [super __saveMoney];
    pthread_mutex_unlock(&_moneyLock);
}

- (void)__drawMoney {
    pthread_mutex_lock(&_moneyLock);
    [super __drawMoney];
    pthread_mutex_unlock(&_moneyLock);
}

- (void)__saleTicket {
    pthread_mutex_lock(&_ticketLock);
    [super __saleTicket];
    pthread_mutex_unlock(&_ticketLock);
}

- (void)dealloc
{
    pthread_mutex_destroy(&_moneyLock);
    pthread_mutex_destroy(&_ticketLock);
}

@end

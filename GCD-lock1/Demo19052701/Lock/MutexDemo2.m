//
//  MutexDemo2.m
//  Demo19052701
//
//  Created by Yaanco on 2019/5/27.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "MutexDemo2.h"
#import <pthread.h>

@interface MutexDemo2 ()
@property (nonatomic, assign) pthread_mutex_t otherLock;
@end

@implementation MutexDemo2

- (void)__initWithMutex:(pthread_mutex_t *)mutex {
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE); // 递归锁：允许同一个线程进行加锁，不同线程不可以
    pthread_mutex_init(mutex, &attr);
    pthread_mutexattr_destroy(&attr);
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self __initWithMutex:&_otherLock];
    }
    return self;
}

- (void)otherTest {
    pthread_mutex_lock(&_otherLock);
    static NSUInteger count = 0;
    count++;
    NSLog(@"%s",__func__);
    if (count < 10) {
        [self otherTest]; // 递归调用，产生死锁，可以设置为递归锁
    }
    pthread_mutex_unlock(&_otherLock);
}

- (void)__otherTest {
    pthread_mutex_lock(&_otherLock);
    NSLog(@"%s",__func__);
    pthread_mutex_unlock(&_otherLock);
}

- (void)dealloc
{
    pthread_mutex_destroy(&_otherLock);
}

@end

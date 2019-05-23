//
//  RWLockDemo.m
//  GCD-lock
//
//  Created by Yaanco on 2019/5/11.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "RWLockDemo.h"
#import <pthread.h>

@interface RWLockDemo ()
@property (nonatomic, assign) pthread_rwlock_t rwLock;
@end

@implementation RWLockDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        pthread_rwlock_init(&_rwLock, NULL);
    }
    return self;
}

- (void)otherTest {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    for (int i = 0; i < 10; i++) {
        dispatch_async(queue, ^{
            [self read];
        });
        dispatch_async(queue, ^{
            [self write];
        });
    }
}

- (void)read {
    pthread_rwlock_rdlock(&_rwLock);
    sleep(1);
    NSLog(@"%s",__func__);
    pthread_rwlock_unlock(&_rwLock);
}

- (void)write {
    pthread_rwlock_wrlock(&_rwLock);
    sleep(1);
    NSLog(@"%s",__func__);
    pthread_rwlock_unlock(&_rwLock);
}

- (void)dealloc
{
    pthread_rwlock_destroy(&_rwLock);
}

@end

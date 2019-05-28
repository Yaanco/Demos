//
//  PthreadrwlockDemo.m
//  Demo19052701
//
//  Created by Yaanco on 2019/5/28.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "PthreadrwlockDemo.h"
#import <pthread.h>

@interface PthreadrwlockDemo ()
@property (nonatomic, assign) pthread_rwlock_t rwLock;
@end

@implementation PthreadrwlockDemo

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
            [self __read];
        });
        dispatch_async(queue, ^{
            [self __write];
        });
    }
}

- (void)__read {
    pthread_rwlock_rdlock(&_rwLock);
    sleep(1.);
    NSLog(@"%s",__func__);
    pthread_rwlock_unlock(&_rwLock);
}

- (void)__write {
    pthread_rwlock_wrlock(&_rwLock);
    sleep(1.);
    NSLog(@"%s",__func__);
    pthread_rwlock_unlock(&_rwLock);
}

@end

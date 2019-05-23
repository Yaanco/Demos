//
//  MutexDemo3.m
//  GCD-lock
//
//  Created by Yaanco on 2019/5/11.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "MutexDemo3.h"
#import <pthread.h>

@interface MutexDemo3 ()
@property (nonatomic, assign) pthread_mutex_t mutex;
@property (nonatomic, assign) pthread_cond_t cond;
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation MutexDemo3

- (instancetype)init
{
    self = [super init];
    if (self) {
        pthread_mutexattr_t attr;
        pthread_mutexattr_init(&attr);
        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
        pthread_mutex_init(&_mutex, &attr);
        pthread_mutexattr_destroy(&attr);
        self.data = [NSMutableArray array];
        
        pthread_cond_init(&_cond, NULL);
    }
    return self;
}

- (void)otherTest {
    [[[NSThread alloc] initWithTarget:self selector:@selector(__remove) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__add) object:nil] start];
}

- (void)__remove {
    pthread_mutex_lock(&_mutex);
    if ([self.data count] == 0) {
        pthread_cond_wait(&_cond, &_mutex);
        NSLog(@"移除数据 - %@",[NSThread currentThread]);
    }
    [self.data removeLastObject];
    pthread_mutex_unlock(&_mutex);
}

- (void)__add {
    pthread_mutex_lock(&_mutex);
    [self.data addObject:@"test"];
    NSLog(@"添加了数据 - %@",[NSThread currentThread]);
    pthread_cond_signal(&_cond);
//    pthread_cond_broadcast(&_cond); // 通知所有等待的锁
    pthread_mutex_unlock(&_mutex);
}

- (void)dealloc
{
    pthread_mutex_destroy(&_mutex);
    pthread_cond_destroy(&_cond);
}

@end

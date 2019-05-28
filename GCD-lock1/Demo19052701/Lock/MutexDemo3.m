//
//  MutexDemo3.m
//  Demo19052701
//
//  Created by Yaanco on 2019/5/27.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "MutexDemo3.h"
#import <pthread.h>

@interface MutexDemo3 ()
@property (nonatomic, assign) pthread_mutex_t mutex;
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, assign) pthread_cond_t cond;
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
        
        _data = [NSMutableArray array];
        
        pthread_cond_init(&_cond, NULL);
    }
    return self;
}

- (void)otherTest {
    for (int i = 0; i < 3; i++) {
        [[[NSThread alloc] initWithTarget:self selector:@selector(__remove) object:nil] start];
    }
    
    for (int i = 0; i < 3; i++) {
        [[[NSThread alloc] initWithTarget:self selector:@selector(__add) object:nil] start];
    }
}

- (void)__remove {
    pthread_mutex_lock(&_mutex);
    if (_data.count == 0) {
        pthread_cond_wait(&_cond, &_mutex);
    }
    [_data removeLastObject];
    NSLog(@"remove");
    pthread_mutex_unlock(&_mutex);
}

- (void)__add {
    pthread_mutex_lock(&_mutex);
    [_data addObject:@"test"];
    NSLog(@"add");
    pthread_cond_signal(&_cond);
//    pthread_cond_broadcast(&_cond); // 广播：通知所有等待的条件
    pthread_mutex_unlock(&_mutex);
}

- (void)dealloc
{
    pthread_mutex_destroy(&_mutex);
    pthread_cond_destroy(&_cond);
}

@end

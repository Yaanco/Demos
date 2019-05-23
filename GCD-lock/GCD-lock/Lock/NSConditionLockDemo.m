//
//  NSConditionLockDemo.m
//  GCD-lock
//
//  Created by Yaanco on 2019/5/11.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "NSConditionLockDemo.h"

@interface NSConditionLockDemo ()
@property (nonatomic, strong) NSConditionLock *condLock;
@end

@implementation NSConditionLockDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.condLock = [[NSConditionLock alloc] initWithCondition:0];
        self.condLock = [[NSConditionLock alloc] init]; // 默认condition是0
    }
    return self;
}

- (void)otherTest {
    [[[NSThread alloc] initWithTarget:self selector:@selector(__one) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__two) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__three) object:nil] start];
}

- (void)__one {
//    [self.condLock lockWhenCondition:0];
    [self.condLock lock]; // 不管condition是多少，都能加锁
    NSLog(@"one - %@",[NSThread currentThread]);
    [self.condLock unlockWithCondition:1];
}

- (void)__two {
    [self.condLock lockWhenCondition:1];
    NSLog(@"two - %@",[NSThread currentThread]);
    [self.condLock unlockWithCondition:2];
}

- (void)__three {
    [self.condLock lockWhenCondition:2];
    NSLog(@"three - %@",[NSThread currentThread]);
    [self.condLock unlock];
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
}

@end

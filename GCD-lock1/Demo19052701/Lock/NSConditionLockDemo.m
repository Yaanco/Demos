//
//  NSConditionLockDemo.m
//  Demo19052701
//
//  Created by Yaanco on 2019/5/28.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "NSConditionLockDemo.h"

@interface NSConditionLockDemo ()
@property (nonatomic, strong) NSConditionLock *conditionLock;
@end

@implementation NSConditionLockDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        _conditionLock = [[NSConditionLock alloc] initWithCondition:1];
    }
    return self;
}

- (void)otherTest {
    [[[NSThread alloc] initWithTarget:self selector:@selector(__two) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__one) object:nil] start];
}

- (void)__one {
    [_conditionLock lockWhenCondition:1];
    NSLog(@"one");
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"-- main");
        sleep(2);
    });
    [_conditionLock unlockWithCondition:2];
}

- (void)__two {
    [_conditionLock lockWhenCondition:2];
    NSLog(@"two");
    [_conditionLock unlock];
}

@end

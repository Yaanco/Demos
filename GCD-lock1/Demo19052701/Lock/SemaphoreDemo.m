//
//  SemaphoreDemo.m
//  Demo19052701
//
//  Created by Yaanco on 2019/5/28.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "SemaphoreDemo.h"

#define SemaphoreBegin \
static dispatch_semaphore_t semaphore; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
    semaphore = dispatch_semaphore_create(1); \
}); \
dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER); \

#define SemaphoreEnd \
dispatch_semaphore_signal(semaphore); \

@interface SemaphoreDemo ()
@property (nonatomic, strong) dispatch_semaphore_t semaphore;
@property (nonatomic, strong) dispatch_semaphore_t moneySemaphore;
@property (nonatomic, strong) dispatch_semaphore_t ticketSemaphore;
@end

@implementation SemaphoreDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        _semaphore = dispatch_semaphore_create(5);
        _moneySemaphore = dispatch_semaphore_create(1);
        _ticketSemaphore = dispatch_semaphore_create(1);
    }
    return self;
}

- (void)__saveMoney {
    dispatch_semaphore_wait(_moneySemaphore, DISPATCH_TIME_FOREVER);
    [super __saveMoney];
    dispatch_semaphore_signal(_moneySemaphore);
}

- (void)__drawMoney {
    dispatch_semaphore_wait(_moneySemaphore, DISPATCH_TIME_FOREVER);
    [super __drawMoney];
    dispatch_semaphore_signal(_moneySemaphore);
}

- (void)__saleTicket {
    SemaphoreBegin
    [super __saleTicket];
    SemaphoreEnd
}

- (void)otherTest {
    for (int i = 0; i < 20; i++) {
        [[[NSThread alloc] initWithTarget:self selector:@selector(__test) object:nil] start];
    }
}

- (void)__test {
    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"test - %@",[NSThread currentThread]);
    sleep(2.0);
    dispatch_semaphore_signal(_semaphore);
}

@end

//
//  NSLockDemo.m
//  GCD-lock
//
//  Created by Yaanco on 2019/5/11.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "NSLockDemo.h"

@interface NSLockDemo ()
@property (nonatomic, strong) NSLock *moneyLock;
@property (nonatomic, strong) NSLock *ticketLock;
@end

@implementation NSLockDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.moneyLock = [[NSLock alloc] init];
        self.ticketLock = [[NSLock alloc] init];
    }
    return self;
}

- (void)__saveMoney {
    [self.moneyLock lock];
    [super __saveMoney];
    [self.moneyLock unlock];
}

- (void)__drawMoney {
    [self.moneyLock lock];
    [super __drawMoney];
    [self.moneyLock unlock];
}

- (void)__saleTicket {
    [self.ticketLock lock];
    [super __saleTicket];
    [self.ticketLock unlock];
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
}
@end

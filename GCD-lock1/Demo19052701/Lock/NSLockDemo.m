//
//  NSLockDemo.m
//  Demo19052701
//
//  Created by Yaanco on 2019/5/27.
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
        _moneyLock = [[NSLock alloc] init];
        _ticketLock = [[NSLock alloc] init];
    }
    return self;
}

- (void)__saveMoney {
    [_moneyLock lock];
    [super __saveMoney];
    [_moneyLock unlock];
}

- (void)__drawMoney {
    [_moneyLock lock];
    [super __drawMoney];
    [_moneyLock unlock];
}

- (void)__saleTicket {
    [_ticketLock lock];
    [super __saleTicket];
    [_ticketLock unlock];
}

@end

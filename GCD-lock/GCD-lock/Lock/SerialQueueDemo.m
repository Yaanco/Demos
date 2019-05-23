//
//  SerialQueueDemo.m
//  GCD-lock
//
//  Created by Yaanco on 2019/5/11.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "SerialQueueDemo.h"

@interface SerialQueueDemo ()
@property (nonatomic, strong) dispatch_queue_t moneyQueue;
@property (nonatomic, strong) dispatch_queue_t ticketQueue;
@end

@implementation SerialQueueDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.moneyQueue = dispatch_queue_create("moneyQueue", DISPATCH_QUEUE_SERIAL);
        self.ticketQueue = dispatch_queue_create("ticketQueue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)__saveMoney {
    dispatch_sync(self.moneyQueue, ^{
        [super __saveMoney];
    });
}

- (void)__drawMoney {
    dispatch_sync(self.moneyQueue, ^{
        [super __drawMoney];
    });
}

- (void)__saleTicket {
    dispatch_sync(self.ticketQueue, ^{
        [super __saleTicket];
    });
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
}

@end

//
//  SerialQueueDemo.m
//  Demo19052701
//
//  Created by Yaanco on 2019/5/28.
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
        _moneyQueue = dispatch_queue_create("moneyQueue", DISPATCH_QUEUE_SERIAL);
        _ticketQueue = dispatch_queue_create("ticketQueue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)__saveMoney {
    dispatch_sync(_moneyQueue, ^{
        [super __saveMoney];
    });
}

- (void)__drawMoney {
    dispatch_sync(_moneyQueue, ^{
        [super __drawMoney];
    });
}

- (void)__saleTicket {
    dispatch_sync(_ticketQueue, ^{
        [super __saleTicket];
    });
}

@end

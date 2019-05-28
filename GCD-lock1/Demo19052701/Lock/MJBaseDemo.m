//
//  MJBaseDemo.m
//  Demo19052701
//
//  Created by Yaanco on 2019/5/27.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "MJBaseDemo.h"

@interface MJBaseDemo ()
@property (nonatomic, assign) NSUInteger ticketsCount;
@property (nonatomic, assign) NSUInteger money;
@end

@implementation MJBaseDemo

- (void)moneyTest {
    self.money = 100;
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self __saveMoney];
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self __drawMoney];
        }
    });
}

- (void)__saveMoney {
    NSUInteger oldMoney = self.money;
    sleep(.2);
    oldMoney += 50;
    self.money = oldMoney;
    NSLog(@"存50，还剩%ld元， - %@",oldMoney,[NSThread currentThread]);
}

- (void)__drawMoney {
    NSUInteger oldMoney = self.money;
    sleep(.2);
    oldMoney -= 20;
    self.money = oldMoney;
    NSLog(@"取20，还剩%ld元， - %@",oldMoney,[NSThread currentThread]);
}



- (void)__saleTicket {
    NSUInteger oldTicketsCount = self.ticketsCount;
    sleep(.2);
    oldTicketsCount--;
    self.ticketsCount = oldTicketsCount;
    NSLog(@"还剩%ld张票 - %@",oldTicketsCount,[NSThread currentThread]);
}

- (void)ticketTest {
    self.ticketsCount = 15;
    
//    for (int i = 0; i < 10; i++) {
//        [[[NSThread alloc] initWithTarget:self selector:@selector(__saleTicket) object:nil] start];
//    }
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i < 5; i++) {
            [self __saleTicket];
        }
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i < 5; i++) {
            [self __saleTicket];
        }
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i < 5; i++) {
            [self __saleTicket];
        }
    });
}

- (void)otherTest {}

@end

//
//  ViewController.m
//  Demo19052701
//
//  Created by Yaanco on 2019/5/27.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, assign) NSUInteger ticketsCount;
@property (nonatomic, assign) NSUInteger money;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self saleTickets];
    [self moneyTest];
}

- (void)moneyTest {
    self.money = 100;
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self saveMoney];
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self drawMoney];
        }
    });
}

- (void)saveMoney {
    NSUInteger oldMoney = self.money;
    sleep(.2);
    oldMoney += 50;
    self.money = oldMoney;
    NSLog(@"存50，还剩%ld元， - %@",oldMoney,[NSThread currentThread]);
}

- (void)drawMoney {
    NSUInteger oldMoney = self.money;
    sleep(.2);
    oldMoney -= 20;
    self.money = oldMoney;
    NSLog(@"取20，还剩%ld元， - %@",oldMoney,[NSThread currentThread]);
}

- (void)saleTicket {
    NSUInteger oldTicketsCount = self.ticketsCount;
    sleep(.2);
    oldTicketsCount--;
    self.ticketsCount = oldTicketsCount;
    NSLog(@"还剩%ld张票",oldTicketsCount);
}

- (void)saleTickets {
    self.ticketsCount = 15;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i < 5; i++) {
            [self saleTicket];
        }
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i < 5; i++) {
            [self saleTicket];
        }
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i < 5; i++) {
            [self saleTicket];
        }
    });
}

@end

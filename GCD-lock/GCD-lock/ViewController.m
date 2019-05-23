//
//  ViewController.m
//  GCD-lock
//
//  Created by Yaanco on 2019/5/9.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "ViewController.h"
#import "OSSpinLockDemo.h"
#import "OSSpinLockDemo2.h"
#import "OSUnfairLockDemo.h"
#import "MutexDemo.h"
#import "MutexDemo3.h"
#import "NSLockDemo.h"
#import "NSConditionDemo.h"
#import "NSConditionLockDemo.h"
#import "SerialQueueDemo.h"
#import "SemaphoreDemo.h"
#import "SynchronizedDemo.h"
#import "RWLockDemo.h"
#import "BarrierDemo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    OSSpinLockDemo *demo = [[OSSpinLockDemo alloc] init];
//    [demo moneyTest];
//    [demo ticketTest];
    
//    OSSpinLockDemo2 *demo2 = [[OSSpinLockDemo2 alloc] init];
//    [demo2 ticketTest];
//    [demo2 moneyTest];
    
//    OSUnfairLockDemo *demo3 = [[OSUnfairLockDemo alloc] init];
//    [demo3 moneyTest];
//    [demo3 ticketTest];
    
//    MutexDemo *demo4 = [[MutexDemo alloc] init];
//    [demo4 moneyTest];
//    [demo4 ticketTest];
//    [demo4 otherTest];
    
//    MutexDemo3 *demo4 = [[MutexDemo3 alloc] init];
//    [demo4 otherTest];
    
//    NSLockDemo *demo5 = [[NSLockDemo alloc] init];
//    [demo5 moneyTest];
    
//    NSConditionDemo *demo6 = [[NSConditionDemo alloc] init];
//    [demo6 otherTest];
    
//    NSConditionLockDemo *demo7 = [[NSConditionLockDemo alloc] init];
//    [demo7 otherTest];

//    SerialQueueDemo *demo8 = [[SerialQueueDemo alloc] init];
//    [demo8 moneyTest];
//    [demo8 ticketTest];
    
//    SemaphoreDemo *demo9 = [[SemaphoreDemo alloc] init];
//    [demo9 otherTest];
//    [demo9 moneyTest];
//    [demo9 ticketTest];
    
//    SynchronizedDemo *demo10 = [[SynchronizedDemo alloc] init];
//    [demo10 moneyTest];
//    [demo10 ticketTest];
//    [demo10 otherTest];
    
//    RWLockDemo *demo11 = [[RWLockDemo alloc] init];
//    [demo11 otherTest];
    
    BarrierDemo *demo12 = [[BarrierDemo alloc] init];
    [demo12 otherTest];
}

@end

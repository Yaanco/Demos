//
//  ViewController.m
//  Demo19052701
//
//  Created by Yaanco on 2019/5/27.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "ViewController.h"
#import "OSSpinLockDemo.h"
#import "OSSpinLockDemo2.h"
#import "OSUnfairLockDemo.h"
#import "MutexDemo.h"
#import "MutexDemo2.h"
#import "MutexDemo3.h"
#import "NSLockDemo.h"
#import "NSConditionDemo.h"
#import "NSConditionLockDemo.h"
#import "SerialQueueDemo.h"
#import "SemaphoreDemo.h"
#import "SynchronizedDemo.h"
#import "PthreadrwlockDemo.h"
#import "BarrierDemo.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    MJBaseDemo *demo = [[OSSpinLockDemo alloc] init];
//    [demo moneyTest];
//    [demo ticketTest];
    
//    MJBaseDemo *demo = [[OSSpinLockDemo2 alloc] init];
//    [demo moneyTest];
//    [demo ticketTest];

//    MJBaseDemo *demo = [[OSUnfairLockDemo alloc] init];
//    [demo moneyTest];
//    [demo ticketTest];
    
//    MJBaseDemo *demo = [[MutexDemo alloc] init];
//    [demo moneyTest];
//    [demo ticketTest];
    
//    MJBaseDemo *demo = [[MutexDemo3 alloc] init];
//    [demo otherTest];
    
//    MJBaseDemo *demo = [[NSLockDemo alloc] init];
//    [demo moneyTest];
//    [demo ticketTest];
    
//    MJBaseDemo *demo = [[NSConditionDemo alloc] init];
//    [demo otherTest];
    
//    MJBaseDemo *demo = [[NSConditionLockDemo alloc] init];
//    [demo otherTest];
    
//    MJBaseDemo *demo = [[SerialQueueDemo alloc] init];
//    [demo moneyTest];
//    [demo ticketTest];
    
    
//    MJBaseDemo *demo = [[SemaphoreDemo alloc] init];
//    [demo otherTest];
//    [demo moneyTest];
//    [demo ticketTest];
    
//    MJBaseDemo *demo = [[SynchronizedDemo alloc] init];
//    [demo otherTest];
//    [demo moneyTest];
//    [demo ticketTest];
    
//    MJBaseDemo *demo = [[PthreadrwlockDemo alloc] init];
//    [demo otherTest];
    
    MJBaseDemo *demo = [[BarrierDemo alloc] init];
    [demo otherTest];
}



@end

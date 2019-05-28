//
//  ViewController.m
//  GCD-queue
//
//  Created by Yaanco on 2019/5/23.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self test0];
//    [self test1];
//    [self test2];
//    [self test3];
//    [self test4];
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_queue_t queue1 = dispatch_queue_create("queue1", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue2 = dispatch_queue_create("queue2", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue3 = dispatch_get_main_queue();
    //[self test5:queue3];
    
    [self test6:queue];
}

- (void)test6:(dispatch_queue_t)queue {
    NSLog(@"-- begin");
    dispatch_async(queue, ^{
        NSLog(@"1 - %@",[NSThread currentThread]);
        dispatch_queue_t serialQueue = dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL);
        dispatch_async(queue, ^{
           NSLog(@"2 - %@",[NSThread currentThread]);
        });
        NSLog(@"3 - %@",[NSThread currentThread]);
    });
    NSLog(@"-- end");
}

- (void)test5:(dispatch_queue_t)queue {
    NSLog(@"-- begin");
    // queue1死锁 queue3死锁
//    dispatch_sync(queue, ^{
//        NSLog(@"1 - %@",[NSThread currentThread]);
//        dispatch_sync(queue, ^{
//            NSLog(@"2 - %@",[NSThread currentThread]);
//        });
//    });
    
    // queue3死锁
//    dispatch_sync(queue, ^{
//        NSLog(@"3 - %@",[NSThread currentThread]);
//        dispatch_async(queue, ^{
//            NSLog(@"4 - %@",[NSThread currentThread]);
//        });
//    });
    
    // queue1死锁 queue3死锁
//    dispatch_async(queue, ^{
//        NSLog(@"5 - %@",[NSThread currentThread]);
//        dispatch_sync(queue, ^{
//            NSLog(@"6 - %@",[NSThread currentThread]);
//        });
//    });
    
    dispatch_async(queue, ^{
        NSLog(@"7 - %@",[NSThread currentThread]);
        dispatch_async(queue, ^{
            NSLog(@"8 - %@",[NSThread currentThread]);
        });
    });
    NSLog(@"-- end");
}

// 死锁
- (void)test4 {
    NSLog(@"-- begin");
    dispatch_queue_t queue1 = dispatch_queue_create("queue1", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue1, ^{
        NSLog(@"1 - %@",[NSThread currentThread]);
        dispatch_sync(queue1, ^{
            NSLog(@"2 - %@",[NSThread currentThread]);
        });
    });
    NSLog(@"-- end");
}

// 死锁
- (void)test3 {
    NSLog(@"-- begin");
    dispatch_queue_t queue1 = dispatch_queue_create("queue1", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue1, ^{
        NSLog(@"1 - %@",[NSThread currentThread]);
        dispatch_sync(queue1, ^{
            NSLog(@"2 - %@",[NSThread currentThread]);
        });
    });
    NSLog(@"-- end");
}

// 死锁
- (void)test2 {
    NSLog(@"-- begin");
    dispatch_queue_t queue3 = dispatch_get_main_queue();
    dispatch_sync(queue3, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"任务1 - %@",[NSThread currentThread]);
        }
    });
    NSLog(@"-- end");
}

- (void)test1 {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_queue_t queue1 = dispatch_queue_create("queue1", DISPATCH_QUEUE_SERIAL); // GCD中不需要调用release释放
    dispatch_queue_t queue2 = dispatch_queue_create("queue2", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue3 = dispatch_get_main_queue(); // 主队列，也是一个串行队列，任务必须在主线程同步执行
    // 创建两个新线程，放到并发队列中，同时执行任务
    dispatch_async(queue3, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"任务1 - %@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue3, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"任务2 - %@",[NSThread currentThread]);
        }
    });
}

- (void)test0 {
    NSLog(@"-- begin");
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_queue_t queue1 = dispatch_queue_create("queue1", DISPATCH_QUEUE_SERIAL); // 不产生死锁，因为这个不是主队列
    dispatch_queue_t queue2 = dispatch_queue_create("queue2", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue3 = dispatch_get_main_queue(); // 产生死锁
    // 同步执行，不管队列是哪种方式，都不会开启新线程
    dispatch_sync(queue3, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"任务1 - %@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue3, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"任务2 - %@",[NSThread currentThread]);
        }
    });
    NSLog(@"-- end");
}

@end

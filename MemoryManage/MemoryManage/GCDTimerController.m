//
//  GCDTimerController.m
//  MemoryManage
//
//  Created by Yaanco on 2019/5/29.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "GCDTimerController.h"
#import "YCTimer.h"

@interface GCDTimerController ()
@property (nonatomic, strong) dispatch_source_t timer;
@property (nonatomic, copy) NSString *taskName;
@end

@implementation GCDTimerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self GCDTimer];
    
    self.taskName = [YCTimer executeTask:^{
        NSLog(@"%s",__func__);
    } start:2.0 interval:1.0 repeats:YES async:NO];
}

- (void)GCDTimer {
    // GCD定时器直接由内核驱动，精确度比较高，不依赖runloop
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), 1 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
//        NSLog(@"timerTest");
        NSLog(@"%s",__func__);
    });
    dispatch_resume(timer);
    self.timer = timer;
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
    [YCTimer cancelTask:_taskName];
}

@end

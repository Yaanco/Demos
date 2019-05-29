//
//  TimerTest.m
//  MemoryManage
//
//  Created by Yaanco on 2019/5/29.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "TimerTest.h"

//static dispatch_source_t timer_;

@implementation TimerTest

//+ (void)initialize {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//
//    });
//}

//+ (dispatch_source_t)excuteTask:(void (^)(void))task start:(NSTimeInterval)start interval:(NSTimeInterval)interval async:(BOOL)async repeats:(BOOL)repeats {
////    if (!task || start < 0 || (interval <= 0 && repeats)) return nil;
//    dispatch_queue_t queue = async ? dispatch_get_global_queue(0, 0) : dispatch_get_main_queue();
//    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//    dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, start * NSEC_PER_SEC), interval * NSEC_PER_SEC, 0);
////    dispatch_semaphore_wait(semaphore_, DISPATCH_TIME_FOREVER);
////    NSString *name = [NSString stringWithFormat:@"%zd",timers_.count];
////    timers_[name] = timer;
////    dispatch_semaphore_signal(semaphore_);
//    dispatch_source_set_event_handler(timer, ^{
//        task();
//        if (!repeats) {
////            [self cancelTask:name];
//        }
//    });
//    dispatch_resume(timer);
//    return timer;
//}

+ (void)execute {
    NSLog(@"%s",__func__);
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
}

@end

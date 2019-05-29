//
//  YCTimer.m
//  MemoryManage
//
//  Created by Yaanco on 2019/5/29.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "YCTimer.h"

static NSMutableDictionary *timers_;
static dispatch_semaphore_t semaphore;

#define SemaphoreWait dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
#define SemaphoreSignal dispatch_semaphore_signal(semaphore)

@implementation YCTimer

+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timers_ = [NSMutableDictionary dictionary];
        semaphore = dispatch_semaphore_create(1);
    });
}

+ (NSString *)executeTask:(void (^)(void))task start:(NSTimeInterval)start interval:(NSTimeInterval)interval repeats:(BOOL)repeats async:(BOOL)async {
    if (!task || start < 0 || (interval <= 0 && repeats)) return nil;
    dispatch_queue_t queue = async ? dispatch_get_global_queue(0, 0) : dispatch_get_main_queue();
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, start * NSEC_PER_SEC), interval * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    SemaphoreWait;
    NSString *taskName = [NSString stringWithFormat:@"%ld",timers_.count];
    timers_[taskName] = timer;
    SemaphoreSignal;
    dispatch_source_set_event_handler(timer, ^{
        task();
        if (!repeats) {
            [self cancelTask:taskName];
        }
    });
    dispatch_resume(timer);
    return taskName;
}

+ (void)cancelTask:(NSString *)name {
    if (name.length == 0) return;
    SemaphoreWait;
    dispatch_source_t timer = timers_[name];
    if (timer) {
        dispatch_source_cancel(timers_[name]);
        [timers_ removeObjectForKey:name];
    }
    SemaphoreSignal;
}

@end

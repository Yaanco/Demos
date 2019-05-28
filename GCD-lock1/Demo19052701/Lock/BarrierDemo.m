//
//  BarrierDemo.m
//  Demo19052701
//
//  Created by Yaanco on 2019/5/28.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "BarrierDemo.h"

@interface BarrierDemo ()
@property (nonatomic, strong) dispatch_queue_t rwQueue;
@end

@implementation BarrierDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        _rwQueue = dispatch_queue_create("rwQueue", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

- (void)otherTest {
    for (int i = 0; i < 10; i++) {
        [self __read];
        [self __read];
        [self __write];
    }
}

- (void)__read {
    dispatch_async(_rwQueue, ^{
        sleep(1.);
        NSLog(@"%s",__func__);
    });
}

- (void)__write {
    dispatch_barrier_async(_rwQueue, ^{
        sleep(1.);
        NSLog(@"%s",__func__);
    });
}

@end

//
//  BarrierDemo.m
//  GCD-lock
//
//  Created by Yaanco on 2019/5/11.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "BarrierDemo.h"

@interface BarrierDemo ()
@property (nonatomic, strong) dispatch_queue_t rwLock;
@end

@implementation BarrierDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.rwLock = dispatch_queue_create("rw-queue", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

- (void)otherTest {
    for (int i = 0; i < 10; i++) {
        [self read];
        [self read];
        [self read];
        [self write];
    }
}

- (void)read {
    dispatch_async(self.rwLock, ^{
        sleep(1);
        NSLog(@"read");
    });
}

- (void)write {
    dispatch_barrier_async(self.rwLock, ^{
        sleep(1);
        NSLog(@"write");
    });
}

@end

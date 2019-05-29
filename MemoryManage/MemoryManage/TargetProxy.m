//
//  TargetProxy.m
//  MemoryManage
//
//  Created by Yaanco on 2019/5/28.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "TargetProxy.h"

@implementation TargetProxy

+ (instancetype)proxyWithTarget:(id)target {
    TargetProxy *targetProxy = [[TargetProxy alloc] init];
    targetProxy.target = target;
    return targetProxy;
}

//- (void)timerTest {
//    NSLog(@"%s",__func__);
//}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return _target;
}

//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//
//}

- (void)dealloc
{
    NSLog(@"%s",__func__);
}

@end

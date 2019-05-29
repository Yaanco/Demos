//
//  YCProxy.m
//  MemoryManage
//
//  Created by Yaanco on 2019/5/28.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "YCProxy.h"

@implementation YCProxy

+ (instancetype)proxyWithTarget:(id)target {
    YCProxy *proxy = [YCProxy alloc];
    proxy.target = target;
    return proxy;
}

- (void)timerTest {
    NSLog(@"%s",__func__);
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [_target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:_target];
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
}

@end

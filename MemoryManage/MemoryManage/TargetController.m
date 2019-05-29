//
//  TargetController.m
//  MemoryManage
//
//  Created by Yaanco on 2019/5/28.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "TargetController.h"
#import "TargetProxy.h"
#import "YCProxy.h"

@interface TargetController ()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) CADisplayLink *link;
@end

@implementation TargetController

- (void)viewDidLoad {
    [super viewDidLoad];

    TargetProxy *target = [TargetProxy proxyWithTarget:self];
    YCProxy *proxy = [YCProxy proxyWithTarget:self];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:proxy selector:@selector(timerTest) userInfo:nil repeats:YES];
    
    _link = [CADisplayLink displayLinkWithTarget:proxy selector:@selector(linkTest)];
    [_link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)timerTest {
    NSLog(@"%s",__func__);
}

- (void)linkTest {
    NSLog(@"%s",__func__);
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
    [_timer invalidate];
    [_link invalidate];
}

@end

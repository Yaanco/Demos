//
//  RecycleController.m
//  MemoryManage
//
//  Created by Yaanco on 2019/5/28.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "RecycleController.h"

@interface RecycleController ()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) CADisplayLink *link;
@end

@implementation RecycleController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 会引起循环引用
    // 不能使用weakSelf解决，weakSelf适用于block
    //_timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTest) userInfo:nil repeats:YES];
    
    _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(linkTest:)];
    [_link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)timerTest {
    NSLog(@"%s",__func__);
}

- (void)linkTest:(CADisplayLink *)sender {
    NSLog(@"%s",__func__);
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
    [_timer invalidate];
    [_link invalidate];
}

@end

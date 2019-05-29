//
//  ViewController.m
//  MemoryManage
//
//  Created by Yaanco on 2019/5/28.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "ViewController.h"
#import "TargetProxy.h"
#import "YCProxy.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self __test];
}

- (void)__test {
    TargetProxy *proxy1 = [TargetProxy proxyWithTarget:self];
    YCProxy *proxy2 = [YCProxy proxyWithTarget:self];
    NSLog(@"%d %d",
          [proxy1 isKindOfClass:[ViewController class]], // 打印结果是1，因为isKindOfClass方法也直接进行了消息转发，相当于是self调用了该方法
          [proxy2 isKindOfClass:[ViewController class]]
          );
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
}

@end

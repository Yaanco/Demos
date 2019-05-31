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
#import "YCPerson.h"
#import "YCDog.h"

extern void _objc_autoreleasePoolPrint(void);

@interface ViewController ()
@property (nonatomic, copy) NSString *name;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self __test];
//    [self __taggedPointerTest];
//    [self test1];
//    [self test2];
//    [self test3];
//    [self test4];
    NSLog(@"111");
    @autoreleasepool {
        YCDog *dog = [[YCDog alloc] init];
        _objc_autoreleasePoolPrint();
    }
    NSLog(@"222");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s",__func__);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%s",__func__);
}

- (void)test4 {
    YCPerson *p1 = [[YCPerson alloc] init];
    p1.age = 15;
    p1.weight = 50;
    p1.arr = @[@1,@2];
    p1.mutableArr = [NSMutableArray arrayWithObjects:@"a",@"b", nil];
    NSLog(@"%@",p1);
    
    YCPerson *p2 = [p1 copy];
    p2.age = 20;
    [p2.mutableArr addObject:@"c"];
    NSLog(@"%@",p1);
    NSLog(@"%@",p2);
}

- (void)test3 {
    NSMutableString *str1 = [NSMutableString stringWithFormat:@"111"];
    NSString *str2 = str1;
    NSLog(@"%p %p %@ %@",str1,str2,str1,str2);
    [str1 appendFormat:@"222"];
    NSLog(@"%p %p %@ %@",str1,str2,str1,str2);
    
    _str = str1;
    NSLog(@"%p %p %@ %@",_str,str2,_str,str2);
    self.str = str1;
    NSLog(@"%p %p %@ %@",_str,str2,_str,str2);
    [str1 appendFormat:@"333"];
    NSLog(@"%p %p %@ %@",_str,str2,_str,str2);
}

- (void)test2 {
    NSArray *arr2 = @[@1,@2];
    self.arr1 = arr2;
    NSLog(@"%p %p",_arr1,arr2);
    
    self.arr2 = [NSMutableArray arrayWithObjects:@"1",@"2", nil];
    [_arr2 addObject:@"3"];
}

- (void)test1 {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    for (int i = 0; i < 2000; i++) {
        dispatch_async(queue, ^{
            //self.name = [NSString stringWithFormat:@"abcdefghigklmnopqrstuvw"];
            self.name = [NSString stringWithFormat:@"abc"];
        });
    }
}

- (void)__taggedPointerTest {
    NSNumber *num1 = @1;
    NSNumber *num2 = @2;
    NSNumber *num3 = @3;
    NSLog(@"%p %p %p",num1,num2,num3);
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

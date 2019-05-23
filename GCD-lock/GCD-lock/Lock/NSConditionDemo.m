//
//  NSConditionDemo.m
//  GCD-lock
//
//  Created by Yaanco on 2019/5/11.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "NSConditionDemo.h"

@interface NSConditionDemo ()
@property (nonatomic, strong) NSCondition *condition;
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation NSConditionDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.condition = [[NSCondition alloc] init];
        self.data = [NSMutableArray array];
    }
    return self;
}

- (void)otherTest {
    [[[NSThread alloc] initWithTarget:self selector:@selector(__remove) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__add) object:nil] start];
}

- (void)__remove {
    [self.condition lock];
    if (self.data.count == 0) {
        [self.condition wait];
    }
    [self.data removeLastObject];
    NSLog(@"删除了数据 - %@",[NSThread currentThread]);
    [self.condition unlock];
}

- (void)__add {
    [self.condition lock];
    [self.data addObject:@"test"];
    NSLog(@"添加了数据 - %@",[NSThread currentThread]);
    [self.condition signal];
//    [self.condition broadcast];
    [self.condition unlock];
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
}

@end

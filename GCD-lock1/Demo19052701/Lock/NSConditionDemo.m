//
//  NSConditionDemo.m
//  Demo19052701
//
//  Created by Yaanco on 2019/5/28.
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
        _condition = [[NSCondition alloc] init];
        _data = [NSMutableArray array];
    }
    return self;
}

- (void)otherTest {
    for (int i = 0; i < 3; i++) {
        [[[NSThread alloc] initWithTarget:self selector:@selector(__remove) object:nil] start];
    }
    
    for (int i = 0; i < 3; i++) {
        [[[NSThread alloc] initWithTarget:self selector:@selector(__add) object:nil] start];
    }
}

- (void)__remove {
    [_condition lock];
    if (_data.count == 0) {
        [_condition wait];
    }
    [_data removeLastObject];
    NSLog(@"remove");
    [_condition unlock];
}

- (void)__add {
    [_condition lock];
    [_data addObject:@"test"];
    NSLog(@"add");
    [_condition unlock];
    [_condition signal]; // signal放到unlock之后比较好点
    //[_condition broadcast]; // 广播：通知所有等待的条件
}

@end

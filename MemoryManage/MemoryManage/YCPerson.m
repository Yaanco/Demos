//
//  YCPerson.m
//  MemoryManage
//
//  Created by Yaanco on 2019/5/30.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "YCPerson.h"

@implementation YCPerson

- (NSString *)description
{
    return [NSString stringWithFormat:@"age:%ld,weight:%f,%@,%p,%@,%p", _age,_weight,_arr,_arr,_mutableArr,_mutableArr];
}

- (id)copyWithZone:(NSZone *)zone {
    YCPerson *person = [[YCPerson allocWithZone:zone] init];
    person.age = _age;
    person.weight = _weight;
    person.arr = _arr;
    person.mutableArr = [[NSMutableArray alloc] initWithArray:_mutableArr copyItems:YES];
    return person;
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
}

@end

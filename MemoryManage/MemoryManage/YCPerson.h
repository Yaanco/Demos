//
//  YCPerson.h
//  MemoryManage
//
//  Created by Yaanco on 2019/5/30.
//  Copyright © 2019 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCPerson : NSObject <NSCopying>

@property (nonatomic, assign) NSUInteger age;
@property (nonatomic, assign) double weight;
@property (nonatomic, strong) NSArray *arr;
@property (nonatomic, strong) NSMutableArray *mutableArr;

@end

NS_ASSUME_NONNULL_END

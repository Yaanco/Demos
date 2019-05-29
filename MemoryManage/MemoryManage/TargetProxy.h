//
//  TargetProxy.h
//  MemoryManage
//
//  Created by Yaanco on 2019/5/28.
//  Copyright © 2019 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TargetProxy : NSObject

@property (nonatomic, weak) id target;
+ (instancetype)proxyWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END

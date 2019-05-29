//
//  TimerTest.h
//  MemoryManage
//
//  Created by Yaanco on 2019/5/29.
//  Copyright © 2019 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TimerTest : NSObject

//+ (dispatch_source_t)excuteTask:(void (^)(void))task start:(NSTimeInterval)start interval:(NSTimeInterval)interval async:(BOOL)async repeats:(BOOL)repeats;

+ (void)execute;

@end

NS_ASSUME_NONNULL_END

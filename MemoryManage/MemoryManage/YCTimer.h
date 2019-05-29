//
//  YCTimer.h
//  MemoryManage
//
//  Created by Yaanco on 2019/5/29.
//  Copyright © 2019 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCTimer : NSObject

+ (NSString *)executeTask:(void(^)(void))task start:(NSTimeInterval)start interval:(NSTimeInterval)interval repeats:(BOOL)repeats async:(BOOL)async;
+ (void)cancelTask:(NSString *)name;

@end

NS_ASSUME_NONNULL_END

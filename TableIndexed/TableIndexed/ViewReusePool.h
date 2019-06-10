//
//  ViewReusePool.h
//  TableIndexed
//
//  Created by Yaanco on 2019/6/5.
//  Copyright © 2019 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewReusePool : NSObject

- (UIView *)dequeueReusableView;
- (void)addUsingView:(UIView *)usingView;
- (void)reset;

@end

NS_ASSUME_NONNULL_END

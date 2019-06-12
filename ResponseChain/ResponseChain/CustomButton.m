//
//  CustomButton.m
//  ResponseChain
//
//  Created by Yaanco on 2019/6/11.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

// 只在圆形区域内点击有效
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
//    if (!self.userInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
//        return nil;
//    }
//    if ([self pointInside:point withEvent:event]) {
//        __block UIView *hit = nil;
//        [self.subviews enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            CGPoint convertPoint = [self convertPoint:point toView:obj];
//            hit = [obj hitTest:convertPoint withEvent:event];
//            if (hit) {
//                *stop = YES;
//            }
//        }];
//        if (hit) {
//            return hit;
//        }else{
//            return self;
//        }
//    }else{
//        return nil;
//    }
    
    
    // ================
//    if (!self.userInteractionEnabled || self.isHidden || self.alpha <= 0.01) return nil;
//    if (![self pointInside:point withEvent:event]) return nil;
//    for (UIView *subview in [self.subviews reverseObjectEnumerator]) {
//        CGPoint convertPoint = [subview convertPoint:point fromView:self];
//        UIView *hitTestView = [subview hitTest:convertPoint withEvent:event];
//        if (hitTestView) return hitTestView;
//    }
//    return self;
    
    // 扩大点击区域
    if (!self.userInteractionEnabled || self.isHidden || self.alpha <= 0.01) return nil;
    CGFloat inset = 120.0f - 150.0f;
    CGRect touchRect = CGRectInset(self.bounds, inset, inset);
    if (CGRectContainsPoint(touchRect, point)) {
        for (UIView *subview in [self.subviews reverseObjectEnumerator]) {
            CGPoint convertPoint = [subview convertPoint:point fromView:self];
            UIView *hitTestView = [subview hitTest:convertPoint withEvent:event];
            if (hitTestView) return hitTestView;
        }
        return self;
    }
    return nil;
}




//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//    CGFloat x1 = point.x;
//    CGFloat y1 = point.y;
//
//    CGFloat x2 = self.frame.size.width / 2;
//    CGFloat y2 = self.frame.size.height / 2;
//
//    double dis = sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
//    if (dis <= self.frame.size.width/2) {
//        return YES;
//    }else{
//        NSLog(@"非圆形区域");
//        return NO;
//    }
//}

@end

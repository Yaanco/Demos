//
//  ViewReusePool.m
//  TableIndexed
//
//  Created by Yaanco on 2019/6/5.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "ViewReusePool.h"

@interface ViewReusePool ()
@property (nonatomic, strong) NSMutableSet *waitUsedQueue;
@property (nonatomic, strong) NSMutableSet *usingQueue;
@end

@implementation ViewReusePool

- (instancetype)init
{
    self = [super init];
    if (self) {
        _waitUsedQueue = [NSMutableSet set];
        _usingQueue = [NSMutableSet set];
    }
    return self;
}

- (UIView *)dequeueReusableView {
    UIView *view = [_waitUsedQueue anyObject];
    if (view) {
        [_waitUsedQueue removeObject:view];
        [_usingQueue addObject:view];
        return view;
    }else{
        return nil;
    }
}

- (void)addUsingView:(UIView *)usingView {
    if(!usingView) return;
    [_usingQueue addObject:usingView];
}

- (void)reset {
    UIView *view = nil;
    while ((view = [_usingQueue anyObject])) {
        [_usingQueue removeObject:view];
        [_waitUsedQueue addObject:view];
    }
}

@end

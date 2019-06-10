//
//  IndexedTableView.m
//  TableIndexed
//
//  Created by Yaanco on 2019/6/5.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "IndexedTableView.h"
#import "ViewReusePool.h"

@interface IndexedTableView ()
{
    UIView *containerView;
    ViewReusePool *reusePool;
}
@end

@implementation IndexedTableView

- (void)reloadData {
    [super reloadData];
    
    if (!containerView) {
        containerView = [[UIView alloc] initWithFrame:CGRectZero];
        containerView.backgroundColor = [UIColor whiteColor];
        [self.superview insertSubview:containerView aboveSubview:self];
    }
    if (!reusePool) {
        reusePool = [[ViewReusePool alloc] init];
    }
    [reusePool reset];
    [self reloadIndexedBar];
}

- (void)reloadIndexedBar {
    NSArray <NSString *> *arrayTitles = nil;
    if ([self.indexedDataSource respondsToSelector:@selector(indexTitlesForIndexedTableView:)]) {
        arrayTitles = [self.indexedDataSource indexTitlesForIndexedTableView:self];
    }
    if (!arrayTitles || arrayTitles.count == 0) {
        [containerView setHidden:YES];
        return;
    }
    NSUInteger count = arrayTitles.count;
    CGFloat buttonWidth = 60;
    CGFloat buttonHeight = self.frame.size.height / count;
    for (int i = 0; i < count; i++) {
        NSString *title = [arrayTitles objectAtIndex:i];
        UIButton *button = (UIButton *)[reusePool dequeueReusableView];
        if (!button) {
            button = [[UIButton alloc] initWithFrame:CGRectZero];
            button.backgroundColor = [UIColor whiteColor];
            [reusePool addUsingView:button];
            NSLog(@"新创建了button");
        }else{
            NSLog(@"button重用了");
        }
        
        [containerView addSubview:button];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setFrame:CGRectMake(0, i*buttonHeight, buttonWidth, buttonHeight)];
    }
    [containerView setHidden:NO];
    containerView.frame = CGRectMake(self.frame.origin.x+self.frame.size.width-buttonWidth, self.frame.origin.y, buttonWidth, self.frame.size.height);
}

@end

//
//  IndexedTableView.h
//  TableIndexed
//
//  Created by Yaanco on 2019/6/5.
//  Copyright © 2019 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol IndexedTableViewDataSource <NSObject>

- (NSArray <NSString *> *)indexTitlesForIndexedTableView:(UITableView *)tableView;

@end

@interface IndexedTableView : UITableView

@property (nonatomic, weak) id<IndexedTableViewDataSource> indexedDataSource;

@end

NS_ASSUME_NONNULL_END

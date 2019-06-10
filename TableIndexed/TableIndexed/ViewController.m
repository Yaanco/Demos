//
//  ViewController.m
//  TableIndexed
//
//  Created by Yaanco on 2019/6/5.
//  Copyright © 2019 Andy. All rights reserved.
//

#import "ViewController.h"
#import "IndexedTableView.h"

@interface ViewController ()<IndexedTableViewDataSource,UITableViewDelegate,UITableViewDataSource>
{
    UIButton *reloadBtn;
    NSMutableArray *dataSource;
    IndexedTableView *tableView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tableView = [[IndexedTableView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-60) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.indexedDataSource = self;
    [self.view addSubview:tableView];
    
    reloadBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 40)];
    reloadBtn.backgroundColor = [UIColor redColor];
    [reloadBtn setTitle:@"reloadTable" forState:UIControlStateNormal];
    [reloadBtn addTarget:self action:@selector(reloadAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:reloadBtn];
    
    dataSource = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        [dataSource addObject:@(i+1)];
    }
}

- (void)reloadAction {
    [tableView reloadData];
}

#pragma mark IndexedTableViewDataSource

- (NSArray<NSString *> *)indexTitlesForIndexedTableView:(UITableView *)tableView {
    static BOOL change = NO;
    if (change) {
        change = NO;
        return @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K"];
    }else{
        change = YES;
        return @[@"A",@"B",@"C",@"D",@"E",@"F"];
    }
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"reuseId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [[dataSource objectAtIndex:indexPath.row] stringValue];
    return cell;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}



@end

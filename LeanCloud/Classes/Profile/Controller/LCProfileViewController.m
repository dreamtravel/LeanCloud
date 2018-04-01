//
//  LCProfileViewController.m
//  LeanCloud
//
//  Created by Mac on 15/11/16.
//  Copyright © 2015年 Macmini. All rights reserved.
//

#import "LCProfileViewController.h"

@interface LCProfileViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) UITableView *tableView;


@property (nonatomic, strong) NSArray *array;
@end

@implementation LCProfileViewController

- (NSArray *)array {
    if (_array == nil) {
        _array = @[@"开通会员", @"QQ钱包", @"个性装扮", @"我的收藏", @"我的相册", @"我的文件"];
    }
    return _array;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupHeadView];
    [self setupTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)setupHeadView {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 64, 260, 60);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button setImage:[UIImage imageNamed:Re_qqstar1] forState:UIControlStateNormal];
    [button setTitle:@"梦行" forState:UIControlStateNormal];
    [self.view addSubview:button];
}

- (void)setupTableView {
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(10, 160, 320 * 0.7, 568 * 0.8);
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

#pragma mark - Table View DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = self.array[indexPath.row];
    [cell.textLabel setTextColor:[UIColor whiteColor]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO];
    NSLog(@"cell点击, %ld", (long)indexPath.row);
}

@end

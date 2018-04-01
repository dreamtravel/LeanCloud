//
//  LCContactController.m
//  LeanCloud
//
//  Created by Mac on 15/11/17.
//  Copyright © 2015年 Macmini. All rights reserved.
//

#import "LCContactController.h"
#import "LCSessionController.h"
#import "SKSTableView.h"
#import "SKSTableViewCell.h"

@interface LCContactController () <SKSTableViewDelegate>

@property (nonatomic, strong) NSArray *contents;

@end

@implementation LCContactController

- (NSArray *)contents
{
    if (!_contents) {
        _contents = @[
                      @[//1
                          @[@"我的好友", @"我的好友1",@"我的好友2"], //1-1
                          @[@"高中同学", @"高中同学1", @"高中同学2", @"高中同学3", @"高中同学4", @"高中同学5", @"高中同学6", @"高中同学7", @"高中同学8", @"高中同学9", @"高中同学10", @"高中同学11", @"高中同学12"], //1-2
                          @[@"我的电脑"]], //1-3
                      @[//2
                          @[@"朋友", @"朋友1", @"朋友2", @"朋友3"], //2-1
                          @[@"设备"], //2-2
                          @[@"亲戚", @"亲戚1", @"亲戚2", @"亲戚3", @"亲戚4", @"亲戚5"]] //2-3
                      ];
    }
    
    return _contents;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    SKSTableView *sksTableView = [[SKSTableView alloc] initWithFrame:self.tableView.bounds style:UITableViewStyleGrouped];
    sksTableView.SKSTableViewDelegate = self;
    self.tableView = sksTableView;

    [self setupNavigationBar];
}

- (void)setupNavigationBar {
    UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStyleDone target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightBarBtnItem;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:18.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = label;
    label.text = @"联系人";
    [label sizeToFit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
//返回外部cell数据的有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.contents count];
}
//返回外部cell数据每组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contents[section] count];
}
//返回内部cell数据每组有多少行
- (NSInteger)tableView:(SKSTableView *)tableView numberOfSubRowsAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.contents[indexPath.section][indexPath.row] count] - 1;
}

// 外部cell数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SKSTableViewCell";
    
    SKSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
        cell = [[SKSTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    cell.textLabel.text = self.contents[indexPath.section][indexPath.row][0];
    
    if ((indexPath.section == 0 && (indexPath.row == 1 || indexPath.row == 0)) || (indexPath.section == 1 && (indexPath.row == 0 || indexPath.row == 2)))
        cell.isExpandable = YES;
    else
        cell.isExpandable = NO;
    
    return cell;
}

// 内部cell数据模型
- (UITableViewCell *)tableView:(UITableView *)tableView cellForSubRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"UITableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.contents[indexPath.section][indexPath.row][indexPath.subRow]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (![[tableView cellForRowAtIndexPath:indexPath] isKindOfClass:[SKSTableViewCell class]]) {
        LCSessionController *vc = [[LCSessionController alloc] init];
        vc.title = @"会话";
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end

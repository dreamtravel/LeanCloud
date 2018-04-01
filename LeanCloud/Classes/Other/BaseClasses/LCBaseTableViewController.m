//
//  LCBaseTableViewController.m
//  LeanCloud
//
//  Created by Mac on 15/11/17.
//  Copyright © 2015年 Macmini. All rights reserved.
//

#import "LCBaseTableViewController.h"
#import "RESideMenu.h"

@interface LCBaseTableViewController () <RESideMenuDelegate>

@property (nonatomic, weak) UIBarButtonItem *leftBarBrnItem;

@end

@implementation LCBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获取根控制器
    RESideMenu *sideMenuViewController = (RESideMenu *)[UIApplication sharedApplication].keyWindow.rootViewController;
    _sideMenuViewController = sideMenuViewController;
    _sideMenuViewController.delegate = self;
    
    UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"我" style:UIBarButtonItemStyleDone target:self action:@selector(presentLeftMenuViewController)];
    _leftBarBrnItem = leftBarBtnItem;
    self.navigationItem.leftBarButtonItem = leftBarBtnItem;
}

- (void)presentLeftMenuViewController {
    [self.sideMenuViewController presentLeftMenuViewController];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}

#pragma mark - RESideMenu Delegate

- (void)sideMenu:(RESideMenu *)sideMenu didHideMenuViewController:(UIViewController *)menuViewController {
    
}

- (void)sideMenu:(RESideMenu *)sideMenu didShowMenuViewController:(UIViewController *)menuViewController {
    
}

@end

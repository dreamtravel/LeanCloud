//
//  LCEnterViewController.m
//  LeanCloud
//
//  Created by Mac on 15/11/16.
//  Copyright © 2015年 Macmini. All rights reserved.
//

#import "LCEnterViewController.h"
#import "LCRegisterViewController.h"

@interface LCEnterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *enterButton;

- (IBAction)enterBtnClick:(UIButton *)sender;
- (IBAction)newUserBtnClick:(UIButton *)sender;
- (IBAction)cannotEnterBtnClick:(UIButton *)sender;

@end

@implementation LCEnterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 登陆
- (IBAction)enterBtnClick:(UIButton *)sender {
    NSLog(@"登陆");
    [self.view endEditing:YES];
}

// 新用户
- (IBAction)newUserBtnClick:(UIButton *)sender {

}

// 无法登陆
- (IBAction)cannotEnterBtnClick:(UIButton *)sender {
    NSLog(@"无法登陆");
}
@end

//
//  LCRegisterViewController.m
//  LeanCloud
//
//  Created by Mac on 15/11/16.
//  Copyright © 2015年 Macmini. All rights reserved.
//

#import "LCRegisterViewController.h"

@interface LCRegisterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIButton *licenseButton;

- (IBAction)registerBtnClick:(UIButton *)sender;
- (IBAction)licenseBtnClick:(UIButton *)sender;
- (IBAction)showLicenseBtnClick:(UIButton *)sender;
- (IBAction)cancelBtnClick:(UIBarButtonItem *)sender;

@end

@implementation LCRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registerBtnClick:(UIButton *)sender {
    NSLog(@"注册");
    [self.view endEditing:YES];
}

- (IBAction)licenseBtnClick:(UIButton *)sender {
    NSLog(@"同意");
}

- (IBAction)showLicenseBtnClick:(UIButton *)sender {
    NSLog(@"显示许可协议");
    LCBrowserViewController *vc = [[LCBrowserViewController alloc] init];
    vc.loadStringURL = @"http://m.baidu.com";
    [self.navigationController pushViewController:vc animated:YES];
//    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)cancelBtnClick:(UIBarButtonItem *)sender {
    NSLog(@"取消");
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

//
//  LCNavigationController.m
//  LeanCloud
//
//  Created by Mac on 15/11/17.
//  Copyright © 2015年 Macmini. All rights reserved.
//

#import "LCNavigationController.h"

@interface LCNavigationController ()

@end

@implementation LCNavigationController

+ (void)initialize {
    // 设置导航条
    UINavigationBar *navBar = [UINavigationBar appearance];
    UIImage *image = [UIImage imageNamed:@"header_bg_ios7_ip4"];
    UIImage *newImage = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    [navBar setBackgroundImage:newImage forBarMetrics:UIBarMetricsDefault];
    [navBar setTintColor:[UIColor whiteColor]];
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    // 隐藏导航条底部的那条线
    navBar.shadowImage = [[UIImage alloc] init];
    // 设置导航栏的文字颜色
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    [item setTintColor:[UIColor whiteColor]];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        // push的时候隐藏底部栏
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end

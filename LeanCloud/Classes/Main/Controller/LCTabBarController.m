//
//  LCTabBarController.m
//  LeanCloud
//
//  Created by Mac on 15/11/16.
//  Copyright © 2015年 Macmini. All rights reserved.
//

#import "LCTabBarController.h"

#import "LCMessageController.h"
#import "LCContactController.h"
#import "LCDynamicController.h"
#import "LCNavigationController.h"

@interface LCTabBarController ()

@property (nonatomic, strong) LCMessageController *meaasgeController;
@property (nonatomic, strong) LCContactController *contactController;
@property (nonatomic, strong) LCDynamicController *dynamicController;

@end

@implementation LCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"tabbar_bg"];
    UIImage *newImage = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    [self.tabBar setBackgroundImage:newImage];

    [self setupAllChildViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 添加所有的子控制器

- (void)setupAllChildViewController {
    // 消息
    self.meaasgeController = [[LCMessageController alloc] init];
    [self setupChildViewController:self.meaasgeController image:[UIImage imageNamed:@"tab_recent_nor"]
                       selectImage:[UIImage imageNamed:@"tab_recent_press"] title:@"消息"];
    // 联系人
    self.contactController = [[LCContactController alloc] init];
    [self setupChildViewController:self.contactController image:[UIImage imageNamed:@"tab_buddy_nor"]
                       selectImage:[UIImage imageNamed:@"tab_buddy_press"] title:@"联系人"];
    // 动态
    self.dynamicController = [[LCDynamicController alloc] init];
    [self setupChildViewController:self.dynamicController image:[UIImage imageNamed:@"tab_qworld_nor"]
                       selectImage:[UIImage imageNamed:@"tab_qworld_press"] title:@"动态"];
}

- (void)setupChildViewController:(UIViewController *)vc image:(UIImage *)image selectImage:(UIImage *)selectImage title:(NSString *)title {
    vc.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectImage;
    LCNavigationController *nav = [[LCNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end

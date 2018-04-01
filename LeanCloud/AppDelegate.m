//
//  AppDelegate.m
//  LeanCloud
//
//  Created by Mac on 15/11/12.
//  Copyright © 2015年 Macmini. All rights reserved.
//

#import "AppDelegate.h"

#import "LCTabBarController.h"
#import "LCProfileViewController.h"
#import "RESideMenu.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 初始化SDk
    [[LCHttpTool sharedHttpTool] setupLeanCloudSDKWithOptions:launchOptions];

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    LCTabBarController *mainView = [[LCTabBarController alloc] init];
    LCProfileViewController *leftView = [[LCProfileViewController alloc] init];
    
    RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:mainView
                                                                    leftMenuViewController:leftView
                                                                   rightMenuViewController:nil];
    
    sideMenuViewController.backgroundImage = [UIImage imageNamed:Re_backgroud];
    sideMenuViewController.menuPreferredStatusBarStyle = UIStatusBarStyleLightContent;
    sideMenuViewController.contentViewShadowColor = [UIColor blackColor];
    sideMenuViewController.contentViewShadowOffset = CGSizeMake(0, 0);
    sideMenuViewController.contentViewShadowOpacity = 0.6;
    sideMenuViewController.contentViewShadowRadius = 12;
    sideMenuViewController.contentViewShadowEnabled = YES;
    self.window.rootViewController = sideMenuViewController;

    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {

}

@end

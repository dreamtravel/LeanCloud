//
//  AVOSTool.m
//  LeanCloud
//
//  Created by Mac on 15/12/4.
//  Copyright © 2015年 Macmini. All rights reserved.
//

#import "AVOSTool.h"
#import <AVOSCloud/AVOSCloud.h>

#define AppID         @"rwcfs92u3gwPq9t7ek2JbQOi"
#define AppKey        @"By8LehgYRNohMXgHuX4F83sK"

@implementation AVOSTool
SingletonM(AVOSTool)

- (void)setupSDKWithOptions:(NSDictionary *)launchOptions {
    // 初始化LeanCloud SDK
    [AVOSCloud setApplicationId:AppID clientKey:AppKey];
    // 使用美国站点
    //[AVOSCloud useAVCloudUS];
    // 跟踪统计应用的打开情况
    [AVAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
#ifdef DEBUG
    [AVAnalytics setAnalyticsEnabled:NO];
    [AVOSCloud setVerbosePolicy:kAVVerboseShow];
    [AVLogger addLoggerDomain:AVLoggerDomainIM];
    [AVLogger addLoggerDomain:AVLoggerDomainCURL];
    [AVLogger setLoggerLevelMask:AVLoggerLevelAll];
#endif
    
}

@end

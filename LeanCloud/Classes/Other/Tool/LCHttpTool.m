//
//  LCHttpTool.m
//  LeanCloud
//
//  Created by Mac on 15/12/4.
//  Copyright © 2015年 Macmini. All rights reserved.
//

#import "LCHttpTool.h"
#import "AVOSTool.h"

@implementation LCHttpTool
SingletonM(HttpTool)

- (void)setupLeanCloudSDKWithOptions:(NSDictionary *)launchOptions {
    [[AVOSTool sharedAVOSTool] setupSDKWithOptions:launchOptions];
}

@end

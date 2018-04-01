//
//  LCHttpTool.h
//  LeanCloud
//
//  Created by Mac on 15/12/4.
//  Copyright © 2015年 Macmini. All rights reserved.
//  对整个项目的网络管理的封装

#import <Foundation/Foundation.h>
#import "Singleton.h"

@interface LCHttpTool : NSObject
SingletonH(HttpTool)

- (void)setupLeanCloudSDKWithOptions:(NSDictionary *)launchOptions;

@end

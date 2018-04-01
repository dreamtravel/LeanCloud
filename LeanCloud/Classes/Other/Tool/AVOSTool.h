//
//  AVOSTool.h
//  LeanCloud
//
//  Created by Mac on 15/12/4.
//  Copyright © 2015年 Macmini. All rights reserved.
//  对于AVOS框架的数据封装

#import <Foundation/Foundation.h>
#import "Singleton.h"

@interface AVOSTool : NSObject
SingletonH(AVOSTool)

/**
 *  初始化AVOS SDK
 */
- (void)setupSDKWithOptions:(NSDictionary *)launchOptions;

@end

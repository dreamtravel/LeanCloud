//
//  LCMessage.h
//  LeanCloud
//
//  Created by Mac on 15/12/1.
//  Copyright © 2015年 Macmini. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger) {
    LCMessageTypeSelf = 0,
    LCMessageTypeYour = 1
}LCMessageType;

@interface LCMessage : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, assign) LCMessageType type;
@property (nonatomic, assign) BOOL hideTime;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)messageWithDict:(NSDictionary *)dict;

@end

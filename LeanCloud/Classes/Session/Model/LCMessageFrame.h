//
//  LCMessageFrame.h
//  LeanCloud
//
//  Created by Mac on 15/12/1.
//  Copyright © 2015年 Macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LCMessage;

@interface LCMessageFrame : NSObject

@property (nonatomic, strong) LCMessage *message;

@property (nonatomic, assign, readonly) CGRect timeFrame;
@property (nonatomic, assign, readonly) CGRect iconFrame;
@property (nonatomic, assign, readonly) CGRect textFrame;

@property (nonatomic, assign, readonly) CGFloat rowHeight;
@end

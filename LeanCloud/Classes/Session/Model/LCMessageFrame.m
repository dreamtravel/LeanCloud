//
//  LCMessageFrame.m
//  LeanCloud
//
//  Created by Mac on 15/12/1.
//  Copyright © 2015年 Macmini. All rights reserved.
//

#import "LCMessageFrame.h"
#import "LCMessage.h"

#define TIME_FONT [UIFont systemFontOfSize:12]
#define TEXT_FONT [UIFont systemFontOfSize:12]

@implementation LCMessageFrame

- (void)setMessage:(LCMessage *)message {
    _message = message;
    CGFloat margin = 5;
    //时间
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat timeH = 15;
    CGFloat timeW = screenW;
    CGFloat timeX = 0;
    CGFloat timeY = 0;
    if ( message.hideTime ) {
        _timeFrame = CGRectMake(0, 0, 0, 0);
    } else {
        _timeFrame = CGRectMake(timeX, timeY, timeW, timeH);
    }
    //头像
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    CGFloat iconY = CGRectGetMaxY(_timeFrame) + margin;
    CGFloat iconX = message.type == LCMessageTypeYour ? margin : (screenW - margin - iconW);
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    //文本
    CGSize textSize = [self sizeWithText:message.text andMaxSize:CGSizeMake(200, MAXFLOAT) andFont:TEXT_FONT];
    CGFloat textBtnW = textSize.width + 40;
    CGFloat textBtnH = textSize.height + 30;
    CGFloat textBtnY = iconY;
    CGFloat textBtnX = message.type == LCMessageTypeYour ? (CGRectGetMaxX(_iconFrame) + margin)
    : (iconX - margin - textBtnW);
    _textFrame = CGRectMake(textBtnX, textBtnY, textBtnW, textBtnH);
    
    _rowHeight = MAX(CGRectGetMaxY(_textFrame), CGRectGetMaxY(_iconFrame)) + margin;
}

- (CGSize)sizeWithText:(NSString *)text andMaxSize:(CGSize)maxSize andFont:(UIFont *)font {
    NSDictionary *attr = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}

@end

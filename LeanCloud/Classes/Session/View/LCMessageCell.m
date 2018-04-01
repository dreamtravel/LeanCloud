//
//  LCMessageCell.m
//  LeanCloud
//
//  Created by Mac on 15/12/1.
//  Copyright © 2015年 Macmini. All rights reserved.
//

#import "LCMessageCell.h"
#import "LCMessage.h"
#import "LCMessageFrame.h"

#define TIME_FONT [UIFont systemFontOfSize:12]
#define TEXT_FONT [UIFont systemFontOfSize:12]

@interface LCMessageCell ()

@property (nonatomic, weak) UILabel *lblTime;
@property (nonatomic, weak) UIImageView *imageViewIcon;
@property (nonatomic, weak) UIButton *btnText;


@end

@implementation LCMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 创建子控件
        UILabel *lblTime = [[UILabel alloc] init];
        lblTime.textAlignment = NSTextAlignmentCenter;
        lblTime.font = TIME_FONT;
        
        [self.contentView addSubview:lblTime];
        self.lblTime = lblTime;
        
        UIImageView *imageView = [[UIImageView alloc] init];
        
        [self.contentView addSubview:imageView];
        self.imageViewIcon = imageView;
        
        UIButton *btnText = [[UIButton alloc] init];
        btnText.titleLabel.font = TEXT_FONT;
        [btnText setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btnText.titleLabel.numberOfLines = 0;
        btnText.contentEdgeInsets = UIEdgeInsetsMake(15, 20, 15, 20);
        
        [self.contentView addSubview:btnText];
        self.btnText = btnText;
    }
    
    self.backgroundColor = [UIColor clearColor];
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"message_cell_id";
    LCMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[LCMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (void)setMessageFrame:(LCMessageFrame *)messageFrame {
    _messageFrame = messageFrame;
    [self setupData];
    [self setupFrame];
}

- (void)setupData {
    self.lblTime.text = self.messageFrame.message.time;
    if (self.messageFrame.message.type == LCMessageTypeSelf) {
        self.imageViewIcon.image = [UIImage imageNamed:@"me"];
    } else {
        self.imageViewIcon.image = [UIImage imageNamed:@"other"];
    }
    [self.btnText setTitle:self.messageFrame.message.text forState:UIControlStateNormal];
    
    //设置正文背景图
    NSString *imgNormalName, *imgHighlightedName;
    if (self.messageFrame.message.type == LCMessageTypeSelf) {
        imgNormalName = @"chat_send_nor";
        imgHighlightedName = @"char_send_press_pic";
        [self.btnText setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    } else {
        imgNormalName = @"chat_recive_nor";
        imgHighlightedName = @"char_recive_press_pic";
        [self.btnText setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    UIImage *imageNormal = [UIImage resizeableImageWithName:imgNormalName];
    UIImage *imageHighlight = [UIImage resizeableImageWithName:imgHighlightedName];

    [self.btnText setBackgroundImage:imageNormal forState:UIControlStateNormal];
    [self.btnText setBackgroundImage:imageHighlight forState:UIControlStateHighlighted];
}

- (void)setupFrame {
    self.lblTime.frame = self.messageFrame.timeFrame;
    self.lblTime.hidden = self.messageFrame.message.hideTime;
    self.imageViewIcon.frame = self.messageFrame.iconFrame;
    self.btnText.frame = self.messageFrame.textFrame;
}

@end

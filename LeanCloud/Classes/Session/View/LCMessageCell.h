//
//  LCMessageCell.h
//  LeanCloud
//
//  Created by Mac on 15/12/1.
//  Copyright © 2015年 Macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LCMessageFrame;

@interface LCMessageCell : UITableViewCell

@property (nonatomic, strong) LCMessageFrame *messageFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

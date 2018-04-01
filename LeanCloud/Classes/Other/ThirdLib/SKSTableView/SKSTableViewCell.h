//
//  SKSTableViewCell.h
//  SKSTableView
//
//  Created by Sakkaras on 26/12/13.
//  Copyright (c) 2013 Sakkaras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKSTableViewCell : UITableViewCell

/**
 *  标识外部cell是否可展开，默认NO
 */
@property (nonatomic, assign) BOOL isExpandable;

/**
 * 标识外部cell是否已经展开，默认NO
 */
@property (nonatomic, assign) BOOL isExpanded;

/**
 * Adds an indicator view into the receiver when the relevant cell is expanded.
 */
- (void)addIndicatorView;

/**
 * Removes the indicator view from the receiver when the relevant cell is collapsed.
 */
- (void)removeIndicatorView;

/**
 * Returns a boolean value showing if the receiver contains an indicator view or not.
 *
 *  @return The boolean value for the indicator view.
 */
- (BOOL)containsIndicatorView;

@end

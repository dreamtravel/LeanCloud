//
//  SKSTableView.h
//  SKSTableView
//
//  Created by Sakkaras on 26/12/13.
//  Copyright (c) 2013 Sakkaras. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SKSTableView;

#pragma mark - SKSTableViewDelegate

@protocol SKSTableViewDelegate <UITableViewDataSource, UITableViewDelegate>

@required

/**
 * 返回的内部cell数可排在给定的索引路径。
 *
 *  @param tableView 传入的SKSTableView
 *
 *  @param indexPath 要返回的索引信息
 */
- (NSInteger)tableView:(SKSTableView *)tableView numberOfSubRowsAtIndexPath:(NSIndexPath *)indexPath;

/**
 * 返回的内部cell模型
 *
 *  @param tableView 传入的UITableView
 *
 *  @param indexPath 传入的索引位置
 */
- (UITableViewCell *)tableView:(SKSTableView *)tableView cellForSubRowAtIndexPath:(NSIndexPath *)indexPath;

@end


@interface SKSTableView : UITableView

/**
 *  SKSTableView代理（已遵循UItableView的数据源和代理协议）
 */
@property (nonatomic, weak) id <SKSTableViewDelegate> SKSTableViewDelegate;

@end


#pragma mark - NSIndexPath (SKSTableView)

@interface NSIndexPath (SKSTableView)

/**
 * 每个索引的内部cell数目
 */
@property (nonatomic, assign) NSInteger subRow;

/**
 * Initializes the newly-allocated NSIndexPath object with the given parameters.
 *
 *  @param subrow Subrow of the NSIndexPath object.
 *
 *  @param row Row of the NSIndexPath object.
 *
 *  @param section Section of the NSIndexPath object.
 *
 *  @return An initialized NSIndexPath object.
 */
+ (NSIndexPath *)indexPathForSubRow:(NSInteger)subrow inRow:(NSInteger)row inSection:(NSInteger)section;

@end

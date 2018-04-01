//
// REFrostedViewController.h
// RESideMenu
//
// Copyright (c) 2013-2014 Roman Efimov (https://github.com/romaonthego)
//
//

#import <UIKit/UIKit.h>
#import "UIViewController+RESideMenu.h"

#ifndef IBInspectable
#define IBInspectable
#endif

@protocol RESideMenuDelegate;

@interface RESideMenu : UIViewController <UIGestureRecognizerDelegate>

#if __IPHONE_8_0
/**
 *  主视图StoryboradID
 */
@property (strong, readwrite, nonatomic) IBInspectable NSString *contentViewStoryboardID;
/**
 *  左边菜单StoryboradID
 */
@property (strong, readwrite, nonatomic) IBInspectable NSString *leftMenuViewStoryboardID;
/**
 *  右边菜单StoryboradID
 */
@property (strong, readwrite, nonatomic) IBInspectable NSString *rightMenuViewStoryboardID;
#endif

/**
 *  主视图
 */
@property (strong, readwrite, nonatomic) UIViewController *contentViewController;
/**
 *  左边菜单
 */
@property (strong, readwrite, nonatomic) UIViewController *leftMenuViewController;
/**
 *  右边菜单
 */
@property (strong, readwrite, nonatomic) UIViewController *rightMenuViewController;
/**
 *  代理
 */
@property (weak, readwrite, nonatomic) id<RESideMenuDelegate> delegate;

/**
 *  动画时间
 */
@property (assign, readwrite, nonatomic) NSTimeInterval animationDuration;
/**
 *  背景图片
 */
@property (strong, readwrite, nonatomic) UIImage *backgroundImage;
/**
 *  是否启动单击手势
 */
@property (assign, readwrite, nonatomic) BOOL panGestureEnabled;
/**
 *  <#Description#>
 */
@property (assign, readwrite, nonatomic) BOOL panFromEdge;
/**
 *  <#Description#>
 */
@property (assign, readwrite, nonatomic) NSUInteger panMinimumOpenThreshold;
/**
 *  <#Description#>
 */
@property (assign, readwrite, nonatomic) IBInspectable BOOL interactivePopGestureRecognizerEnabled;
/**
 *  <#Description#>
 */
@property (assign, readwrite, nonatomic) IBInspectable BOOL fadeMenuView;
/**
 *  是否缩放主视图
 */
@property (assign, readwrite, nonatomic) IBInspectable BOOL scaleContentView;
/**
 *  <#Description#>
 */
@property (assign, readwrite, nonatomic) IBInspectable BOOL scaleBackgroundImageView;
/**
 *  <#Description#>
 */
@property (assign, readwrite, nonatomic) IBInspectable BOOL scaleMenuView;
/**
 *  是否开启主视图阴影
 */
@property (assign, readwrite, nonatomic) IBInspectable BOOL contentViewShadowEnabled;
/**
 *  主视图阴影颜色
 */
@property (strong, readwrite, nonatomic) IBInspectable UIColor *contentViewShadowColor;
/**
 *  主视图阴影范围
 */
@property (assign, readwrite, nonatomic) IBInspectable CGSize contentViewShadowOffset;
/**
 *  主视图阴影透明度
 */
@property (assign, readwrite, nonatomic) IBInspectable CGFloat contentViewShadowOpacity;
/**
 *  主视图阴影圆角
 */
@property (assign, readwrite, nonatomic) IBInspectable CGFloat contentViewShadowRadius;
/**
 *  <#Description#>
 */
@property (assign, readwrite, nonatomic) IBInspectable CGFloat contentViewFadeOutAlpha;
/**
 *  主视图缩放大小
 */
@property (assign, readwrite, nonatomic) IBInspectable CGFloat contentViewScaleValue;
/**
 *  <#Description#>
 */
@property (assign, readwrite, nonatomic) IBInspectable CGFloat contentViewInLandscapeOffsetCenterX;
/**
 *  <#Description#>
 */
@property (assign, readwrite, nonatomic) IBInspectable CGFloat contentViewInPortraitOffsetCenterX;
/**
 *  <#Description#>
 */
@property (assign, readwrite, nonatomic) IBInspectable CGFloat parallaxMenuMinimumRelativeValue;
/**
 *  <#Description#>
 */
@property (assign, readwrite, nonatomic) IBInspectable CGFloat parallaxMenuMaximumRelativeValue;
/**
 *  <#Description#>
 */
@property (assign, readwrite, nonatomic) IBInspectable CGFloat parallaxContentMinimumRelativeValue;
/**
 *  <#Description#>
 */
@property (assign, readwrite, nonatomic) IBInspectable CGFloat parallaxContentMaximumRelativeValue;
/**
 *  <#Description#>
 */
@property (assign, readwrite, nonatomic) CGAffineTransform menuViewControllerTransformation;
/**
 *  <#Description#>
 */
@property (assign, readwrite, nonatomic) IBInspectable BOOL parallaxEnabled;
/**
 *  是否水平反弹
 */
@property (assign, readwrite, nonatomic) IBInspectable BOOL bouncesHorizontally;
/**
 *  状态栏类型
 */
@property (assign, readwrite, nonatomic) UIStatusBarStyle menuPreferredStatusBarStyle;
/**
 *  是否隐藏状态栏
 */
@property (assign, readwrite, nonatomic) IBInspectable BOOL menuPrefersStatusBarHidden;

/**
 *  初始化
 *
 *  @param contentViewController   主视图
 *  @param leftMenuViewController  左边菜单
 *  @param rightMenuViewController 右边菜单
 *
 *  @return 当前类的实例
 */
- (instancetype)initWithContentViewController:(UIViewController *)contentViewController
             leftMenuViewController:(UIViewController *)leftMenuViewController
            rightMenuViewController:(UIViewController *)rightMenuViewController;
/**
 *  弹出左边菜单
 */
- (void)presentLeftMenuViewController;
/**
 *  弹出右边菜单
 */
- (void)presentRightMenuViewController;
/**
 *  隐藏主视图
 */
- (void)hideMenuViewController;
/**
 *  开启主视图
 *
 *  @param contentViewController 主视图
 *  @param animated              是否使用动画
 */
- (void)setContentViewController:(UIViewController *)contentViewController animated:(BOOL)animated;

@end

@protocol RESideMenuDelegate <NSObject>

@optional
/**
 *  手势识别完成调用
 *
 *  @param sideMenu   传入的控制器
 *  @param recognizer 传入的手势
 */
- (void)sideMenu:(RESideMenu *)sideMenu didRecognizePanGesture:(UIPanGestureRecognizer *)recognizer;
/**
 *  当menu将要显示时调用
 *
 *  @param sideMenu           传入的控制器
 *  @param menuViewController 菜单控制器
 */
- (void)sideMenu:(RESideMenu *)sideMenu willShowMenuViewController:(UIViewController *)menuViewController;
/**
 *  当menu显示完成时调用
 *
 *  @param sideMenu           传入的控制器
 *  @param menuViewController 菜单控制器
 */
- (void)sideMenu:(RESideMenu *)sideMenu didShowMenuViewController:(UIViewController *)menuViewController;
/**
 *  当menu将要隐藏时调用
 *
 *  @param sideMenu           传入的控制器
 *  @param menuViewController 菜单控制器
 */
- (void)sideMenu:(RESideMenu *)sideMenu willHideMenuViewController:(UIViewController *)menuViewController;
/**
 *  当menu隐藏后调用
 *
 *  @param sideMenu           传入的控制器
 *  @param menuViewController 菜单控制器
 */
- (void)sideMenu:(RESideMenu *)sideMenu didHideMenuViewController:(UIViewController *)menuViewController;

@end

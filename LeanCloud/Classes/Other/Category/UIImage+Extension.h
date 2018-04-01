//
//  UIImage+Extension.h
//  Category
//
//  Created by Mac on 15/11/24.
//  Copyright © 2015年 Mac mini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 *  返回一个可任意拉伸而不变形的图片
 *
 *  @param name 图片名称
 */
+ (instancetype)resizeableImageWithName:(NSString *)name;

/**
 *  返回一个圆角图片
 *
 *  @param imageName    图片名称
 *  @param cornerRadius 圆角半径
 *  @param borderWidth  边缘宽度
 *  @param borderColor  边缘颜色
 */
+ (instancetype)cornerImageWithImageName:(NSString *)imageName
                            cornerRadius:(CGFloat)cornerRadius
                             borderWidth:(CGFloat)borderWidth
                             borderColor:(UIColor *)borderColor;

/**
 *  返回一个水印图片
 *
 *  @param bgImageName    背景图片
 *  @param waterImageName 水印图片
 *  @param scale          图片生成的比例
 *  @return               添加了水印的背景图片
 */
+ (instancetype)waterImageWithBgImageName:(NSString *)bgImageName
                        waterImageName:(NSString *)waterImageName
                                 scale:(CGFloat)scale;

/**
 *  返回一个圆形图片
 *
 *  @param imageName    要裁减的图片
 *  @param boderColor   边框颜色
 *  @param boderWifth   边框大小
 *  @return             裁剪后的图片
 */
+ (instancetype)circleImageWithImagenName:(NSString *)imageName
                            boderColor:(UIColor *)boderColor
                           borderWidth:(CGFloat)boderWifth;

/**
 *  返回一个截取图片
 *
 *  @param captureView  要截取的视图
 *  @return             截取后的图片
 */
+ (instancetype)captureImage:(UIView *)captureView;

@end

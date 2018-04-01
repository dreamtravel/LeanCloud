//
//  UIImage+Extension.m
//  Category
//
//  Created by Mac on 15/11/24.
//  Copyright © 2015年 Mac mini. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (instancetype)resizeableImageWithName:(NSString *)name {
    UIImage *image = [UIImage imageNamed:name];
    CGFloat height = image.size.height * 0.5;
    CGFloat width = image.size.width * 0.5;
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(height, width, height, width)];
}

+ (instancetype)cornerImageWithImageName:(NSString *)imageName cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    //生成一张新的图片
    UIImage *image = [UIImage imageNamed:imageName];
    // 1、开启一个位图上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    // 2、把图片画在上下文
    // 2.1 图片要裁剪成有圆角
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
    layer.contents = (id)image.CGImage;
    layer.cornerRadius = cornerRadius;
    layer.masksToBounds = YES;
    layer.borderWidth = borderWidth;
    layer.borderColor = borderColor.CGColor;
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    // 3、从位图上细文获取新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 4.结束位图的编辑
    UIGraphicsEndImageContext();
    // 5、返回图片
    return newImage;
}

+ (instancetype)waterImageWithBgImageName:(NSString *)bgImageName waterImageName:(NSString *)waterImageName scale:(CGFloat)scale{
    // 生成一张有水印的图片，一定要获取UIImage对象 然后显示在imageView上
    
    //创建一背景图片
    UIImage *bgImage = [UIImage imageNamed:bgImageName];
    //NSLog(@"bgImage Size: %@",NSStringFromCGSize(bgImage.size));
    // 1.创建一个位图【图片】，开启位图上下文
    // size:位图大小
    // opaque: alpha通道 YES:不透明/ NO透明 使用NO,生成的更清析
    // scale 比例 设置0.0为屏幕的比例
    // scale 是用于获取生成图片大小 比如位图大小：20X20 / 生成一张图片：（20 *scale X 20 *scale)
    //NSLog(@"当前屏幕的比例 %f",[UIScreen mainScreen].scale);
    UIGraphicsBeginImageContextWithOptions(bgImage.size, NO, scale);
    
    // 2.画背景图
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    
    // 3.画水印
    // 算水印的位置和大小
    // 一般会通过一个比例来缩小水印图片
    UIImage *waterImage = [UIImage imageNamed:waterImageName];
    CGFloat waterScale = 0.4;
    CGFloat waterW = waterImage.size.width * waterScale;
    CGFloat waterH = waterImage.size.height * waterScale;
    CGFloat waterX = bgImage.size.width - waterW;
    CGFloat waterY = bgImage.size.height - waterH;
    
    
    [waterImage drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    
    // 4.从位图上下文获取 当前编辑的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    
    // 5.结束当前位置编辑
    UIGraphicsEndImageContext();
    
    
    return newImage;
}

+ (instancetype)circleImageWithImagenName:(NSString *)imageName
                            boderColor:(UIColor *)boderColor
                           borderWidth:(CGFloat)boderWifth {
    //需求：从位图上下文，裁剪图片(裁剪成圆形，也添加圆形的边框)，生成一张图片
    
    //获取要裁减的图片
    UIImage *img = [UIImage imageNamed:imageName];
    CGRect imgRect = CGRectMake(0, 0, img.size.width, img.size.height);
    // 1、开启位图上下文
    UIGraphicsBeginImageContextWithOptions(img.size, NO, 0.0);
    // 1.1 获取位图上下文
    CGContextRef imageContext = UIGraphicsGetCurrentContext();
    //-----注：在自定义的View的drawRect方法中，调用的UIGraphicsGetCurrentContext方法获取的是图层上下文
    
    // 2、 往位图上下裁剪图片
    // 2.1 指定一个圆形的路径，把圆形之外的剪切掉
    CGContextAddEllipseInRect(imageContext, imgRect);
    CGContextClip(imageContext);//裁剪路径之外的
    // 2.2 添加图片
    [img drawInRect:imgRect];
    // 2.3 添加边框
    [boderColor set];
    CGContextSetLineWidth(imageContext, boderWifth);
    CGContextAddEllipseInRect(imageContext, imgRect);
    // 2.4 渲染
    CGContextStrokePath(imageContext);
    // 3、获取当前位图上下文的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 4、结束位图编辑
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (instancetype)captureImage:(UIView *)captureView {
    //需求：从传入的视图中截取该视图当时的显示画面
    //创建一个图形上下文
    UIGraphicsBeginImageContext(captureView.bounds.size);
    //把View渲染到位图上下文
    [captureView.layer renderInContext:UIGraphicsGetCurrentContext()];
    //获取图片
    UIImage *captureImage = UIGraphicsGetImageFromCurrentImageContext();
    //结束位图编辑
    UIGraphicsEndImageContext();
    //返回图片
    return captureImage;
}


@end

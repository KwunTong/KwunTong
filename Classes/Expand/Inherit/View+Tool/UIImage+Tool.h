//
//  UIImage+Tool.h
//  Copyright (c) 2014年 高万里. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Tool)

/**
 *  返回一张拉伸不变形的图片
 *
 *  @param name 图片名称 
 */
+ (UIImage *)resizableImage:(NSString *)name;

/**
 *  保持原来的长宽比，生成一个缩略图
 *  @param asize 需要的长、宽
 *
 */
+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize;

/**
 *  在一个View上截图
 *
 *  @param view 目标View
 *  @param rect 需要截取的范围
 */
+ (UIImage *)imageByScreenshotsWithView:(UIView *)view andRect:(CGRect)rect;

/**
 *  根据背景颜色和尺寸创建一张图片
 *
 *  @param color 背景颜色
 *  @param size  尺寸
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
/**
 *  在一张图片上截图
 *
 *  @param image 目标图片
 *  @param rect  需要截取的范围
 *  @return 返回的是@2x图片
 */
+ (UIImage *)imageByCuttingWithImage:(UIImage *)image andRect:(CGRect)rect;

/**
 *  获得某个像素的颜色
 *
 *  @param point 像素点的位置
 */
//- (UIColor *)pixelColorAtLocation:(CGPoint)point;

- (UIImage*)transformWidth:(CGFloat)width

                    height:(CGFloat)height;

@end

//
//  UIImageView+JZGAdd.m
//  JZGDetectionPlatform
//
//  Created by cuik on 16/3/30.
//  Copyright © 2016年 Mars. All rights reserved.
//

#import "UIImageView+JZGAdd.h"

@implementation UIImageView (JZGAdd)

+ (UIImageView *)startRotate360DegreeWithImageView:(UIImageView *)imageView  count:(NSInteger)count{
    CABasicAnimation *animation = [ CABasicAnimation
                                   animationWithKeyPath: @"transform" ];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    
    //围绕Z轴旋转，垂直与屏幕
    animation.toValue = [ NSValue valueWithCATransform3D:
                         
                         CATransform3DMakeRotation(M_PI, 0.0, 0.0, 1.0) ];
    animation.duration = 0.5;
    //旋转效果累计，先转180度，接着再旋转180度，从而实现360旋转
    animation.cumulative = YES;
    animation.repeatCount = count;
    
    //在图片边缘添加一个像素的透明区域，去图片锯齿
    //    CGRect imageRrect = CGRectMake(0, 0,imageView.frame.size.width, imageView.frame.size.height);
    //    UIGraphicsBeginImageContext(imageRrect.size);
    //    [imageView.image drawInRect:CGRectMake(1,1,imageView.frame.size.width-2,imageView.frame.size.height-2)];
    //    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    //    UIGraphicsEndImageContext();
    
    [imageView.layer addAnimation:animation forKey:nil];
    return imageView;
}

+ (void)stopRotate360DegreeWithImageView:(UIImageView *)imageView{
    [imageView.layer removeAllAnimations];
}

@end

//
//  UIImageView+JZGAdd.h
//  JZGDetectionPlatform
//
//  Created by cuik on 16/3/30.
//  Copyright © 2016年 Mars. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImageView (JZGAdd)

+ (UIImageView *)startRotate360DegreeWithImageView:(UIImageView *)imageView count:(NSInteger)count;
+ (void)stopRotate360DegreeWithImageView:(UIImageView *)imageView;

@end

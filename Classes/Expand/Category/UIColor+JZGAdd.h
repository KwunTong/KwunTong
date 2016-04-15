//
//  UIColor+JZGAdd.h
//  JZGDetectionPlatform
//
//  Created by cuik on 16/3/30.
//  Copyright © 2016年 Mars. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIColor (JZGAdd)

#pragma mark - Equalable
#pragma mark -
- (BOOL)isEqualToColor:(UIColor *)otherColor;


#pragma mark - 十六进制转UIColor
#pragma mark -
/**
 *  十六进制转color
 *
 *  @param color 0XFFFFFF 或 #FFFFFF 或 0xFFFFFF  0xFF FF FF
 *  @param alpha 0.0-1.0
 *
 *  @return 传入参数无效返回 clearcolor
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/**
 *  创建alpha默认为1的颜色
 *
 *  @param color 0XFFFFFF 或 #FFFFFF
 *
 *  @return 创建的颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)color;

@end

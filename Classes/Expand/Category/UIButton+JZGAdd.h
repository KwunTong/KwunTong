//
//  UIButton+JZGAdd.h
//  JZGDetectionPlatform
//
//  Created by cuik on 16/3/30.
//  Copyright © 2016年 Mars. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIButton (JZGAdd)

#pragma mark - 设置背景颜色
/**
 *  设置背景颜色
 *
 *  @param backgroundColor 设置的颜色
 *  @param state 按钮状态
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

#pragma mark - 设置倒计时时间
/**
 *  设置倒计时时间
 *
 *  @param seconds 设置的时间
 */
- (void)startCountdown:(NSUInteger)seconds;


@end

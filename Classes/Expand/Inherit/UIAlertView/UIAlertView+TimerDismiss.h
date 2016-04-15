//
//  UIAlertView+TimerDismiss.h
//  JZGAppraiserNetwork
//
//  Created by Mars on 15/3/23.
//  Copyright (c) 2015年 Mars. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (TimerDismiss)

/**
 *  设置alertView定时消失时间
 *
 *  @param time alert消失时间
 */
- (void)setAlertViewTime:(float)time;

@end

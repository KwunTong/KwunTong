//
//  JZGHudManager.h
//  JZGDetectionPlatform
//
//  Created by cuik on 16/3/30.
//  Copyright © 2016年 Mars. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JZGHudManager : NSObject

/**
 *  单例
 *
 *  @return 返回该对象
 */
+ (instancetype)share;

/**
 *  加载显示菊花
 *
 *  @param title         显示的title
 *  @param inView        菊花所放置的view
 *  @param isPenetration 菊花所放置的view是否可穿透, YES:可穿透，NO:不可穿透
 */
-(void)showHUDWithTitle:(NSString *)title
                 inView:(UIView *)inView
          isPenetration:(BOOL)isPenetration;

/**
 *  隐藏菊花
 */
-(void)hide;

/**
 *  延迟隐藏菊花
 *
 *  @param delay 延迟时间
 */
- (void)hideAfterDelay:(NSTimeInterval)delay;

@end

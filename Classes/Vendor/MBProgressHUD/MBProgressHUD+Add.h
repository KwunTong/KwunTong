//
//  MBProgressHUD+Add.h
//  JingZhenGu
//
//  Created by Mars on 15/5/8.
//  Copyright (c) 2015年 Mars. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Add)

+ (void)showMessage:(NSString *)message toView:(UIView *)view;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (void)showMessage:(NSString *)message detailText:(NSString *)detailText toView:(UIView *)view;
+ (void)showHideMessage:(NSString *)message toView:(UIView *)view;
+ (void)showSuccess:(NSString *)success detailText:(NSString *)detailText toView:(UIView *)view;
+ (void)showError:(NSString *)error detailText:(NSString *)detailText toView:(UIView *)view;

+ (void)hideHUD:(UIView *)view;

+ (void)show;
+ (void)hide;

@end

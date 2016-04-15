//
//  MBProgressHUD+NJ.h
//
//  Created by 李南江 on 14-5-5.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MBProgressHUD.h"
#define CLOSEWITHNOWAIT @"Immediately Close"
#define NODISPLAYMSG @"NoDisplayMessage"

@interface MBProgressHUD (NJ)
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showError:(NSString *)error detailText:(NSString *)detailText toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;


+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;

+ (MBProgressHUD *)showMessage:(NSString *)message;

/**参数
 功能描述:显示自定义信息
 message:自定义显示的消息
 toView:需要放到的父view上
 tag:标签，用于隐藏操作
 **/
+ (MBProgressHUD *)showContentMessage:(NSString *)message toView:(UIView *)view;

/**参数
 功能描述:隐藏自定义信息
 message:自定义显示的消息
 toView:需要放到的父view上
 tag:标签，用于隐藏操作
 isSucess:执行是否成功，yes显示成功图案，no显示失败图案
 **/
+ (void)hideContentMessage:(NSString *)message toView:(UIView *)view isSucess:(BOOL)sucess;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end

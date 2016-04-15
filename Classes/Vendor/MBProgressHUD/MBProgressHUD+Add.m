//
//  MBProgressHUD+Add.m
//  JingZhenGu
//
//  Created by Mars on 15/5/8.
//  Copyright (c) 2015年 Mars. All rights reserved.
//

#import "MBProgressHUD+Add.h"

@implementation MBProgressHUD (Add)

+ (void)show:(NSString *)text detailText:(NSString *)detail icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) return;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
    hud.detailsLabelText = detail;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1.5秒之后再消失
    [hud hide:YES afterDelay:1.5];
}

+ (void)showMessage:(NSString *)message toView:(UIView *)view
{
    [self showMessage:message detailText:nil toView:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success detailText:nil icon:@"success.png" view:view];
}

+ (void)showError:(NSString *)error toView:(UIView *)view
{
    [self show:error detailText:nil icon:@"error.png" view:view];
}

+ (void)showMessage:(NSString *)message detailText:(NSString *)detailText toView:(UIView *)view
{
    if (view == nil) return;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    hud.detailsLabelText = detailText;
    hud.removeFromSuperViewOnHide = YES;
}

//展示提示，1.5秒自动消失
+ (void)showHideMessage:(NSString *)message toView:(UIView *)view
{
    if (view == nil) return;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    hud.detailsLabelText = nil;
    hud.removeFromSuperViewOnHide = YES;
    hud.mode =MBProgressHUDModeText;
    [hud hide:YES afterDelay:1.5f];
}

+ (void)show
{
    [[self alloc] show:YES];
}

+ (void)hide
{
    [[self alloc] hide:YES];
}



+ (void)showSuccess:(NSString *)success detailText:(NSString *)detailText toView:(UIView *)view
{
    [self show:success detailText:detailText icon:@"success.png" view:view];
}

+ (void)showError:(NSString *)error detailText:(NSString *)detailText toView:(UIView *)view
{
    [self show:error detailText:detailText icon:@"error.png" view:view];
}

+ (void)hideHUD:(UIView *)view
{
    [self hideHUDForView:view animated:YES];
}

@end

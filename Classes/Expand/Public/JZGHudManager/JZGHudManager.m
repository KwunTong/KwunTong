//
//  JZGHudManager.m
//  JZGDetectionPlatform
//
//  Created by cuik on 16/3/30.
//  Copyright © 2016年 Mars. All rights reserved.
//

#import "JZGHudManager.h"

@interface JZGHudManager (){
    __weak UIView *_inView;
}

@property (nonatomic,strong) MBProgressHUD      *mBProgressHUD;

@end

@implementation JZGHudManager

+ (instancetype)share{
    static dispatch_once_t t;
    static JZGHudManager *manager = nil;
    dispatch_once(&t, ^{
        manager = [[JZGHudManager alloc] init];
    });
    return manager;
}

- (void)showHUDWithTitle:(NSString *)title
                  inView:(UIView *)inView
           isPenetration:(BOOL)isPenetration{
    if (_mBProgressHUD) {
        [self hide];
        _mBProgressHUD = nil;
    }
    _inView = inView;
    UIView *baseView = nil;
    if (_inView) {
        baseView = _inView;
    }
    else{
        baseView = GZLAppDelegate.window;
    }
    
    _mBProgressHUD = [[MBProgressHUD alloc] initWithView:baseView];
    _mBProgressHUD.userInteractionEnabled = !isPenetration;
    _mBProgressHUD.removeFromSuperViewOnHide = YES;
    _mBProgressHUD.cornerRadius = 5.0;
    _mBProgressHUD.color = [UIColor colorWithWhite:0.0 alpha:0.75];
    _inView = inView;
    if (_inView) {
        [_inView addSubview:_mBProgressHUD];
    }
    else{
        [GZLAppDelegate.window addSubview:_mBProgressHUD];
    }
    
    _mBProgressHUD.labelText = title;
    [self show];
}

-(void)show{
    [GZLAppDelegate.window bringSubviewToFront:_mBProgressHUD];
    [_mBProgressHUD show:YES];
}

-(void)hide{
    if (_inView) {
        _inView.userInteractionEnabled = YES;
    }
    dispatch_main_async_safe(^{
        [_mBProgressHUD hide:YES];
    });
}

- (void)hideAfterDelay:(NSTimeInterval)delay{
    [self performSelector:@selector(hide) withObject:nil afterDelay:delay];
}

@end

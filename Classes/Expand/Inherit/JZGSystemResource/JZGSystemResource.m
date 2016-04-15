//
//  JZGSystemResource.m
//  JZGDetectionPlatform
//
//  Created by cuik on 16/3/30.
//  Copyright © 2016年 Mars. All rights reserved.
//

#import "JZGSystemResource.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreLocation/CoreLocation.h>
#import "JZGAlertView.h"
#import "UIApplication+JZG.h"

@implementation JZGSystemResource

+ (instancetype)share{
    static dispatch_once_t t;
    static JZGSystemResource *service = nil;
    dispatch_once(&t, ^{
        service = [[JZGSystemResource alloc] init];
    });
    return service;
}

+ (BOOL)isAlowPosition;{
    return ([CLLocationManager locationServicesEnabled]
            && ( kCLAuthorizationStatusDenied !=  [CLLocationManager authorizationStatus]));
}

+ (BOOL)isAllowAccessCamera{
    AVAuthorizationStatus AVStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (AVStatus == AVAuthorizationStatusAuthorized) {
        return YES;
    }
    return NO;
}

+ (BOOL)isAllowAccessPhotos{
    ALAuthorizationStatus ALStatus = [ALAssetsLibrary authorizationStatus];
    
    if (ALStatus == ALAuthorizationStatusAuthorized) {
        return YES;
    }
    return NO;
}


- (void)handleAccessCamera:(NSInvocation *)allowInvocation
{
    if ([[self class] isAllowAccessCamera])
    {
        [allowInvocation invoke];
        return;
    }
    
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    NSString *promtpMessage = @"此功能需要开启相机授权，请在设置-隐私-相机中开启精真估检测的权限";
    JZGAlertView *alertView = nil;
    alertView = [[JZGAlertView alloc] initWithTitle:@"提示"
                                           message:promtpMessage
                                 cancelButtonTitle:@"取消"
                                 otherButtonTitles:@"去设置"
                                       cancelBlock:nil
                                         sureBlock:^
                 {
                     [[UIApplication sharedApplication] skipToPrivacy];
                 }];
    
    if(status == AVAuthorizationStatusDenied || status == AVAuthorizationStatusRestricted){
        [alertView show];
    }
    
    if(status == AVAuthorizationStatusNotDetermined)
    {
        
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo
                                 completionHandler:^(BOOL granted)
         {
             
             BOOL isMain = [[NSThread currentThread] isMainThread];
             if (isMain)
             {
                 if(granted)
                 {
                     [allowInvocation invoke];
                 } else {
                     [alertView show];
                 }
             }
             
             else{
                 dispatch_sync(dispatch_get_main_queue(), ^{
                     if(granted)
                     {
                         [allowInvocation invoke];
                     } else {
                         [alertView show];
                     }
                 });
             }
         }];
    }
}

- (void)handleAccessPhotos:(NSInvocation *)allowInvocation{
    if ([[self class] isAllowAccessPhotos])
    {
        [allowInvocation invoke];
        return;
    }
    
    ALAuthorizationStatus status = [ALAssetsLibrary authorizationStatus];
    if (status == ALAuthorizationStatusNotDetermined) {
        [allowInvocation invoke];
        return;
    }
    
    NSString *promtpMessage = @"此功能需要开启照片授权，请在设置-隐私-照片中开启精真估检测的权限";
    JZGAlertView *alertView = nil;
    alertView = [[JZGAlertView alloc] initWithTitle:@"提示"
                                           message:promtpMessage
                                 cancelButtonTitle:@"取消"
                                 otherButtonTitles:@"去设置"
                                       cancelBlock:nil
                                         sureBlock:^
                 {
                     [[UIApplication sharedApplication] skipToPrivacy];
                 }];
    
    [alertView show];
}

@end

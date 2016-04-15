//
//  JZGNetworkError.m
//  JZGDetectionPlatform
//
//  Created by Mars on 16/1/4.
//  Copyright © 2016年 Mars. All rights reserved.
//

#import "JZGNetworkError.h"
#import "JZGNetwork.h"

@implementation JZGNetworkError

+ (JZGNetWorkRequest *)sharedNetworkRequest{
    static JZGNetWorkRequest *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        if (!instance) {
            instance = [[self alloc] init];
        }
    });
    
    return instance;
}

+ (NSString *)errorWithCode:(NSInteger)errorCode
{
    NSString *err = nil;
    if (errorCode) {
        switch (errorCode) {
            case JZGNetworkErrorDefault:
                return @"数据返回失败，请重试。";
                break;
            case JZGNetworkErrorTimeOut:
                return @"请求超时，请重试。";
                break;
            case JZGNetworkErrorNoServer:
                return @"无法与服务器建立连接，请重试。";
                break;
            case JZGNetworkErrorNoNetwork:
                return @"网络不给力，请检查网络连接。";
                break;
                
            default:
                return @"数据返回失败，请重试。";
                break;
        }
    }

    return err;
}

//- (NSString *)errorStringWithError:(NSInteger)errorCode
//{
//
//    return nil;
//}

@end

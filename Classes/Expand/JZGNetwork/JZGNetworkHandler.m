//
//  JZGNetworkHandler.m
//  AFN3.0封装
//
//  Created by Mars on 15/12/20.
//  Copyright © 2015年 Mars. All rights reserved.
//

#import "JZGNetworkHandler.h"
#import "Reachability.h"
#import "JZGNetWorkRequest.h"

#import "JZGNetwork.h"

@implementation JZGNetworkHandler

+ (JZGNetworkHandler *)sharedNetworkHandler{
    static JZGNetworkHandler *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        if (!instance) {
            instance = [[self alloc] init];
        }
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.networkError = NO;
    }
    return self;
}

- (void)connectNetWithUrl:(NSString *)url
       requestNetworkType:(JZGNetworkRequestType)networkRequestType
               parameters:(NSDictionary *)parameters
          timeoutInterval:(NSTimeInterval)timeoutInterval
             successBlock:(JZGNetworkRequestSuccessBlock)successBlock
             failureBlock:(JZGNetworkRequestFailureBlock)failureBlock
                  showHUD:(BOOL)showHUD
{
    if (self.networkError == YES) {
        JZGALERT_SHOW(@"网络连接对开,请检查网络!");
        return ;
    }
    if (self.request) {
        [self.request connectNetWithUrl:url requestNetworkType:networkRequestType parameters:parameters timeoutInterval:timeoutInterval successBlock:successBlock failureBlock:failureBlock showHUD:showHUD];
    }
}


- (void)uploadImageWithUrl:(NSString *)url
                parameters:(NSDictionary *)parameters
                    images:(NSArray *)images
           timeoutInterval:(NSTimeInterval)timeInterval
              successBlock:(JZGNetworkRequestSuccessBlock)successBlock
              failureBlock:(JZGNetworkRequestFailureBlock)failureBlock
                   showHUD:(BOOL)showHud
{
    if (self.networkError == YES) {
        JZGALERT_SHOW(@"网络连接断开,请检查网络!");
        return ;
    }
    if (self.request) {
        [self.request uploadImageWithUrl:url parameters:parameters images:images timeoutInterval:timeInterval successBlock:successBlock failureBlock:failureBlock showHUD:showHud];
    }
}

- (void)cancelNetworkHandler
{
    if (self.request) {
        [self.request cancelNetworkRequest];
    }
}

#pragma makr - 开始监听网络连接
+ (void)startMonitoring
{
    // 1.获得网络监控的管理者
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    // 2.设置网络状态改变后的处理
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 当网络状态改变了, 就会调用这个block
        switch (status) {
            case AFNetworkReachabilityStatusUnknown: // 未知网络
                NSLog(@"未知网络");
                break;
            case AFNetworkReachabilityStatusNotReachable: // 没有网络(断网)
                [JZGNetworkHandler sharedNetworkHandler].networkError = YES;
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
                NSLog(@"手机自带网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
                NSLog(@"WIFI");
                break;
        }
    }];
    
    [mgr startMonitoring];
}

- (BOOL)isNetworkAvailable
{
    BOOL isExistenceNetwork = YES;
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = YES;
            break;
    }
    
    return isExistenceNetwork;
}

- (JZGNetWorkRequest *)request
{
    if (!_request) {
        _request = [JZGNetWorkRequest sharedNetworkRequest];
    }
    
    return _request;
}


@end

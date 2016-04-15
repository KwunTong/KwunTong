 //
//  JZGNetWorkRequest.m
//  AFN3.0封装
//
//  Created by Mars on 15/12/20.
//  Copyright © 2015年 Mars. All rights reserved.
//

#import "JZGNetWorkRequest.h"
#import "Reachability.h"
//#import "JZGEncyptClass.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"

#import "JZGNetwork.h"

@implementation JZGNetWorkRequest

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

- (void)connectNetWithUrl:(NSString *)url
       requestNetworkType:(JZGNetworkRequestType)networkRequestType
               parameters:(NSDictionary *)parameter
          timeoutInterval:(NSTimeInterval)timeoutInterval
             successBlock:(JZGNetworkRequestSuccessBlock)successBlock
             failureBlock:(JZGNetworkRequestFailureBlock)failureBlock
                  showHUD:(BOOL)showHUD
{
    
    if (showHUD == YES) {
        [MBProgressHUD showHUDAddedTo:WINDOW animated:YES];
    }
//    __weak typeof (self)weakSelf = self;
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializer];
    serializer.removesKeysWithNullValues = YES;
    serializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/javascript",@"text/json",@"text/plain",@"text/html", nil];
    sessionManager.responseSerializer = serializer;
    sessionManager.requestSerializer.timeoutInterval = timeoutInterval;
    self.operationQueue = nil;
    self.operationQueue = sessionManager.operationQueue;
//    NSDictionary *parameters = [JZGEncyptClass parameterSortWithDictionary:parameter];
    if (networkRequestType == JZGNetworkRequestGet) {
        
        [sessionManager GET:url parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [MBProgressHUD hideAllHUDsForView:WINDOW animated:YES];
            NSInteger code = 0;
            NSString *msg = @"";
            if (responseObject) {
                NSString *success   = responseObject[@"success"];
                code                = success.intValue;
                msg                 = responseObject[@"msg"];
            }
            
            successBlock(responseObject,code,msg);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [MBProgressHUD hideAllHUDsForView:WINDOW animated:YES];
            failureBlock(error);
        }];
        
    }else if (networkRequestType == JZGNetworkRequestPost){
        [sessionManager POST:url parameters:parameter progress:^(NSProgress *uploadProgress) {
            
        } success:^(NSURLSessionDataTask *task, id responseObject) {
            [MBProgressHUD hideAllHUDsForView:WINDOW animated:YES];
            NSInteger code = 0;
            NSString *msg = @"";
            if (responseObject) {
                NSString *success   = responseObject[@"success"];
                code                = success.intValue;
                msg                 = responseObject[@"msg"];
            }
            
            successBlock(responseObject,code,msg);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [MBProgressHUD hideAllHUDsForView:WINDOW animated:YES];
            failureBlock(error);
            NSLog(@"code == %zd ----- %@",error.code,error.description);
        }];
    }
}

- (void)uploadImageWithUrl:(NSString *)url
                parameters:(NSDictionary *)parameter
                    images:(NSArray *)images
           timeoutInterval:(NSTimeInterval)timeInterval
              successBlock:(JZGNetworkRequestSuccessBlock)successBlock
              failureBlock:(JZGNetworkRequestFailureBlock)failureBlock
                   showHUD:(BOOL)showHud
{
    if (showHud) {
        [MBProgressHUD showHUDAddedTo:WINDOW animated:YES];
    }
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializer];
    serializer.removesKeysWithNullValues = YES;
    serializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/javascript",@"text/json",@"text/plain",@"text/html", nil];
    sessionManager.responseSerializer = serializer;
    NSTimeInterval timeIntervals = 0;
    if ([images count] >= 3) {
        timeIntervals = ([images count] / 3  + 1) * timeInterval;
    }else
        timeIntervals = timeInterval;
    sessionManager.requestSerializer.timeoutInterval = timeIntervals;
//    NSDictionary *parameters = [JZGEncyptClass parameterSortWithDictionary:parameter];
    
    [sessionManager POST:url parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (NSInteger i = 0; i < [images count]; i++) {
            [formData appendPartWithFileData:[images objectAtIndex:i] name:@"" fileName:@"" mimeType:@"image/png"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [MBProgressHUD hideAllHUDsForView:WINDOW animated:YES];
        NSInteger code = 0;
        NSString *msg = @"";
        if (responseObject) {
            NSString *success   = responseObject[@"success"];
            code                = success.intValue;
            msg                 = responseObject[@"msg"];
        }
        
        successBlock(responseObject,code,msg);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MBProgressHUD hideAllHUDsForView:WINDOW animated:YES];
        failureBlock(error);
    }];
}

- (void)cancelNetworkRequest
{
    if (self.operationQueue) {
        [self.operationQueue cancelAllOperations];
    }
}

//- (NSString *)errorStringWithError:(NSInteger)errorCode
//{
//    if (errorCode) {
//        switch (errorCode) {
//            case JZGErrorDefault:
//                return @"数据返回失败，请重新加载";
//                break;
//            case JZGErrorTimeOut:
//                return @"请求超时，请重新加载";
//                break;
//            case JZGErrorNoServer:
//                return @"无法与服务器建立连接，请稍后再试";
//                break;
//            case JZGERrorNoNetwork:
//                return @"网络不给力 请检查网络设置";
//                break;
//                
//            default:
//                return @"数据返回失败，请重新加载";
//                break;
//        }
//    }
//    
//    return nil;
//}

- (instancetype)setNoNull:(id)value
{
    if(value == nil){
        value = @"";
    }else if ((NSNull *)value == [NSNull null]){
        value = @"";
        if ([value isEqual:nil]) {
            value = @"";
        }
    }
    
    return value;
}

- (BOOL)isNetworkAvailable
{
    BOOL isExistenceNetwork = YES;
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.jingzhengu.com"];
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

- (NSOperationQueue *)operationQueue
{
    if (!_operationQueue) {
        _operationQueue = [[NSOperationQueue alloc] init];
    }
    
    return _operationQueue;
}

@end

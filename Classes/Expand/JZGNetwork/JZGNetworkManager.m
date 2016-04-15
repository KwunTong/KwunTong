//
//  JZGNetworkManager.m
//  AFN3.0封装
//
//  Created by Mars on 15/12/20.
//  Copyright © 2015年 Mars. All rights reserved.
//

#import "JZGNetworkManager.h"

@implementation JZGNetworkManager

+ (JZGNetworkManager *)sharedNetworkManager{
    static JZGNetworkManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        if (!instance) {
            instance = [[self alloc] init];
        }
    });
    
    return instance;
}

+ (void)postReqeustWithURL:(NSString*)url
                parameters:(NSDictionary*)parameters
              successBlock:(JZGNetworkRequestSuccessBlock)successBlock
              failureBlock:(JZGNetworkRequestFailureBlock)failureBlock
                   showHUD:(BOOL)showHUD
{
    [[self alloc] requestUrlWithPost:url parameters:parameters successBlock:successBlock failureBlock:failureBlock showHUD:showHUD];
}

- (void)requestUrlWithPost:(NSString*)url
                parameters:(NSDictionary*)parameters
              successBlock:(JZGNetworkRequestSuccessBlock)successBlock
              failureBlock:(JZGNetworkRequestFailureBlock)failureBlock
                   showHUD:(BOOL)showHUD
{
    if (self.handler) {
        [self.handler connectNetWithUrl:url requestNetworkType:JZGNetworkRequestPost parameters:parameters timeoutInterval:30 successBlock:successBlock failureBlock:failureBlock showHUD:showHUD];
    }
    
}

+ (void)getReqeustWithURL:(NSString*)url
               parameters:(NSDictionary*)parameters
             successBlock:(JZGNetworkRequestSuccessBlock)successBlock
             failureBlock:(JZGNetworkRequestFailureBlock)failureBlock
                  showHUD:(BOOL)showHUD
{
    [[self alloc] requestUrlWithGet:url parameters:parameters successBlock:successBlock failureBlock:failureBlock showHUD:showHUD];
}

- (void)requestUrlWithGet:(NSString*)url
               parameters:(NSDictionary*)parameters
             successBlock:(JZGNetworkRequestSuccessBlock)successBlock
             failureBlock:(JZGNetworkRequestFailureBlock)failureBlock
                  showHUD:(BOOL)showHUD
{
    if (self.handler) {
        [self.handler connectNetWithUrl:url requestNetworkType:JZGNetworkRequestGet parameters:parameters timeoutInterval:30 successBlock:successBlock failureBlock:failureBlock showHUD:showHUD];
    }
}

+ (void)uploadImageWithUrl:(NSString *)url
                parameters:(NSDictionary *)parameters
                    images:(NSArray *)images
           timeoutInterval:(NSTimeInterval)timeInterval
              successBlock:(JZGNetworkRequestSuccessBlock)successBlock
              failureBlock:(JZGNetworkRequestFailureBlock)failureBlock
                   showHUD:(BOOL)showHUD
{
    [[self alloc] uploadPhotoWithUrl:url parameters:parameters images:images timeoutInterval:timeInterval successBlock:successBlock failureBlock:failureBlock showHUD:showHUD];
}

- (void)uploadPhotoWithUrl:(NSString *)url
                parameters:(NSDictionary *)parameters
                    images:(NSArray *)images
           timeoutInterval:(NSTimeInterval)timeInterval
              successBlock:(JZGNetworkRequestSuccessBlock)successBlock
              failureBlock:(JZGNetworkRequestFailureBlock)failureBlock
                   showHUD:(BOOL)showHud
{
    if (self.handler) {
        [self.handler uploadImageWithUrl:url parameters:parameters images:images timeoutInterval:timeInterval successBlock:successBlock failureBlock:failureBlock showHUD:showHud];
    }
}

+ (void)cancelNetworkRequest
{
    [[self alloc] cancelNetworkManagerRequest];
}

- (void)cancelNetworkManagerRequest
{
    if (self.handler) {
        [self.handler cancelNetworkHandler];
        self.handler = nil;
    }
}


- (JZGNetworkHandler *)handler
{
    if (!_handler) {
        _handler = [JZGNetworkHandler sharedNetworkHandler];
    }
    
    return _handler;
}

@end

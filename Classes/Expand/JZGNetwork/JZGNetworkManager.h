//
//  JZGNetworkManager.h
//  AFN3.0封装
//
//  Created by Mars on 15/12/20.
//  Copyright © 2015年 Mars. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JZGNetworkHandler.h"

@interface JZGNetworkManager : NSObject

@property (strong, nonatomic) JZGNetworkHandler *handler;

/// 返回单例
+ (instancetype)sharedNetworkManager;

#pragma mark - 发送 POST 请求的方法
/**
 *   通过 Block回调结果
 *
 *   @param url           url
 *   @param parameters    请求的参数字典
 *   @param successBlock  成功的回调
 *   @param failureBlock  失败的回调
 *   @param showHUD       是否加载进度指示器
 */
+ (void)postReqeustWithURL:(NSString*)url
                parameters:(NSDictionary*)parameters
              successBlock:(JZGNetworkRequestSuccessBlock)successBlock
              failureBlock:(JZGNetworkRequestFailureBlock)failureBlock
                   showHUD:(BOOL)showHUD;

+ (void)getReqeustWithURL:(NSString*)url
               parameters:(NSDictionary*)parameters
             successBlock:(JZGNetworkRequestSuccessBlock)successBlock
             failureBlock:(JZGNetworkRequestFailureBlock)failureBlock
                  showHUD:(BOOL)showHUD;

+ (void)uploadImageWithUrl:(NSString *)url
                parameters:(NSDictionary *)parameters
                    images:(NSArray *)images
           timeoutInterval:(NSTimeInterval)timeInterval
              successBlock:(JZGNetworkRequestSuccessBlock)successBlock
              failureBlock:(JZGNetworkRequestFailureBlock)failureBlock
                   showHUD:(BOOL)showHUD;

+ (void)cancelNetworkRequest;


@end

//
//  JZGNetworkHandler.h
//  AFN3.0封装
//
//  Created by Mars on 15/12/20.
//  Copyright © 2015年 Mars. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JZGNetworkDefine.h"
#import "JZGNetWorkRequest.h"

@interface JZGNetworkHandler : NSObject

@property (strong, nonatomic) JZGNetWorkRequest *request;

@property (assign, nonatomic) NSTimeInterval timeInterval;

+ (JZGNetworkHandler *)sharedNetworkHandler;

/**
 *  networkError
 */
@property(nonatomic,assign)BOOL networkError;

- (void)connectNetWithUrl:(NSString *)url
       requestNetworkType:(JZGNetworkRequestType)networkRequestType
               parameters:(NSDictionary *)parameters
          timeoutInterval:(NSTimeInterval)timeoutInterval
             successBlock:(JZGNetworkRequestSuccessBlock)successBlock
             failureBlock:(JZGNetworkRequestFailureBlock)failureBlock
                  showHUD:(BOOL)showHUD;


- (void)uploadImageWithUrl:(NSString *)url
                parameters:(NSDictionary *)parameters
                    images:(NSArray *)images
           timeoutInterval:(NSTimeInterval)timeInterval
              successBlock:(JZGNetworkRequestSuccessBlock)successBlock
              failureBlock:(JZGNetworkRequestFailureBlock)failureBlock
                   showHUD:(BOOL)showHud;

- (void)cancelNetworkHandler;

@end

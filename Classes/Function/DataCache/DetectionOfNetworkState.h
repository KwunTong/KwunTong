//
//  DetectionOfNetworkState.h
//  KwunTong
//
//  Created by Mars on 16/3/4.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,NetworkState){
    NetworkNotReachable        = 0,//无网络
    NetworkViaWiFi             = 1,//wifi
    NetworkViaWWANType2G       = 2,//2g
    NetworkViaWWANType3G       = 3,//3g
    NetworkViaWWANType4G       = 4,//4g
    NetworkViaWWAN             = 5,//ps（手机数据网络）
    NetworkNotViaWWANReachable = 6,//无法检测的ps网络,可能是iOS6设备无法检测
} ;

@interface DetectionOfNetworkState : NSString

@property (assign, nonatomic) NetworkState networkState;

/**
 *  检查网络状态
 *
 *  @return 检查网络状态后的状态码
 */
+ (NetworkState)shareNetworkState;

/**
 *  监听网络状态
 *
 *  @return 返回监听网络的状态码
 */
+ (NetworkState)listeningNetworkState;

/**
 *  注销通知
 */
+ (void)releaseNotification;

@end

//
//  JZGSystemInfo.h
//  JZGAppraiserNetwork
//
//  Created by Mars on 15/4/3.
//  Copyright (c) 2015年 Mars. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JZGSystemInfo : NSObject
/**
 *  获取手机品牌和型号
 *
 *  @return 手机品牌和型号
 */
+ (NSString*)getDeviceString;

/**
 *  获取app版本号
 *
 *  @return app版本号
 */
+ (NSString *)getAppVersion;

/**
 *  获取手机品牌和型号
 *
 *  @return 手机品牌和型号
 */
+ (NSString *)getDeviceModel;

/**
 *  判断手机是否越狱
 *
 *  @return 1：越狱 0：未越狱
 */
+ (BOOL)isJailbroken;

/**
 *  获取手机系统版本号
 *
 *  @return 手机系统版本号
 */
+ (NSString* ) getOsSystemVersion;

@end

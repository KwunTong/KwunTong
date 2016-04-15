//
//  JZGSystemResource.h
//  JZGDetectionPlatform
//
//  Created by cuik on 16/3/30.
//  Copyright © 2016年 Mars. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JZGSystemResource : NSObject

+ (instancetype)share;
/**
 *  是否允许定位
 */
+ (BOOL)isAlowPosition;

/**
 *  是否允许访问相机
 */
+ (BOOL)isAllowAccessCamera;

/**
 *  是否允许访问相册
 */
+ (BOOL)isAllowAccessPhotos;


/**
 *  处理调用相机
 *
 *  @param allowInvocation 允许使用相机资源后调用的方法
 */
- (void)handleAccessCamera:(NSInvocation *)allowInvocation;

/**
 *  处理调用相册
 *
 *  @param allowInvocation 允许使用相册资源后调用的方法
 */
- (void)handleAccessPhotos:(NSInvocation *)allowInvocation;

@end


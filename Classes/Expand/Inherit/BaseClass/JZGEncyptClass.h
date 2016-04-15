//
//  JZGEncyptClass.h
//  JingZhenGu
//  加密方法
//  Created by Mars on 15/5/11.
//  Copyright (c) 2015年 Mars. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JZGEncyptClass : NSString

/**
 *  加密
 *
 *  @param password 需要加密的字符串
 *
 *  @return 加密后的字符串
 */
+(NSString *)md5HexDigest:(NSString*)password;

/**
 *  数组排序
 *
 *  @param array 需要排序的数组
 *
 *  @return 排序后的数组
 */
+ (NSArray *)parameterSortWithArray:(NSMutableArray *)array;

/**
 *  获取加密后的字典数据
 *
 *  @param dictionary 需要传递的参数字典
 *
 *  @return 加密后重新生成的字典
 */
+ (NSMutableDictionary *)parameterSortWithDictionary:(NSDictionary *)dictionary;

+ (NSMutableDictionary *)parameterCASortWithDictionary:(NSDictionary *)dictionary;


/**
 *  返回排序后的数组
 *
 *  @param array 排序前的数组
 *
 *  @return 排序后的数据
 */
- (NSMutableArray *)selectSortWithArray:(NSArray *)array;

/** 该处使用的接口需重新使用新的加密方式
 *  返回加密后的接口地址
 *
 *  @param url 接口地址
 *
 *  @return 加密后的接口地址
 */
+ (NSString *)postURLEncrypt:(NSString *)url;

@end

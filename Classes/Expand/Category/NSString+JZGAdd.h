//
//  NSString+JZGAdd.h
//  JZGDetectionPlatform
//
//  Created by cuik on 16/3/30.
//  Copyright © 2016年 Mars. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JZGAdd)


#pragma mark - Base64Extension

/**
 *  base64编码
 *
 *  @return 编码后的字符串
 */
- (NSString *)base64Encode;

/**
 *  base64解码
 *
 *  @return 解码后的字符串
 */
- (NSString *)base64Decode;



#pragma mark - Extension

/**
 *  验证邮箱
 *
 *  @return YES or NO
 */
- (BOOL)isEmail;

/**
 *  验证电话
 *
 *  @return YES or NO
 */
- (BOOL)isTelephone;

/**
 *  验证密码
 *
 *  @return YES or NO
 */
- (BOOL)isPassword;

/**
 *  验证数字
 *
 *  @return YES or NO
 */
- (BOOL)isRealNumbers;

/**
 *  验证价格
 *
 *  @return YES or NO
 */
- (BOOL)isEnterNumbers;

/**
 *  验证手机号码
 *
 *  @return YES or NO
 */
- (BOOL)isMobileNumber;

/**
 *  验证？
 *
 *  @return YES or NO
 */
- (BOOL)isOnlyMobileNumber;

/**
 *  控制输入不含特殊符号(能够输入汉字、字母、数字)
 *
 *  @return YES or NO
 */
- (BOOL)isTrueStr;

/**
 *  控制vin输入特殊符号
 *
 *  @return YES or NO
 */
- (BOOL)isTrueVinStr;

/**
 *  是否包涵子字符串
 *
 *  @param subString 传入的字符串
 *
 *  @return YES or NO
 */
- (BOOL)isContainSubString:(NSString *)subString;

/**
 *  车牌号验证
 *
 *  @param carNo 车牌号
 *
 *  @return YES or NO
 */
+ (BOOL) validateCarNo:(NSString *)carNo;

/**
 *  验证车型
 *
 *  @param CarType 车辆类型
 *
 *  @return YES or NO
 */
+ (BOOL) validateCarType:(NSString *)CarType;

/**
 *  验证身份证号
 *
 *  @param identityCard 身份证号
 *
 *  @return YES or NO
 */
+ (BOOL) validateIdentityCard: (NSString *)identityCard;



#pragma mark - Hash Md5

/**
 *  md5
 *
 *  @return md5后的字符串
 */
- (NSString *)md5String;

/**
 *  sha1
 *
 *  @return sha1后的字符串
 */
- (NSString *)sha1String;

/**
 *  sha256
 *
 *  @return sha256后的字符串
 */
- (NSString *)sha256String;

/**
 *  sha512
 *
 *  @return sha512后的字符串
 */
- (NSString *)sha512String;



#pragma mark - ToolMethod

/**
 *  计算label的尺寸
 *
 *  @param label label
 *
 *  @return 文字所占的尺寸
 */
+ (CGSize)sizeWithLabel:(UILabel *)label;

/**
 *  文字的内容、字体大小 计算文字所占的尺寸
 *
 *  @param text    文字内容
 *  @param font    文字字体
 *
 *  @return 文字所占的尺寸
 */
+ (CGSize)sizeWithText:(NSString *)text andFont:(UIFont *)font;

/**
 *  根据文字的内容、字体大小、最大尺寸范围 计算文字所占的尺寸
 *
 *  @param text    文字内容
 *  @param font    文字字体
 *  @param maxSize 最大尺寸范围
 *
 *  @return 文字所占的尺寸
 */
+ (CGSize)sizeWithText:(NSString *)text andFont:(UIFont *)font andMaxSize:(CGSize)maxSize;

/**
 *  获取当前日期字符串
 *
 *  @param format 格式化字符串
 */
+ (NSString *)getNowDateStringWithDateFormat:(NSString *)format;

/**
 *  获取当前的年/月
 *
 *  @param type 1:年 2:月
 */
+ (NSInteger)getNowYearOrMonth:(int)type;

/**
 *  将字典、数组 转换为json字符串
 *
 *  @param object 字典、数组
 *
 *  @return 转换为json字符串
 */
+ (NSString *)jsonStringWithObject:(id)object;

/**
 *  获取当前的年/月
 *
 *  @param nowStr 当前时间
 *  @param regStr 注册时间
 */
+ (NSInteger)getMonthWithRegDate:(NSString *)regStr;

/**
 *  字符串替换
 *
 *  @param stringToBeChanged     <#stringToBeChanged description#>
 *  @param stringToBeChangedWith <#stringToBeChangedWith description#>
 *  @param oldStr                <#oldStr description#>
 *
 *  @return 替换后的字符串
 */
+ (NSString *)replaceOldStr:(NSString *)stringToBeChanged withStr:(NSString *)stringToBeChangedWith withString:(NSString *)oldStr;

/**
 *  浮点数处理并去掉多余的0
 *
 *  @param string <#string description#>
 *  @param round  <#round description#>
 *  @param format <#format description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)stringDisposeWithString:(NSString *)string rounding:(BOOL)round format:(NSString *)format;

/**
 *  ?
 *
 *  @param format <#format description#>
 *  @param floatV <#floatV description#>
 *
 *  @return <#return value description#>
 */
- (NSString *) decimalwithFormat:(NSString *)format  floatV:(float)floatV;

/**
 *  ?
 *
 *  @param oldStr <#oldStr description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)newNotNullStr:(NSString *)oldStr;

@end

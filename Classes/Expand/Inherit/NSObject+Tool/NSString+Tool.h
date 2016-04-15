//
//  NSString+Tool.h
//  Copyright (c) 2014年 高万里. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Tool)

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
 */
+ (NSString *)jsonStringWithObject:(id)object;
/**
 *  将字符串设置为非空字符串
 */
+ (NSString *)newNotNullStr:(NSString *)oldStr;

@end

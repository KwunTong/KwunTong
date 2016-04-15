//
//  NSString+Tool.m
//  Copyright (c) 2014年 高万里. All rights reserved.
//

#import "NSString+Tool.h"

@implementation NSString (Tool)

+ (CGSize)sizeWithLabel:(UILabel *)label
{
    NSDictionary *attr = @{ NSFontAttributeName:label.font };
    NSString *text = label.text;
    if (text == nil)
        text = @"字体";
    return [text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}

+ (CGSize)sizeWithText:(NSString *)text andFont:(UIFont *)font
{
    NSDictionary *attr = @{ NSFontAttributeName:font };
    return [text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}

+ (CGSize)sizeWithText:(NSString *)text andFont:(UIFont *)font andMaxSize:(CGSize)maxSize
{
    NSDictionary *attr = @{ NSFontAttributeName:font };
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}

+ (NSString *)getNowDateStringWithDateFormat:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = format;
    return [formatter stringFromDate:[NSDate date]];
}

+ (NSInteger)getNowYearOrMonth:(int)type
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth;
    NSDateComponents *component = [calendar components:unitFlags fromDate:[NSDate date]];
    if (type == 1)
        return component.year;
    else if (type == 2)
        return component.month;
    return 0;
}

+ (NSString *)jsonStringWithObject:(id)object
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if ([jsonData length] != 0 && error == nil)
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    else
        return nil;
}

+ (NSString *)newNotNullStr:(NSString *)oldStr{
    if (oldStr) {
        return oldStr;
    }
    else{
        return @"";
    }
}

@end

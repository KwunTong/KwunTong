//
//  NSString+JZGAdd.m
//  JZGDetectionPlatform
//
//  Created by cuik on 16/3/30.
//  Copyright © 2016年 Mars. All rights reserved.
//

#import "NSString+JZGAdd.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (JZGAdd)


#pragma mark - Base64

- (NSString *)base64Encode
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}

- (NSString *)base64Decode
{
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:0];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}



#pragma mark - Extension

- (BOOL)isEmail
{
    NSString *      regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

- (BOOL)isTelephone
{
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    return  [regextestmobile evaluateWithObject:self]   ||
    [regextestphs evaluateWithObject:self]      ||
    [regextestct evaluateWithObject:self]       ||
    [regextestcu evaluateWithObject:self]       ||
    [regextestcm evaluateWithObject:self];
}

- (BOOL)isPassword
{
    NSString *      regex = @"(^[A-Za-z0-9]{6,20}$)";
    NSLog(@"regex = %@",regex);
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

- (BOOL)isRealNumbers{
    //    var reg = /^(([1-9]+)|([0-9]+\.[0-9]{1,2}))$/;
    //    NSString * regex = @"^[0-9]{7}+.[0-9]{2}?$";
    //    NSString *      regex = @"(^[A-Za-z0-9]{6,20}$)";
    //    NSString * regex = @"(-?\\d+)(\\.\\d+)?";
    NSString * regex = @"^(0|[1-9][0-9]*)$";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

- (BOOL)isEnterNumbers{
    NSString * regex = @"((0|[1-9][0-9]{0,5})\\.[0-9]{0,3})|(0|[1-9][0-9]{0,3})";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    NSUInteger pointLength =[self rangeOfString:@"."].location;
    NSLog(@"location = %zd",[self rangeOfString:@"."].location);
    if ((pointLength+3)<[self length]) {
        return NO;
    }
    return [pred evaluateWithObject:self];
}

- (BOOL)isMobileNumber
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     * 虚拟号码：177
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    //虚拟号码
    NSString * XNHM = @"^1(77)\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestXNHM = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", XNHM];
    NSPredicate *regextestPHS = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    if (([regextestmobile evaluateWithObject:self] == YES)
        || ([regextestcm evaluateWithObject:self] == YES)
        || ([regextestct evaluateWithObject:self] == YES)
        || ([regextestcu evaluateWithObject:self] == YES)
        || ([regextestXNHM evaluateWithObject:self] == YES)
        || ([regextestPHS evaluateWithObject:self] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (BOOL)isOnlyMobileNumber{
    return YES;
}

- (BOOL)isTrueStr{
    
    NSString * regex = @"^[\\u4E00-\\u9FA5\\uF900-\\uFA2D\\w]{0,50}";
    NSPredicate *  pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:self];
}

- (BOOL)isTrueVinStr{
    NSString * regex = @"^[\\u4E00-\\u9FA5\\uF900-\\uFA2D\\w]{0,50}";
    NSPredicate *  pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:self]) {
        regex =@"[^I|^i|^O|^o|^Q|^q]+";
        pred =[NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        return [pred evaluateWithObject:self];
    }else{
        return NO;
    };
}

- (BOOL)isContainSubString:(NSString *)subString{
    if([self rangeOfString:subString].location != NSNotFound){
        return YES;
    }else{
        return NO;
    }
}

+ (BOOL) validateCarNo:(NSString *)carNo
{
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:carNo];
}

+ (BOOL) validateCarType:(NSString *)CarType
{
    NSString *CarTypeRegex = @"^[\u4E00-\u9FFF]+$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CarTypeRegex];
    return [carTest evaluateWithObject:CarType];
}

+ (BOOL) validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}


-(NSNumber *)asNumber{
    NSString *regEx = @"^-?\\d+.?\\d?";
    NSPredicate * pred      = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    BOOL isMatch            = [pred evaluateWithObject:self];
    if (isMatch) {
        return [NSNumber numberWithDouble:[self doubleValue]];
    }
    return nil;
}

+ (BOOL)isEmailAddress:(NSString*)candidate
{
    NSString* emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:candidate];
}

- (BOOL)isUserName
{
    NSString *      regex = @"(^[A-Za-z0-9]{3,20}$)";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

- (BOOL)isUrl
{
    NSString *      regex = @"http(s)?:\\/\\/([\\w-]+\\.)+[\\w-]+(\\/[\\w- .\\/?%&=]*)?";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}


#pragma mark - Hash Md5

- (NSString *)md5String
{
    const char *str = self.UTF8String;
    int length = (int)strlen(str);
    unsigned char bytes[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, length, bytes);
    
    return [self stringFromBytes:bytes length:CC_MD5_DIGEST_LENGTH];
}

- (NSString *)sha1String
{
    const char *str = self.UTF8String;
    int length = (int)strlen(str);
    unsigned char bytes[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(str, length, bytes);
    
    return [self stringFromBytes:bytes length:CC_SHA1_DIGEST_LENGTH];
}

- (NSString *)sha256String
{
    const char *str = self.UTF8String;
    int length = (int)strlen(str);
    unsigned char bytes[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(str, length, bytes);
    
    return [self stringFromBytes:bytes length:CC_SHA256_DIGEST_LENGTH];
}

- (NSString *)sha512String
{
    const char *str = self.UTF8String;
    int length = (int)strlen(str);
    unsigned char bytes[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(str, length, bytes);
    
    return [self stringFromBytes:bytes length:CC_SHA512_DIGEST_LENGTH];
}

- (NSString *)stringFromBytes:(unsigned char *)bytes length:(int)length
{
    NSMutableString *strM = [NSMutableString string];
    
    for (int i = 0; i < length; i++) {
        [strM appendFormat:@"%02x", bytes[i]];
    }
    
    return [strM copy];
}


#pragma mark - ToolMethod

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

+ (NSInteger)getMonthWithRegDate:(NSString *)regStr{
    
    NSString *regDateStr = regStr;
    if ([regStr rangeOfString:@"/"].location !=  NSNotFound) {
        regDateStr = [self replaceOldStr:@"/" withStr:@"-" withString:regStr];
        
    }
    else if ([regStr rangeOfString:@"年"].location != NSNotFound){
        regDateStr = [self replaceOldStr:@"年" withStr:@"-" withString:regStr];
        regDateStr = [self replaceOldStr:@"月" withStr:@"" withString:regDateStr];
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM"];
    NSDate *todayDate = [NSDate date];
    NSString *nowDate=[dateFormatter stringFromDate:todayDate];
    
    NSInteger nowYear = [[nowDate componentsSeparatedByString:@"-"].firstObject integerValue];
    NSInteger nowMonth = [[nowDate componentsSeparatedByString:@"-"].lastObject integerValue];
    
    NSArray *array = [regDateStr componentsSeparatedByString:@"-"];
    NSInteger regYear = 0;
    NSInteger regMonth = 0;
    NSInteger months = 0;
    if (array.count >= 2) {
        regYear = [[array firstObject] integerValue];
        regMonth = [[array objectAtIndex:1] integerValue];
        months = (nowYear - regYear) * 12;
        months += (nowMonth - regMonth);
    }else{
        return 0;
    }
    return months;
}

+ (NSString *)replaceOldStr:(NSString *)stringToBeChanged withStr:(NSString *)stringToBeChangedWith withString:(NSString *)oldStr{
    NSString *newStr = [oldStr stringByReplacingOccurrencesOfString:stringToBeChanged withString:stringToBeChangedWith];
    return newStr;
}

+ (NSString *)stringDisposeWithString:(NSString *)string rounding:(BOOL)round format:(NSString *)format
{
    if (round) {
        string = [[[self alloc] init] decimalwithFormat:format floatV:([string floatValue] + 0.001)];
    }
    
    NSInteger len = string.length;
    for (int i = 0; i < len; i++)
    {
        if (![string  hasSuffix:@"0"])
            break;
        else
            string = [string substringToIndex:[string length]-1];
    }
    if ([string hasSuffix:@"."])//避免像2.0000这样的被解析成2.
    {
        
        return [string substringToIndex:[string length]-1];//s.substring(0, len - i - 1);
    }
    else
    {
        return string;
    }
}

- (NSString *) decimalwithFormat:(NSString *)format  floatV:(float)floatV
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    
    [numberFormatter setPositiveFormat:format];
    
    return  [numberFormatter stringFromNumber:[NSNumber numberWithFloat:floatV]];
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

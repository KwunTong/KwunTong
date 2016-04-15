//
//  JZGEncyptClass.m
//  JingZhenGu
//
//  Created by Mars on 15/5/11.
//  Copyright (c) 2015年 Mars. All rights reserved.
//

#import "JZGEncyptClass.h"
#import <CommonCrypto/CommonDigest.h>

#define SOLE_ID                   @"3CEA5FCD-451F-4B97-87B6-A2C6C7C8A5FD"

@implementation JZGEncyptClass

#pragma mark - MD5加密
+(NSString *)md5HexDigest:(NSString*)password
{
    const char *original_str = [password UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (unsigned int)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
    {
        [hash appendFormat:@"%02X", result[i]];
    }
    NSString *mdfiveString = [hash lowercaseString];
    
    return mdfiveString;
}

+ (NSString *)postURLEncrypt:(NSString *)url
{
    NSString *sign = [[JZGEncyptClass md5HexDigest:[NSString stringWithFormat:@"?%@",SOLE_ID]] uppercaseString];
    return [NSString stringWithFormat:@"%@?&sign=%@",url,sign];
}

+ (NSArray *)parameterSortWithArray:(NSMutableArray *)array
{
    return [array sortedArrayUsingSelector:@selector(compare:)];
}

+ (NSMutableDictionary *)parameterSortWithDictionary:(NSDictionary *)dictionary
{
    if(dictionary){
        NSMutableDictionary *tempDic =[NSMutableDictionary dictionary];
        [tempDic addEntriesFromDictionary:dictionary];
        tempDic[@"tokenid"] = CUSTOMTOKENID;
        //获取字典keys
        NSArray *array = [tempDic allKeys];
        NSMutableArray *sortedArray = [[[JZGEncyptClass alloc] init] selectSortWithArray:array];
        NSString *allStr = @"";
        for (NSString *str in sortedArray) {
            NSString *s = [NSString stringWithFormat:@"%@=%@",str,[tempDic objectForKey:str]];
            allStr = [NSString stringWithFormat:@"%@%@",allStr,s];
        }
        allStr = [[NSString stringWithFormat:@"%@%@",allStr,SOLE_ID] lowercaseString];
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithDictionary:tempDic];
        [dic setValue:[[JZGEncyptClass md5HexDigest:allStr] uppercaseString] forKey:@"sign"];
        return dic;
    }
    else{
        NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];

        tempDic[@"tokenid"] = CUSTOMTOKENID;
        NSArray *array = [tempDic allKeys];
        NSMutableArray *sortedArray = [[[JZGEncyptClass alloc] init] selectSortWithArray:array];
        NSString *allStr = @"";
        for (NSString *str in sortedArray) {
            NSString *s = [NSString stringWithFormat:@"%@=%@",str,[tempDic objectForKey:str]];
            allStr = [NSString stringWithFormat:@"%@%@",allStr,s];
        }
        allStr = [[NSString stringWithFormat:@"%@%@",allStr,SOLE_ID] lowercaseString];
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithDictionary:tempDic];
        [dic setValue:[[JZGEncyptClass md5HexDigest:allStr] uppercaseString] forKey:@"sign"];

        return dic;
    }
}


+ (NSMutableDictionary *)parameterCASortWithDictionary:(NSDictionary *)dictionary
{
    if(dictionary){
        //获取字典keys
        NSArray *array = [dictionary allKeys];
        NSMutableArray *sortedArray = [[[JZGEncyptClass alloc] init] selectSortWithArray:array];
        NSString *allStr = @"";
        for (NSString *str in sortedArray) {
            NSString *s = [NSString stringWithFormat:@"%@=%@",str,[dictionary objectForKey:str]];
            allStr = [NSString stringWithFormat:@"%@%@",allStr,s];
        }
        allStr = [[NSString stringWithFormat:@"%@%@",allStr,SOLE_ID] lowercaseString];
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithDictionary:dictionary];
        [dic setValue:[[JZGEncyptClass md5HexDigest:allStr] uppercaseString] forKey:@"sign"];
        return dic;
    }else{
        NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
//        tempDic[@"tokenid"] = CUSTOMTOKENID;
        NSArray *array = [tempDic allKeys];
        NSMutableArray *sortedArray = [[[JZGEncyptClass alloc] init] selectSortWithArray:array];
        NSString *allStr = @"";
        for (NSString *str in sortedArray) {
            NSString *s = [NSString stringWithFormat:@"%@=%@",str,[tempDic objectForKey:str]];
            allStr = [NSString stringWithFormat:@"%@%@",allStr,s];
        }
        allStr = [[NSString stringWithFormat:@"%@%@",allStr,@"2CB3147B-D93C-964B-47AE-EEE448C84E3C"] lowercaseString];
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithDictionary:tempDic];
        [dic setValue:[[JZGEncyptClass md5HexDigest:allStr] uppercaseString] forKey:@"sign"];
        
        return dic;
    }
}


-(void)swapWithData:(NSMutableArray *)aData index1:(NSInteger)index1 index2:(NSInteger)index2{
   NSNumber *tmp = [aData objectAtIndex:index1];
            [aData replaceObjectAtIndex:index1 withObject:[aData objectAtIndex:index2]];
    [aData replaceObjectAtIndex:index2 withObject:tmp];
}

- (NSMutableArray *)selectSortWithArray:(NSArray *)array{
    NSMutableArray *mulArray = [[NSMutableArray alloc]initWithArray:array];
    for (int i=0; i<[mulArray count]-1; i++) {
        int m =i;
        for (int j =i+1; j<[mulArray count]; j++) {
            if ([[mulArray objectAtIndex:j] caseInsensitiveCompare:[mulArray objectAtIndex:m]] == -1) {
                m = j;
            }
        }
        if (m != i) {
                [self swapWithData:mulArray index1:m index2:i];
        }
    }
    
    return mulArray;
}

@end

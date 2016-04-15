//
//  JZGFileManager.m
//  JZGAppraiserNetwork
//
//  Created by Mars on 15/4/13.
//  Copyright (c) 2015年 Mars. All rights reserved.
//

#import "JZGFileManager.h"

@implementation JZGFileManager

//获取沙盒Document目录
+(NSString*)getDocumentFile
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}
//获取libraray目录
+(NSString*)getLibraryFile
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}
//获得存储车数据的目录
+(NSString*)getCarDataFile
{
    NSString *carStr = [JZGFileManager getDocumentFile];
    carStr = [carStr stringByAppendingPathComponent:@"carData"];
    [[NSFileManager defaultManager]createDirectoryAtPath:carStr withIntermediateDirectories:YES attributes:nil error:nil];
    return carStr;
}

//写入string,
+(void)saveStringToFullPath:(NSString *)fullPath string:(NSString *)string append:(BOOL)flag
{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    [self saveDataToFullPath:fullPath data:data append:flag];
    
}

//写入data
+(void)saveDataToFullPath:(NSString *)fullPath data:(NSData *)data append:(BOOL)flag
{
    if(!flag)
    {
        [self removeFile:fullPath];
        [data writeToFile:fullPath atomically:YES];
    }
    else
    {
        NSFileHandle* outFile;
        outFile = [NSFileHandle fileHandleForWritingAtPath:fullPath];
        if(outFile != nil)
        {
            [outFile seekToEndOfFile];
            [outFile writeData:data];
            [outFile closeFile];
        }else
        {
            [data writeToFile:fullPath atomically:YES];
        }
    }
    
}
//删除文件
+(BOOL)removeFile:(NSString *)fullPath
{
    BOOL isExist = FALSE;
    if ([[NSFileManager defaultManager] fileExistsAtPath:fullPath])
    {
        isExist = [[NSFileManager defaultManager] removeItemAtPath:fullPath error:nil];
    }
    return  isExist;
}

+(void)writeLogToFullPath:(NSString *)fullPath string:(NSString *)string append:(BOOL)flag
{
    NSDate* date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd HH:mm:ss:SS"];
    
    NSString* tmpMsg = [NSString stringWithFormat:@"%@:%@\n", [dateFormatter stringFromDate:date],string];
    
    NSData *writer = [[NSData alloc] initWithData:[tmpMsg dataUsingEncoding:NSUTF8StringEncoding]];
    [self saveDataToFullPath:fullPath data:writer append:flag];
}
//获取当前时间
+(NSString*)getCurrentTime
{
    NSDate* date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd-HH-mm-ss-SS"];
    return  [dateFormatter stringFromDate:date];
}
+(NSString*)getCheckTime
{
    NSDate* date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    return  [dateFormatter stringFromDate:date];
}

/**
 *  @brief  获得指定目录下，指定后缀名的文件列表
 *  @param  type    文件后缀名
 *  @param  dirPath     指定目录
 *  @return 文件名列表
 */
+(NSArray *)getFileArrayOfType:(NSString*)type fromFilePath:(NSString*)path
{
    NSMutableArray *fileArray = [NSMutableArray  array];
    
    NSArray *allFileArray = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
    
    for (NSString *fileName in allFileArray) {
        NSString *fullpath = [path stringByAppendingPathComponent:fileName];
        if ([JZGFileManager isFileExistAtPath:fullpath]) {
            if ([[fileName pathExtension] isEqualToString:type]) {
                [fileArray  addObject:fileName];
            }
        }
    }
    return fileArray;
    
}
/**
 *  @brief  检查文件是否存在
 *  @param  type    文件全路径
 *  @return 是否存在
 */
+(BOOL)isFileExistAtPath:(NSString*)fileFullPath {
    BOOL isExist = NO;
    isExist = [[NSFileManager defaultManager] fileExistsAtPath:fileFullPath];
    return isExist;
}


@end

//
//  JZGCache.m
//  KwunTong
//
//  Created by Mars on 16/3/7.
//  Copyright © 2016年 Levin. All rights reserved.
//

#import "JZGCache.h"


static JZGCache *_instance;

@implementation JZGCache

+ (instancetype)shareJZGCache {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[JZGCache alloc]init];
    });
    return _instance;
}

//- (void)saveImage:(NSData *)imgData ToDocument:(NSString *)document
//{
////    [self ddddddddddd];
////    UIImage *image = [UIImage imageNamed:@"1.jpg"];
//
//    NSString *filePath = [kDocumentsPath stringByAppendingPathComponent:@"Image/123456.jpg"];
//    //    UIImage *img = [UIImage imageWithContentsOfFile:filePath];
//    BOOL loadI = [UIImagePNGRepresentation(imgData)writeToFile: filePath atomically:YES];
//    
//}

/** 读取数据 */
- (void)unArchiver
{
    //获取文件路径
    NSString *createPath = [kDocumentsPath stringByAppendingPathComponent:@"/Image/data"];
    
    NSMutableArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:createPath];
    
    for (JZGBaseInfoModel *model in array) {
        NSLog(@"%@---%@---%@---%@ -- \r 文件已提取完毕",model.vin,model.contacts,model.contactPhone,model.submitPrice);
    }
}

/** 保存数据到指定路径下 */
- (void)archiver:(NSArray *)array withPath:(NSString *)fileName
{
    
//    NSMutableArray *ar = [self initializeData];
    
    NSString *createPath = [kDocumentsPath stringByAppendingPathComponent:@"/Image/data"];
    /** 保存数据到指定位置 */
    [NSKeyedArchiver archiveRootObject:array toFile:createPath];
}

/** 判断是否存在文件夹，存在则返回，不存在就创建 */
- (void)fileExistsAtPath:(NSString *)filePath withFileName:(NSString *)fileName
{
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    //    NSString *pathDocuments = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString *createPath = [NSString stringWithFormat:@"%@/Image", kDocumentsPath];
    NSString *createDir = [NSString stringWithFormat:@"%@/MessageQueueImage", kDocumentsPath];
    
    // 判断文件夹是否存在，如果不存在，则创建
    if (![[NSFileManager defaultManager] fileExistsAtPath:createPath]) {
        [fileManager createDirectoryAtPath:createPath withIntermediateDirectories:YES attributes:nil error:nil];
        [fileManager createDirectoryAtPath:createDir withIntermediateDirectories:YES attributes:nil error:nil];
    } else {
        NSLog(@"FileDir is exists.");
    }
}




@end

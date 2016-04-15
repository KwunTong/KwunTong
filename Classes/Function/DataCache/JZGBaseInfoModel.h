//
//  JZGBaseInfoModel.h
//  KwunTong
//
//  Created by Mars on 16/3/7.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JZGBaseInfoModel : NSObject

/** vin */
@property (copy, nonatomic) NSString *vin;
/** 联系人 */
@property (copy, nonatomic) NSString *contacts;
/** 联系号码 */
@property (copy, nonatomic) NSString *contactPhone;
/** 成交价 */
@property (copy, nonatomic) NSString *submitPrice;
/** 对应的图片文件名称 */
@property (copy, nonatomic) NSString *imageName;


@end

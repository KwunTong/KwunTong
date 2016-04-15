//
//  PLBaseDataModel.h
//  PLTP_M_CARRIERS
//
//  Created by Lucas on 14-8-27.
//  Copyright (c) 2014年 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+YYModel.h"

@interface JZGBaseDataModel : NSObject<NSCopying,NSCoding>

@property (nonatomic,copy)NSString *recordId;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

- (void)emptyAllValue;

@end

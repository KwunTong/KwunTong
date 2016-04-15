//
//  BaseModel.m
//  KwunTong
//
//  Created by Mars on 16/3/4.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

// 保存数据时调用(归档)
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.vin forKey:@"vin"];
    [aCoder encodeObject:self.person forKey:@"person"];
    [aCoder encodeObject:self.phone forKey:@"phone"];
    [aCoder encodeObject:self.price forKey:@"price"];
}

// 恢复数据时调用
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.vin = [aDecoder decodeObjectForKey:@"vin"];
        self.person = [aDecoder decodeObjectForKey:@"person"];
        self.phone = [aDecoder decodeObjectForKey:@"phone"];
        self.price = [aDecoder decodeObjectForKey:@"price"];
    }
    return self;
}

@end

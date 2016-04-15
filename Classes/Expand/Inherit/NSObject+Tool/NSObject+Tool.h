//
//  NSObject+Tool.h
//  JZGAppraiserNetwork
//
//  Created by test on 14-12-5.
//  Copyright (c) 2014年 Mars. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Tool)

/**根据后台返回的字典 将msg和stutas字段去除 返回一个新的字典*/
- (NSDictionary *)splitResponseObject:(id)responseObject;

@end

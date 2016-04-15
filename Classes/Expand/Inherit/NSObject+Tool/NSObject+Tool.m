//
//  NSObject+Tool.m
//  JZGAppraiserNetwork
//
//  Created by test on 14-12-5.
//  Copyright (c) 2014年 Mars. All rights reserved.
//

#import "NSObject+Tool.h"

@implementation NSObject (Tool)

- (NSDictionary *)splitResponseObject:(id)responseObject
{
    NSMutableDictionary *dictM = [NSMutableDictionary dictionaryWithDictionary:responseObject];
    [dictM removeObjectForKey:@"msg"];
    [dictM removeObjectForKey:@"status"];
    return dictM;
}

@end

//
//  NSString+Extension.h
//  JZGAppraiserNetwork
//
//  Created by Mars on 14-11-25.
//  Copyright (c) 2014年 Mars. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

- (BOOL)isEmail;
- (BOOL)isTelephone;
- (BOOL)isPassword;
- (BOOL)isRealNumbers;
- (BOOL)isMobileNumber;
- (BOOL)isTrueVinStr;

@end

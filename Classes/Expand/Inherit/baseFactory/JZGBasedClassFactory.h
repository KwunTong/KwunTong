//
//  JZGBasedClassFactory.h
//  JZGDetectionPlatform
//
//  Created by Wen Dongxiao on 15/12/21.
//  Copyright © 2015年 Mars. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JZGBasedClassFactory : NSObject

+ (UIBarButtonItem *) createCustomBarItem:(CGRect)frame image:(UIImage *)image title:(NSString *)title font:(UIFont *)font target:(id)target action:(SEL)action;
@end

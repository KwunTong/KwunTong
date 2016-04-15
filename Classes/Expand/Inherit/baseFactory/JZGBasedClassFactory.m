//
//  JZGBasedClassFactory.m
//  JZGDetectionPlatform
//
//  Created by Wen Dongxiao on 15/12/21.
//  Copyright © 2015年 Mars. All rights reserved.
//

#import "JZGBasedClassFactory.h"

@implementation JZGBasedClassFactory
//自定义barButton
+(UIBarButtonItem *) createCustomBarItem:(CGRect)frame image:(UIImage *)image title:(NSString *)title font:(UIFont *)font target:(id)target action:(SEL)action
{
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeSystem] ;
    btn.frame = frame ;
    btn.tag = 100;
    btn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:image forState:UIControlStateHighlighted];
    [btn setTitleColor:FONT_COLOR_BLACK forState:UIControlStateNormal];
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    return barBtn;
}
@end

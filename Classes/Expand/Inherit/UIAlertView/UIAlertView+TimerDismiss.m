//
//  UIAlertView+TimerDismiss.m
//  JZGAppraiserNetwork
//
//  Created by Mars on 15/3/23.
//  Copyright (c) 2015年 Mars. All rights reserved.
//

#import "UIAlertView+TimerDismiss.h"

@implementation UIAlertView (TimerDismiss)

- (void)setAlertViewTime:(float)time
{
    [NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
    [self performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES]; //直接show可能造成屏幕闪烁，放到主线程就不会出现闪烁问题
//    [self show];
}

-(void) performDismiss:(NSTimer *)timer
{
    [self dismissWithClickedButtonIndex:0 animated:NO];
}



@end

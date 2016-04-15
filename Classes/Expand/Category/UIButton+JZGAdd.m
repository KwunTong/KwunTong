//
//  UIButton+JZGAdd.m
//  JZGDetectionPlatform
//
//  Created by cuik on 16/3/30.
//  Copyright © 2016年 Mars. All rights reserved.
//

#import "UIButton+JZGAdd.h"

@implementation UIButton (JZGAdd)

#pragma mark - 设置背景颜色

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    [self setBackgroundImage:[UIImage imageWithColor:backgroundColor] forState:state];
}


#pragma mark - 设置倒计时时间

- (void)startCountdown:(NSUInteger)seconds{
    NSString *originalTitle = [self titleForState:UIControlStateNormal];
    UIImage *originalImage = [self backgroundImageForState:UIControlStateNormal];
    
    //倒计时代码
    __block NSUInteger timeout = seconds; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){
            //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                self.userInteractionEnabled = YES;
                [self setTitle:originalTitle forState:UIControlStateNormal];
                [self setBackgroundImage:originalImage forState:UIControlStateNormal];
                self.backgroundColor = [UIColor clearColor];
                [self setTitleColor:LIGHT_YELLOW_COLOR forState:UIControlStateNormal];
            });
        }else{
            //倒计时执行时
            int residueSeconds = ((int)timeout/10)*10 + timeout%10;
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                self.userInteractionEnabled = NO;
                self.titleLabel.lineBreakMode = 0;
                self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
                [self setTitle:[NSString stringWithFormat:@"  %d秒后\n再次发送",residueSeconds] forState:UIControlStateNormal];
                [self setTitleColor:RGBCOLOR(51, 61, 81) forState:UIControlStateNormal];
                [self setBackgroundImage:nil forState:UIControlStateNormal];
                self.backgroundColor = RGBCOLOR(239, 239, 246);
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}


@end

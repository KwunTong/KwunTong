//
//  PLBasePopView.m
//  PLTP_M_CARRIERS
//
//  Created by Lucas on 14/12/11.
//  Copyright (c) 2014年 Lucas. All rights reserved.
//

#import "JZGBasePopView.h"

@implementation JZGBasePopView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.frame = CGRectMake(0.0f, 0.0f, WIDTH, HEIGHT);
        self.alpha = 1.0;
        
        //颜色变暗处的视图
        UIControl *topView = [[UIControl alloc] initWithFrame:CGRectMake(0.0f, 0.0f, WIDTH, HEIGHT)];
        topView.tag = 1;
        topView.alpha = 0.0;
        [topView addTarget:self action:@selector(popViewDidDisAppear) forControlEvents:UIControlEventTouchUpInside];
        topView.backgroundColor = [UIColor blackColor];
        [self addSubview:topView];
        
        [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    }
    return self;
}

-(void)showBasePopView:(float)hei{
    self.popViewHeight = hei;
    _popView = [[UIView alloc] initWithFrame:CGRectMake(40.0f, HEIGHT, WIDTH-80.0f, hei)];
    _popView.layer.cornerRadius = 5;
    _popView.layer.masksToBounds = YES;
    _popView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_popView];
    
    [self popViewDidAppear];
}

-(void)popViewDidAppear{
    [UIView animateWithDuration:0.5 animations:^{
        _popView.frame = CGRectMake(40.0f, (HEIGHT-_popViewHeight)/2, WIDTH-80.0f, _popViewHeight);
        UIView *topView = (UIView*)[self viewWithTag:1];
        topView.alpha = 0.4;
    } completion:^(BOOL finished) {
    }];
}

-(void)popViewDidDisAppear{
}

@end

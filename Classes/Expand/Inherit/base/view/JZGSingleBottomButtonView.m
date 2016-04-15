//
//  PLHaveBottomButtonView.m
//  PLTP_M_CARRIERS
//
//  Created by Lucas on 14/11/27.
//  Copyright (c) 2014年 Jack. All rights reserved.
//

#import "JZGSingleBottomButtonView.h"

@implementation JZGSingleBottomButtonView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame tableViewStyle:(UITableViewStyle)style{
    self = [super initWithFrame:frame tableViewStyle:style];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize{
    
    UIImage *normalImage = [UIImage imageNamed:@"按钮可用"];
    UIImage *highlightImage = [UIImage imageNamed:@"按钮点击"];
    UIImage *disabledImage = [UIImage imageNamed:@"按钮不可用"];
    UIEdgeInsets  insets = UIEdgeInsetsMake(10,10,10, 10);
    
    // 添加底部按钮
    _bottomButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [_bottomButton setBackgroundImage:[normalImage resizableImageWithCapInsets:insets]
                                forState:UIControlStateNormal];
    [_bottomButton setBackgroundImage:[highlightImage resizableImageWithCapInsets:insets]
                                forState:UIControlStateHighlighted];
    [_bottomButton setBackgroundImage:[disabledImage resizableImageWithCapInsets:insets]
                             forState:UIControlStateDisabled];
    
    [_bottomButton.titleLabel setFont:PltpBoldFont(17.0)];
    
    [_bottomButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIView *buttonView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), 74)];
    [buttonView setBackgroundColor:[UIColor clearColor]];
    [buttonView addSubview:_bottomButton];
    self.tableView.tableFooterView=buttonView;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.tableView.frame=self.bounds;
    _bottomButton.frame = CGRectMake(10,15,CGRectGetWidth(self.bounds)-20,44.0);
}

@end

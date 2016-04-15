//
//  PLCustomNaviView.m
//  GYS
//
//  Created by Lucas on 15/7/2.
//  Copyright (c) 2015年 sequence. All rights reserved.
//

#import "JZGCustomNaviView.h"

@implementation JZGCustomNaviView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.font = PltpBoldFont(18);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_titleLabel];
        
        _leftButton = [[UIButton alloc] initWithFrame:CGRectZero];
        _leftButton.backgroundColor = [UIColor clearColor];
        [_leftButton setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
        [_leftButton.titleLabel setFont:PltpFont(16)];
        [self addSubview:_leftButton];
        
        _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(self.width - 60,
                                                                  22,
                                                                  40,
                                                                  40)];
        _rightButton.backgroundColor = [UIColor clearColor];
        [_rightButton setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
        [_rightButton.titleLabel setFont:PltpFont(16)];
        [self addSubview:_rightButton];
    }
    return self ;
}

- (void)setRightButton:(UIButton *)rightButton{
    [_rightButton removeFromSuperview];
    _rightButton = nil;
    _rightButton = rightButton;

    [self addSubview:_rightButton];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat xoffset = 10.0;
    CGFloat yoffset = 10.0;
    
    _leftButton.frame = CGRectMake(xoffset,
                                   22,
                                   140,
                                   40);
    [_titleLabel sizeToFit];
    _titleLabel.frame = CGRectMake((self.width - _titleLabel.width) / 2,
                                   (self.height - _titleLabel.height) / 2  + yoffset,
                                   _titleLabel.width, _titleLabel.height);
}
@end

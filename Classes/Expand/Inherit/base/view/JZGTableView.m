//
//  PLTableView.m
//  GYS
//
//  Created by Lucas on 15/7/11.
//  Copyright (c) 2015年 sequence. All rights reserved.
//

#import "JZGTableView.h"

@implementation JZGTableView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self)
    {

        if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
            [self setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
            [self setLayoutMargins:UIEdgeInsetsZero];
        }
        
        
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.separatorColor = CUTTING_LINE_COLOR;
        
        self.tableFooterView = [[UIView alloc] init];
    }
    
    return self;
}

@end

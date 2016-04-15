//
//  PLSingleTableView.m
//  PLTP_M_CARRIERS
//
//  Created by Lucas on 14/11/27.
//  Copyright (c) 2014年 Jack. All rights reserved.
//

#import "JZGSingleTableView.h"

@implementation JZGSingleTableView{

}

- (id)initWithFrame:(CGRect)frame{
    return [self initWithFrame:frame tableViewStyle:UITableViewStylePlain];
}

- (instancetype)initWithFrame:(CGRect)frame tableViewStyle:(UITableViewStyle)style{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:style];
        _tableView.backgroundColor = [UIColor clearColor];
    
        [self addSubview:_tableView];
        if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [_tableView setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([_tableView respondsToSelector:@selector(setLayoutMargins:)]) {
            [_tableView setLayoutMargins:UIEdgeInsetsZero];
        }
        
        if (style == UITableViewStyleGrouped) {
            _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, _tableView.width, 0.01f)];
        }
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = CUTTING_LINE_COLOR;
        
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];

    _tableView.frame = self.bounds;
    
  
}

@end

//
//  PLSingleTableView.h
//  PLTP_M_CARRIERS
//
//  Created by Lucas on 14/11/27.
//  Copyright (c) 2014年 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZGSingleTableView : UIView

@property (nonatomic,strong)UITableView *tableView;

/**
 *  初始化一个singleTableView
 *
 *  @param frame 视图位置及大小
 *  @param style tableView的风格
 */
- (instancetype)initWithFrame:(CGRect)frame tableViewStyle:(UITableViewStyle)style;

@end

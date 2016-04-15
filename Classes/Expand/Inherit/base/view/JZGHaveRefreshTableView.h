//
//  PLHaveRefreshTableView.h
//  PLTP_I_CARRIERS
//
//  Created by Lucas on 15/6/4.
//  Copyright (c) 2015年 Stay hungry, stay foolish.. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JZGHaveRefreshViewController.h"
#import "JZGTableView.h"

@protocol PLHaveRefreshTableViewDelegate;

@interface JZGHaveRefreshTableView : JZGTableView
{
    @package
    NSUInteger  _currentPage;
    RequestType _requestType;
    NSString    *_timestamp;
}

@property (nonatomic,assign)RequestType requestType;
@property (nonatomic,assign)NSUInteger  currentPage;
@property (nonatomic,copy)  NSString    *timestamp;

@property (nonatomic,assign)PLHaveRefreshSourceType sourceType;

// 上拉下拉刷代理
@property (nonatomic,assign)id <PLHaveRefreshTableViewDelegate>refreshDelegate;

/**
 *  初始化，sourceType:指定显示的内容
 *
 */
- (id)initWithFrame:(CGRect)frame sourceType:(PLHaveRefreshSourceType)sourceType;

/**
 *  手动开始header刷新
 */
- (void)headerStartRefresh;

/**
 *  手动开始footer刷新
 */
- (void)footerStartRefresh;

/**
 *  停止刷新
 */
- (void)stopRefresh;

/**
 *  footer主动开始刷新执行的方法
 */
- (void)footerBeginRefresh;

/**
 *  header主动开始刷新执行的方法
 */
- (void)headerBeginRefresh;


@end

@protocol PLHaveRefreshTableViewDelegate <NSObject>

@optional
/**
 *  footer开始刷新执行的方法
 */
- (void)refreshTableView:(JZGHaveRefreshTableView *)tableView footerBeginRefreshing:(UIView *)footView;

/**
 *  header开始刷新执行的方法
 */
- (void)refreshTableView:(JZGHaveRefreshTableView *)tableView headBeginRefreshing:(UIView *)headView;

@end
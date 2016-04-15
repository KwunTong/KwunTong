//
//  PLHaveRefreshViewController.h
//  PLTP_M_CARRIERS
//
//  Created by Lucas on 1/20/15.
//  Copyright (c) 2015 Jack. All rights reserved.
//

#import "JZGBaseViewController.h"

typedef NS_ENUM(NSUInteger, PLHaveRefreshSourceType){
    PLHaveRefreshSourceTypeAll,     // 默认显示下拉刷新和上拉加载更多
    PLHaveRefreshSourceTypeHeader,  // 只显示下拉刷新
    PLHaveRefreshSourceTypeFooter,  // 只显示上拉加载更多
    PLHaveRefreshSourceTypeNone     // 都不显示
};

@interface JZGHaveRefreshViewController : JZGBaseViewController{
    @package
    NSUInteger  _currentPage;
    RequestType _requestType;
    NSString    *_timestamp;
}

@property (nonatomic,assign)RequestType requestType;
@property (nonatomic,assign)NSUInteger  currentPage;
@property (nonatomic,copy)  NSString    *timestamp;

@property (nonatomic,assign)PLHaveRefreshSourceType sourceType;

/**
 *  初始化，sourceType:指定显示的内容
 *
 */
- (id)initWithSourceType:(PLHaveRefreshSourceType)sourceType;

/**
 *  子类必须重写此方法，否则会崩溃，返回要添加上拉和下拉刷新的scrollView
 *
 */
- (UIScrollView *)scrollViewContainer;

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
 *  footer开始刷新执行的方法,子类需重写，父类不执行任何操作
 */
- (void)footerBeginRefreshing;

/**
 *  header开始刷新执行的方法,子类需重写，父类不执行任何操作
 */
- (void)headerBeginRefreshing;

@end

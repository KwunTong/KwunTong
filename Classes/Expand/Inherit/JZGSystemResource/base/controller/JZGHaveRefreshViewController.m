//
//  PLHaveRefreshViewController.m
//  PLTP_M_CARRIERS
//
//  Created by Lucas on 1/20/15.
//  Copyright (c) 2015 Jack. All rights reserved.
//

#import "JZGHaveRefreshViewController.h"
#import "MJRefresh.h"

@interface JZGHaveRefreshViewController (){
  
}

@end

@implementation JZGHaveRefreshViewController
@synthesize currentPage = _currentPage;
@synthesize requestType = _requestType;
@synthesize timestamp   = _timestamp;

- (id)init{
    self = [super init];
    if (self) {
        _currentPage = 1;
        _requestType = REQUEST_REFRESH;
        _timestamp = @"";
        _sourceType = PLHaveRefreshSourceTypeAll;
    }
    return self;
}

- (id)initWithSourceType:(PLHaveRefreshSourceType)sourceType{
    self = [self init];
    if (self) {
        _currentPage = 1;
        _requestType = REQUEST_REFRESH;
        _timestamp = @"";
        _sourceType = sourceType;
    }
    
    return self;
}
- (void)setRequestType:(RequestType)requestType{
    _requestType = requestType;
    if (_requestType == REQUEST_REFRESH) {
        _currentPage = 1;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (_sourceType == PLHaveRefreshSourceTypeAll)
    {
        [self addHeader];
        [self addFooter];
    }
    else if (_sourceType == PLHaveRefreshSourceTypeHeader){
        [self addHeader];
    }
    else if (_sourceType == PLHaveRefreshSourceTypeFooter){
        [self addFooter];
    }

}
- (void)didReceiveMemoryWarning {

}

#pragma custom method

- (void)addHeader{

    __weak JZGHaveRefreshViewController *wSelf = self;
    
    // 下拉刷新
    [self scrollViewContainer].mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        wSelf.requestType = REQUEST_REFRESH;
        wSelf.currentPage = 1;
        [wSelf headerStartRefresh];

    }];
}

- (void)addFooter{
    __weak JZGHaveRefreshViewController *wSelf = self;
    
    [self scrollViewContainer].mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        wSelf.requestType = OPERATE_LOADINGMORE;
        wSelf.currentPage++;
        [wSelf footerStartRefresh];
    }];
}

- (void)stopRefresh{
    if (_requestType == REQUEST_REFRESH) {
        [[self scrollViewContainer].mj_header endRefreshing];
    }
    else{
        [[self scrollViewContainer].mj_footer endRefreshing];
    }
}

- (UIScrollView *)scrollViewContainer{
    return nil;
}

- (void)headerStartRefresh{
    [[self scrollViewContainer].mj_header beginRefreshing];
}

- (void)footerStartRefresh{

    [[self scrollViewContainer].mj_footer beginRefreshing];
}

- (void)footerBeginRefreshing{
    
}

- (void)headerBeginRefreshing{

}

@end

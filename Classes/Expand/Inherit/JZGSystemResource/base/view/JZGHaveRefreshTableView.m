//
//  PLHaveRefreshTableView.m
//  PLTP_I_CARRIERS
//
//  Created by Lucas on 15/6/4.
//  Copyright (c) 2015年 Stay hungry, stay foolish.. All rights reserved.
//

#import "JZGHaveRefreshTableView.h"
#import "UIScrollView+MJRefresh.h"
#include "MJRefresh.h"

@implementation JZGHaveRefreshTableView{
    
}

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

- (id)initWithFrame:(CGRect)frame{
    return [self initWithFrame:frame sourceType:PLHaveRefreshSourceTypeAll];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _currentPage = 1;
        _requestType = REQUEST_REFRESH;
        _timestamp = @"";
        _sourceType = PLHaveRefreshSourceTypeAll;
        
        [self addHeader];
        [self addFooter];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame sourceType:(PLHaveRefreshSourceType)sourceType{
    self = [super initWithFrame:frame];
    if (self) {
        _sourceType = sourceType;
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
        
        _currentPage = 1;
        _requestType = REQUEST_REFRESH;
        _timestamp = @"";
    }
    
    return self;
}

#pragma custom method

- (void)addHeader{
    // 下拉刷新
    WS(wSelf);
    
    self.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        wSelf.requestType = REQUEST_REFRESH;
        wSelf.currentPage = 1;
        [wSelf headerStartRefresh];
    }];
 
}

- (void)addFooter{
    WS(wSelf);
    
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        wSelf.requestType = OPERATE_LOADINGMORE;
        wSelf.currentPage++;
        [wSelf footerStartRefresh];
    }];
}

- (void)stopRefresh{
    if (_requestType == REQUEST_REFRESH) {
        [self.mj_header endRefreshing];
    }
    else{
        [self.mj_footer endRefreshing];
    }
}

- (void)headerStartRefresh{
    if ([self.refreshDelegate respondsToSelector:@selector(refreshTableView:headBeginRefreshing:)]) {
        [self.refreshDelegate refreshTableView:self headBeginRefreshing:nil];
    }
}

- (void)footerStartRefresh{
    if ([self.refreshDelegate respondsToSelector:@selector(refreshTableView:footerBeginRefreshing:)]) {
        [self.refreshDelegate refreshTableView:self footerBeginRefreshing:nil];
    }
}

- (void)footerBeginRefresh{
    [self.mj_footer beginRefreshing];
    if ([self.refreshDelegate respondsToSelector:@selector(refreshTableView:footerBeginRefreshing:)]) {
        [self.refreshDelegate refreshTableView:self footerBeginRefreshing:nil];
    }
}

- (void)headerBeginRefresh{
    [self.mj_header beginRefreshing];
    if ([self.refreshDelegate respondsToSelector:@selector(refreshTableView:headBeginRefreshing:)]) {
        [self.refreshDelegate refreshTableView:self headBeginRefreshing:nil];
    }
}


@end

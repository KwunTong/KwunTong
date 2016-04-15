//
//  PLHaveSearchBarView.h
//  PLTP_M_CARRIERS
//
//  Created by jiaoxt on 14/11/28.
//  Copyright (c) 2014年 崔坤. All rights reserved.
//

#import "JZGSingleTableView.h"

@interface JZGHaveSearchBarView : JZGSingleTableView

@property (nonatomic,readonly)UISearchBar *searchBar;
@property (nonatomic,readonly)UISearchDisplayController *searchDisPlay;

- (id)initWithFrame:(CGRect)frame inController:(UIViewController *)controller;
@end

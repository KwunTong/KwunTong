//
//  PLHaveSearchBarView.m
//  PLTP_M_CARRIERS
//
//  Created by jiaoxt on 14/11/28.
//  Copyright (c) 2014年 崔坤. All rights reserved.
//

#import "JZGHaveSearchBarView.h"

@implementation JZGHaveSearchBarView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
        _searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
        _searchBar.placeholder = @"请输入";
        _searchBar.keyboardType = UIKeyboardTypeASCIICapable;
        _searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
        [self addSubview:_searchBar];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
       inController:(UIViewController *)controller{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
        _searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
        _searchBar.keyboardType = UIKeyboardTypeASCIICapable;
        _searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
        [self addSubview:_searchBar];
        
        _searchDisPlay = [[UISearchDisplayController alloc] initWithSearchBar:_searchBar
                                                           contentsController:controller];
        _searchDisPlay.searchBar.keyboardType = UIKeyboardAppearanceDefault;
    }
    
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_searchBar sizeToFit];
    _searchBar.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(_searchBar.bounds));

    self.tableView.frame = CGRectMake(0,
                                      CGRectGetMaxY(_searchBar.frame),
                                      CGRectGetWidth(self.bounds),
                                      CGRectGetHeight(self.bounds) - CGRectGetHeight(_searchBar.frame));
}
@end

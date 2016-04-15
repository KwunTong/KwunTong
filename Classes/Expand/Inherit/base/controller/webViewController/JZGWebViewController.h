//
//  PLWebViewController.h
//  PLTP_M_CARRIERS
//
//  Created by Lucas on 14/12/12.
//  Copyright (c) 2014年 Jack. All rights reserved.
//

#import "JZGBaseViewController.h"

@interface JZGWebViewController : JZGBaseViewController

@property (nonatomic,readonly)UIWebView *webView;
@property (nonatomic,strong)NSURL *url;

@property(nonatomic,strong)UIViewController *vc;

//完成回调方法 如需修改 子类重写该方法
-(void)webViewDidFinished:(UIWebView *)webView;


- (BOOL)handleSkipPage:(UIWebView *)webView request:(NSURLRequest *)request;

@end

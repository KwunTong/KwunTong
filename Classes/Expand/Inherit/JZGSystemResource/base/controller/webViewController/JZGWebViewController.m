//
//  PLWebViewController.m
//  PLTP_M_CARRIERS
//
//  Created by Lucas on 14/12/12.
//  Copyright (c) 2014年 Jack. All rights reserved.
//

#import "JZGWebViewController.h"
#import "MBProgressHUD.h"
#import <MessageUI/MessageUI.h>

@interface JZGWebViewController ()<UIWebViewDelegate,UIScrollViewDelegate>{
    NSString *_phoneNum;
}


@end

@implementation JZGWebViewController

- (void)dealloc{
    
}

- (id)init{
    self = [super init];
    if (self) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, WIDTH, HEIGHT - NAVIGATION_BAR_HEIGHT)];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _webView.delegate = self;
    _webView.scrollView.delegate = self;
    _webView.scalesPageToFit = YES;
    _webView.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    if (_url) {
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:_url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60];
        [request addValue:@"app" forHTTPHeaderField:@"agent"];
        [_webView loadRequest:request];
        [self.view addSubview:_webView];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.webView.frame = self.view.bounds;
    
    if (!_url) {
//        [self.view makeToast:@"链接地址错误" duration:1.0 position:@"center"];
        return;
    }
 
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UIWebView delegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *requestString = [[request URL] absoluteString];
    NSArray *components = [requestString componentsSeparatedByString:@"::"];
    if (components != nil && [components count] > 0) {
        NSString *pocotol = [components objectAtIndex:0];
        if ([pocotol isEqualToString:@"apply"]) {
            NSString *commandStr = [components objectAtIndex:1];
            NSArray *commandArray = [commandStr componentsSeparatedByString:@":"];
            if (commandArray != nil && [commandArray count] > 0) {
                NSString *command = [commandArray objectAtIndex:0];
                if ([command isEqualToString:@"carpark"]) {
                    [self.navigationController popViewControllerAnimated:YES];
                }
            }
            return NO;
        }
    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
//    [QFAppDelegate showHUDWithTitle:@"正在加载..." inView:self.view isPenetration:NO];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self webViewDidFinished:webView];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
//    [QFAppDelegate hide];
    if([error code] == NSURLErrorCancelled)
    {
    }else
    {
//        [self.view makeToast:@"加载失败"];
    }
}

- (void)leftButtonMethod{
    if ([_webView canGoBack]) {
        [_webView goBack];
    }
    else{
        [super leftButtonMethod];
    }
}

-(void)webViewDidFinished:(UIWebView *)webView
{
    NSString *titleStr = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    if(titleStr.length>0)
    {
        [self setRootNavigationTitle:titleStr];
    }
    
//    PLUserDataModel *currentUser = [PLUserDataModel currentLoginUser];
//    NSString *phone = [NSString stringWithFormat:@"report('%@','%@')",currentUser.phone_NUM,currentUser.user_ID];
//    [webView stringByEvaluatingJavaScriptFromString:phone];
//    
//    [QFAppDelegate hide];
}

#pragma mark -- PLLoginViewControllerDelegate
-(void)userLoginSuccess:(NSDictionary*)userInfo
{
    [self.navigationController pushViewController:_vc animated:YES];
}

@end

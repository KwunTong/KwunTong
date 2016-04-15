//
//  NavigationBarViewController.m
//  ToBeBeauty
//
//  Created by Lucas on 14-2-27.
//  Copyright (c) 2014年 huangbangyang. All rights reserved.
//

#import "JZGBaseViewController.h"
#import "JZGCustomNaviView.h"


@interface JZGBaseViewController ()
{
    GYNaviType _naviType;

    NSInteger _introduceImageShowIndex;

}

@property (nonatomic,strong)UIImageView *fuctionImageView;
@end

@implementation JZGBaseViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        _naviType = GYNaviTypeShow;
        _isFirstEnter = YES;
    }
    return self;
}

- (instancetype)initWithNavigationType:(GYNaviType)type{
    
    self = [self init];
    if (self) {
        _naviType = type;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = BACKGROUND_COLOR;
//    [self setNavigationBarImage:[UIImage imageWithColor: NAVI_BACKAGE_COLOR]];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60.0f, 7.0f, WIDTH-120.0f, 30.0f)];
    _titleLabel.font              = PltpBoldFont(18);
    _titleLabel.textColor         = WEAK_BLACK_COLOR;
    _titleLabel.textAlignment     = NSTextAlignmentCenter;
    _titleLabel.backgroundColor   = [UIColor clearColor];
    self.navigationItem.titleView = _titleLabel;
    
    self.leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 2.0f, 40.0f, 40.0f)];
    [_leftButton setImage:LOADIMAGE(@"返回",@"png") forState:UIControlStateNormal];
    [_leftButton setImage:LOADIMAGE(@"返回点击",@"png") forState:UIControlStateHighlighted];
    [_leftButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [_leftButton.titleLabel setFont:PltpBoldFont(14)];
    [_leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_leftButton setTitleColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.4] forState:UIControlStateHighlighted];
    
    self.rightButton = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH-40.0f, 2.0f, 40.0f, 40.0f)];
    [_rightButton.titleLabel setFont:PltpBoldFont(15)];
    [_rightButton setTitleColor:LIGHT_YELLOW_COLOR forState:UIControlStateNormal];
    [_rightButton setTitleColor:WEAK_GRAY_COLOR forState:UIControlStateDisabled];
    [_rightButton setTitleColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.4] forState:UIControlStateHighlighted];
    [_rightButton addTarget:self action:@selector(rightButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    
    [self setRootNavigationTitle:self.title == nil ? [self defaultTitle]:self.title];
    
    if (_naviType == GYNaviTypeHide)
    {
        _customNaviView = [[JZGCustomNaviView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 64)];
        _customNaviView.backgroundColor  = [UIColor clearColor];
        
        [_customNaviView.leftButton setImage:LOADIMAGE(@"返回",@"png")
                                              forState:UIControlStateNormal];
        [_customNaviView.leftButton setImage:LOADIMAGE(@"返回点击",@"png")
                                              forState:UIControlStateHighlighted];
        [_customNaviView.leftButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [_customNaviView.leftButton.titleLabel setFont:PltpBoldFont(14)];
        [_customNaviView.leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_customNaviView.leftButton setTitleColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.4] forState:UIControlStateHighlighted];
        [_customNaviView.leftButton addTarget:self action:@selector(leftButtonMethod) forControlEvents:UIControlEventTouchUpInside];
        [_customNaviView.leftButton setBackgroundColor:[UIColor clearColor]];
        
        
        [_customNaviView.rightButton.titleLabel setFont:PltpBoldFont(15)];
        [_customNaviView.rightButton setTitleColor:LIGHT_YELLOW_COLOR forState:UIControlStateNormal];
        [_rightButton setTitleColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.4] forState:UIControlStateHighlighted];

        [_customNaviView.rightButton addTarget:self action:@selector(rightButtonMethod) forControlEvents:UIControlEventTouchUpInside];
        [_customNaviView.rightButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        [_customNaviView.titleLabel setText:self.title == nil ? [self defaultTitle]:self.title];
       
        [self.view addSubview:_customNaviView];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (_naviType == GYNaviTypeShow) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
    else{
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        [self.view bringSubviewToFront:self.customNaviView];
    }
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (instancetype)weakSelf{
    __weak __typeof__ (self) wself = self;
    return wself;
}

#pragma mark - custom method
-(void)setRootNavigationTitle:(NSString*)title{
    if (_naviType == GYNaviTypeHide) {
        [self.customNaviView.titleLabel setText:title];
        [self.customNaviView setNeedsLayout];
    }
    else{
        self.titleLabel.text = title;
        self.titleLabel.textColor = WEAK_BLACK_COLOR;
    }
}

-(void)setChildNavigationTitle:(NSString*)title{
    self.titleLabel.text = title;
    self.titleLabel.textColor = RGBCOLOR(51, 51, 51);
}

-(void)setNavigationBarImage:(UIImage*)image{
    if (iOS7) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        UIImage *image1 = [image resizableImageWithCapInsets:UIEdgeInsetsMake(2, 1, 2, 1)];
        [self.navigationController.navigationBar setBackgroundImage:image1 forBarMetrics:UIBarMetricsDefault];
    }
}

-(void)leftButtonMethod{
    if (self.isPrensent) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

-(void)rightButtonMethod{
}

- (void)setLeftButton:(UIButton *)leftButton{
    _leftButton = nil;
    _leftButton = leftButton;
    [_leftButton addTarget:self action:@selector(leftButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [_leftButton setNeedsLayout];
    UIBarButtonItem *leftbuttonItem = [[UIBarButtonItem alloc] initWithCustomView:_leftButton];
    [self.navigationItem setLeftBarButtonItem1:leftbuttonItem];
}

- (void)setRightButton:(UIButton *)rightButton{
    _rightButton = nil;
    _rightButton = rightButton;
    [_rightButton addTarget:self action:@selector(rightButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setNeedsLayout];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    [self.navigationItem setRightBarButtonItem1:rightButtonItem];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSString *)defaultTitle{
    return @"";
}

- (void)popToViewControllerWithClassName:(NSString *)className{
    UIViewController *popController = nil;
    
    for (UIViewController *v in self.navigationController.viewControllers) {
        if ([v isKindOfClass:NSClassFromString(className)]) {
            popController = v;
            break;
        }
    }
    
    if (popController) {
        [self.navigationController popToViewController:popController animated:YES];
    }
    else{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - UIScrollView delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

+(BOOL)isCurrentViewControllerVisible:(UIViewController *)viewController
{
    return (viewController.isViewLoaded && viewController.view.window);
}


@end


#pragma mark - end

@implementation UINavigationItem (margin)
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
- (void)setLeftBarButtonItem1:(UIBarButtonItem *)_leftBarButtonItem
{
    UIBarButtonItem *spaceButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceButtonItem.width = -5;
    
    if (_leftBarButtonItem)
    {
        [self setLeftBarButtonItems:@[spaceButtonItem, _leftBarButtonItem]];
    }
    else
    {
        [self setLeftBarButtonItems:@[spaceButtonItem]];
    }
}

- (void)setLeftBarButtonItemsCustom:(NSArray *)leftBarButtonItems
{
    UIBarButtonItem *spaceButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                     target:nil
                                                                                     action:nil];
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>6.1) {
        spaceButtonItem.width = -20;
    }
    else{
        spaceButtonItem.width = -10;
    }
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:leftBarButtonItems];
    
    [mutableArray insertObject:spaceButtonItem atIndex:0];
    
//    if (_leftBarButtonItem)
    {
        [self setLeftBarButtonItems:mutableArray];
    }
//    else
//    {
//        [self setLeftBarButtonItems:@[spaceButtonItem]];
//    }
}

- (void)setLeftLocationItem:(UIBarButtonItem *)_leftBarButtonItem
{
    UIBarButtonItem *spaceButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceButtonItem.width = -10;
    
    if (_leftBarButtonItem)
    {
        [self setLeftBarButtonItems:@[spaceButtonItem, _leftBarButtonItem]];
    }
    else
    {
        [self setLeftBarButtonItems:@[spaceButtonItem]];
    }
}

- (void)setRightWeatherItem:(UIBarButtonItem *)_rightBarButtonItem
{
    UIBarButtonItem *spaceButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceButtonItem.width = -10;
    
    if (_rightBarButtonItem)
    {
        [self setRightBarButtonItems:@[spaceButtonItem, _rightBarButtonItem]];
    }
    else
    {
        [self setRightBarButtonItems:@[spaceButtonItem]];
    }
}

- (void)setRightBarButtonItem1:(UIBarButtonItem *)_rightBarButtonItem
{
    UIBarButtonItem *spaceButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceButtonItem.width = -5;
    
    if (_rightBarButtonItem)
    {
        [self setRightBarButtonItems:@[spaceButtonItem, _rightBarButtonItem]];
    }
    else
    {
        [self setRightBarButtonItems:@[spaceButtonItem]];
    }
}

- (void)setRightBarButtonItem2:(UIBarButtonItem *)_rightBarButtonItem
{
    UIBarButtonItem *spaceButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>6.1) {
        spaceButtonItem.width = -10;
    }
    else{
        spaceButtonItem.width = -8;
    }
    
    if (_rightBarButtonItem)
    {
        [self setRightBarButtonItems:@[spaceButtonItem, _rightBarButtonItem]];
    }
    else
    {
        [self setRightBarButtonItems:@[spaceButtonItem]];
    }
}

#endif


@end

//
//  NavigationBarViewController.h
//  ToBeBeauty
//
//  Created by Lucas on 14-2-27.
//  Copyright (c) 2014年 huangbangyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
#import "JZGCustomNaviView.h"
/**
 *  test/....
 */
typedef  NS_ENUM(NSUInteger, GYNaviType){
    /**
     *  显示自带的NavigationBar
     */
    GYNaviTypeShow,
    /**
     *  隐藏自带的NavigationBar
     */
    GYNaviTypeHide
};
/**
 *  根控制器
 */
@interface JZGBaseViewController : UIViewController{
    
}
/**
 *  标题label
 */
@property(nonatomic,strong) UILabel            *titleLabel;
/**
 *  左按钮
 */
@property(nonatomic,strong) UIButton           *leftButton;
/**
 *  右按钮
 */
@property(nonatomic,retain) UIButton           *rightButton;

@property(nonatomic,assign)BOOL isFirstEnter;
/**
 *  naviType == GYNaviTypeHide 时有效
 */
@property (nonatomic,strong)JZGCustomNaviView   *customNaviView;
/**
 *  PLBaseViewController对象
 */
@property(nonatomic,readonly,weak)UIViewController *weakSelf;

/**
 *  controlle是否是 经过 presentViewController:animated:completion: 推出来，默认为NO
 */
@property (nonatomic,assign)BOOL isPrensent;
/**
 *  设置首级导航栏标题
 *
 *  @param title 标题
 */
-(void)setRootNavigationTitle:(NSString*)title;
/**
 *  设置导航栏背景颜色
 *
 *  @param image 图片
 */
-(void)setNavigationBarImage:(UIImage*)image;
/**
 *  左按钮方法
 */
-(void)leftButtonMethod;
/**
 *  右按钮方法
 */
-(void)rightButtonMethod;
/**
 *  设置标题
 *
 *  @return 标题
 */
- (NSString *)defaultTitle;

- (instancetype)initWithNavigationType:(GYNaviType)type;

/**
 *  判断当前显示的是否是本控制器
 *
 *  @param viewController 控制器类
 *
 *  @return YES NO
 */
+(BOOL)isCurrentViewControllerVisible:(UIViewController *)viewController;

#pragma mark - 功能引导页

/**
 *  返回页面所需功能介绍页的视图，子类若需要展示引导页需重写此方法
 *
 */
- (NSArray *)functionIntroductionImageNames;

/**
 *  返回页面所需功能介绍所需的音频路径，子类若需要音乐介绍需重写此方法
 *
 */
- (NSArray *)functionIntroductionAudioPaths;

/**
 *  导航页显示完毕后执行的方法
 */
- (void)functionIntroductionFinished;


- (void)popToViewControllerWithClassName:(NSString *)className;
@end


@interface UINavigationItem (margin)

- (void)setLeftBarButtonItem1:(UIBarButtonItem *)_leftBarButtonItem;
- (void)setLeftLocationItem:(UIBarButtonItem *)_leftBarButtonItem;
- (void)setRightWeatherItem:(UIBarButtonItem *)_rightBarButtonItem;
- (void)setRightBarButtonItem1:(UIBarButtonItem *)_rightBarButtonItem;
- (void)setRightBarButtonItem2:(UIBarButtonItem *)_rightBarButtonItem;
- (void)setLeftBarButtonItemsCustom:(NSArray *)leftBarButtonItems;

@end


@protocol CWFunctionIntroductionDelegate <NSObject>



@end
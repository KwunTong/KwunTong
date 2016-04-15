//
//  JZGNavigationController.m
//  JZGDetectionPlatform
//
//  Created by Wen Dongxiao on 15/12/21.
//  Copyright © 2015年 Mars. All rights reserved.
//

#import "JZGNavigationController.h"
#import "JZGBasedClassFactory.h"
@interface JZGNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation JZGNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        // 设置导航栏字体颜色和阴影效果
        UINavigationBar *navbar = [UINavigationBar appearance];
        NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName,[UIFont systemFontOfSize:18.0f], NSFontAttributeName, nil];
        [navbar setTitleTextAttributes:textAttributes];  ////TODO缺少导航的图
        [navbar setTintColor:[UIColor blackColor]];
    }
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0 )
    {
        // 判断当前导航控制器的栈中是否有数据
        if (!self.childViewControllers.count) return;
        // 隐藏选项卡
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [JZGBasedClassFactory createCustomBarItem:CGRectMake(LEFT_BUTTON_X,LEFT_BUTTON_Y, LEFT_BUTTON_WIDTH, LEFT_BUTTON_HEIGHT) image:[UIImage imageNamed:@"navigation_back_button.png"] title:nil font:[UIFont systemFontOfSize:15.0f] target:self action:@selector(pressBackButton:)];
    }
    [super pushViewController:viewController animated:animated];
}

// 关联导航栏返回按钮事件
-(void)pressBackButton:(UIBarButtonItem *)button
{
    self.navigationController.navigationBarHidden = YES;
    [self popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

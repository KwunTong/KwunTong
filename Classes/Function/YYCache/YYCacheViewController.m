//
//  YYCacheViewController.m
//  KwunTong
//
//  Created by Mars on 16/3/8.
//  Copyright © 2016年 Levin. All rights reserved.
//

#import "YYCacheViewController.h"

@interface YYCacheViewController ()

@end

@implementation YYCacheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"YYCacheViewController";
}

- (void)initializeOptionView
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 100, 80, 40);
    [button setTitle:@"存图片" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(loadImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *buttonData = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonData.frame = CGRectMake(100, 160, 80, 40);
    [buttonData setTitle:@"存数据" forState:UIControlStateNormal];
    [buttonData addTarget:self action:@selector(saveModelData:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonData];
    
    UIButton *unArchiverBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    unArchiverBtn.frame = CGRectMake(100, 220, 80, 40);
    [unArchiverBtn setTitle:@"取数据" forState:UIControlStateNormal];
    [unArchiverBtn addTarget:self action:@selector(unArchiver:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:unArchiverBtn];
}

- (void)loadImage:(UIButton *)button
{
    UIImage *img = [UIImage imageNamed:@""];
    UIImage *image = [UIImage imageWithContentsOfFile:@""];
}

- (void)saveModelData:(UIButton *)button
{
    
}

- (void)unArchiver:(UIButton *)button
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

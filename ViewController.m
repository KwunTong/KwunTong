//
//  ViewController.m
//  KwunTong
//
//  Created by Mars on 16/3/2.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "ViewController.h"
#import "CacheViewController.h"
#import "ZipArchiveViewController.h"
#import "YYCacheViewController.h"
#import "XYMoviewPlayerViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>;

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataSource;

@end

@implementation ViewController

#pragma mark -- lift cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"首页";
    [self.view addSubview:self.tableView];
}

//相应事件
//#pargma mark - event response
//私有方法
//#pargma mark - private methods

#pragma mark -- UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier= @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [self.dataSource objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            CacheViewController *cache = [[CacheViewController alloc] init];
            [self.navigationController pushViewController:cache animated:YES];
        }
            break;
        case 1:
        {
            ZipArchiveViewController *zipArchive = [[ZipArchiveViewController alloc] init];
            [self.navigationController pushViewController:zipArchive animated:YES];
        }
            break;
        case 2:
        {
            YYCacheViewController *yyCache = [[YYCacheViewController alloc] init];
            [self.navigationController pushViewController:yyCache animated:YES];
        }
            break;
        case 3:
        {
            XYMoviewPlayerViewController *mo = [[XYMoviewPlayerViewController alloc] init];
            NSLog(@"--- %@",mo.filePath);
            [self.navigationController pushViewController:mo animated:YES];
        }
            break;
            
        default:
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource count];
}


#pragma mark -- setters and getters
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    
    return _tableView;
}

- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        _dataSource = [@[@"DataCache",@"ZipArchive",@"DataCache",@"Video"] mutableCopy];
        
    }
    
    return _dataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

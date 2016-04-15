//
//  CacheViewController.m
//  KwunTong
//
//  Created by Mars on 16/3/2.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "CacheViewController.h"
#import "BaseModel.h"

@interface CacheViewController ()


@end

@implementation CacheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"YYCache";

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

- (void)saveModelData:(UIButton *)button
{
    [self archiver];
}

- (void)archiver
{
    
    NSMutableArray *ar = [self initializeData];

    NSString *createPath = [kDocumentsPath stringByAppendingPathComponent:@"/Image/data"];
    NSLog(@"%@",createPath);
    /****************************    第一种    ****************************/

    [NSKeyedArchiver archiveRootObject:ar toFile:createPath];
    
    /****************************    第二种    ****************************/
//    NSMutableData *data = [[NSMutableData alloc] init];
//    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
//    [archiver encodeObject:ar forKey:@"kkkkk"];
//    [archiver finishEncoding];
//    [NSKeyedArchiver archiveRootObject:ar toFile:createPath];
}

- (void)unArchiver:(UIButton *)btn
{
    //获取文件路径
    NSString *createPath = [kDocumentsPath stringByAppendingPathComponent:@"/Image/data"];
    
    NSMutableArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:createPath];
    
    for (BaseModel *model in array) {
        NSLog(@"%@---%@---%@---%@ -- \r 文件已提取完毕",model.vin,model.person,model.phone,model.price);
    }
}

- (NSMutableArray *)initializeData
{
    BaseModel *model = [[BaseModel alloc] init];
    model.vin = @"JFDAJFLAJ";
    model.person = @"JACK";
    model.phone = @"12432414";
    model.price = @"34.31";
    
    BaseModel *model1 = [[BaseModel alloc] init];
    model1.vin = @"JFDAJ";
    model1.person = @"JACK111";
    model1.phone = @"12432414111";
    model1.price = @"34.31111";
    
    BaseModel *model2 = [[BaseModel alloc] init];
    model2.vin = @"JFDAJFLAJ222";
    model2.person = @"JACK222";
    model2.phone = @"12432414222";
    model2.price = @"34.312222";
    
    BaseModel *model3 = [[BaseModel alloc] init];
    model3.vin = @"JFDAJFLAJ333";
    model3.person = @"JACK3333";
    model3.phone = @"1243241433333";
    model3.price = @"34.313333";
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:model,model1,model2,model3, nil];
    
    return array;
}

- (void)ddddddddddd
{
    NSFileManager *fileManager = [[NSFileManager alloc] init];
//    NSString *pathDocuments = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString *createPath = [NSString stringWithFormat:@"%@/Image", kDocumentsPath];
    NSString *createDir = [NSString stringWithFormat:@"%@/MessageQueueImage", kDocumentsPath];
    
    // 判断文件夹是否存在，如果不存在，则创建
    if (![[NSFileManager defaultManager] fileExistsAtPath:createPath]) {
        [fileManager createDirectoryAtPath:createPath withIntermediateDirectories:YES attributes:nil error:nil];
        [fileManager createDirectoryAtPath:createDir withIntermediateDirectories:YES attributes:nil error:nil];
    } else {
        NSLog(@"FileDir is exists.");
    }
}

- (void)loadImage:(UIButton *)button
{
    
    [self ddddddddddd];
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    
    NSString *filePath = [kDocumentsPath stringByAppendingPathComponent:@"Image/123456.jpg"];
    
    BOOL loadI = [UIImagePNGRepresentation(image)writeToFile: filePath atomically:YES];
    
    NSLog(@"%zd",loadI);
    
    
    
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

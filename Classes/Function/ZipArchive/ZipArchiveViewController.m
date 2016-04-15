//
//  ZipArchiveViewController.m
//  KwunTong
//
//  Created by Mars on 16/3/4.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "ZipArchiveViewController.h"
#import "SSZipArchive.h"
#import "AFNetworking.h"



#define PATH_OF_DOCUMENT         [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

@interface ZipArchiveViewController ()

@property (strong, nonatomic)  UILabel *statusLabel;

@end

@implementation ZipArchiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"ZipArchive";
    [self initializeView];
}

- (void)initializeView
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 100, 80, 40);
    [button setTitle:@"压缩" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(zipClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *save = [UIButton buttonWithType:UIButtonTypeSystem];
    save.frame = CGRectMake(200, 100, 80, 40);
    [save setTitle:@"保存" forState:UIControlStateNormal];
    [save addTarget:self action:@selector(save:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:save];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(100, 200, 120, 40);
    [button1 setTitle:@"解压缩" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(unzipFile:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake(100, 300, 120, 40);
    [button2 setTitle:@"删除解压文件" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(deleteZipedFile:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeSystem];
    button3.frame = CGRectMake(100, 400, 120, 40);
    [button3 setTitle:@"删除压缩文件" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(deleteZipFile:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];

}

- (void)save:(UIButton *)button
{
    
    NSString *docsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSAllDomainsMask, YES) firstObject];
    //    NSString *docsPath = PATH_OF_DOCUMENT;
    NSString *zipPath = [docsPath stringByAppendingPathComponent:@"/images.zip"];
    NSURL *filePath = [NSURL fileURLWithPath:zipPath];
    
    NSLog(@"filePath --- %@",filePath);
    [self uploadWithUrl:filePath];
}

- (void)uploadWithUrl:(NSURL *)filePath
{
    
    NSDictionary *dic = @{@"op":@"UploadImage"};
    NSLog(@"filePath ----- %@",filePath);
    //    NSDictionary *par = [JZGEncyptClass parameterSortWithDictionary:dic];
    
    NSString *url =@"http://10.58.0.64:8011/APP/UploadZIP.ashx";
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:url parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileURL:filePath name:@"file" fileName:@"images.zip" mimeType:@"application/zip" error:nil];
        
    } error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionUploadTask *uploadTask;
    uploadTask = [manager
                  uploadTaskWithStreamedRequest:request
                  progress:^(NSProgress * _Nonnull uploadProgress) {
                      // This is not called back on the main queue.
                      // You are responsible for dispatching to the main queue for UI updates
                      dispatch_async(dispatch_get_main_queue(), ^{
                          //Update the progress view
                          //                          [progressView setProgress:uploadProgress.fractionCompleted];
                      });
                  }
                  completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                      if (error) {
                          NSLog(@"Error: %zd", error.code);
                      } else {
                          NSLog(@"responseObject --- %@", responseObject);
                      }
                  }];
    
    [uploadTask resume];
}

//压缩文件
- (void)zipClicked:(id)sender {
    
    //    NSArray *inputPaths = [NSArray arrayWithObjects:@"/Users/Mars/Desktop/appImage/AppIcon.jpg",@"/Users/Mars/Desktop/appImage/home.jpg",@"/Users/Mars/Desktop/appImage/home2.jpg", nil];
//    NSArray *inputPaths = [NSArray arrayWithObjects:
//                           [[NSBundle mainBundle] pathForResource:@"1" ofType:@"jpg"],
//                           [[NSBundle mainBundle] pathForResource:@"2" ofType:@"jpg"],
//                           [[NSBundle mainBundle] pathForResource:@"3" ofType:@"jpg"],
//                           [[NSBundle mainBundle] pathForResource:@"4" ofType:@"jpg"],
//                           [[NSBundle mainBundle] pathForResource:@"5" ofType:@"jpg"],
//                           [[NSBundle mainBundle] pathForResource:@"6" ofType:@"jpg"],
//                           [[NSBundle mainBundle] pathForResource:@"7" ofType:@"jpg"],
//                           [[NSBundle mainBundle] pathForResource:@"8" ofType:@"jpg"],
//                           [[NSBundle mainBundle] pathForResource:@"9" ofType:@"jpg"],
//                           [[NSBundle mainBundle] pathForResource:@"10" ofType:@"jpg"],
//                           [[NSBundle mainBundle] pathForResource:@"11" ofType:@"jpg"],
//                           [[NSBundle mainBundle] pathForResource:@"12" ofType:@"jpg"],
//                           [[NSBundle mainBundle] pathForResource:@"13" ofType:@"jpg"],
//                           [[NSBundle mainBundle] pathForResource:@"14" ofType:@"jpg"],
//                           [[NSBundle mainBundle] pathForResource:@"15" ofType:@"jpg"],
//                           [[NSBundle mainBundle] pathForResource:@"16" ofType:@"jpg"],
//                           [[NSBundle mainBundle] pathForResource:@"17" ofType:@"jpg"],
//                           [[NSBundle mainBundle] pathForResource:@"18" ofType:@"jpg"],
//                           [[NSBundle mainBundle] pathForResource:@"12345" ofType:@"mp4"],
//                           nil];
    
    NSArray *inputPaths = [NSArray arrayWithObjects:@"/Users/Mars/Library/Developer/CoreSimulator/Devices/A3126D35-1CE7-45FF-BDA3-3033CB62BC64/data/Containers/Data/Application/3B456256-9A32-4B0F-8C4E-8816EB3CA2B4/Documents/images/", nil];
    
    
    [self zipFile:inputPaths];
}

- (void)zipFile:(NSArray *)inputPaths
{
    NSArray *arr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSAllDomainsMask, YES);
    NSString *path = [arr objectAtIndex:0];
    //    NSString *path = PATH_OF_DOCUMENT;
    NSString *pStr = [path stringByAppendingString:@"/images.zip"];
    
    // 压缩
    NSString *zippedPath = pStr;
    
    
    BOOL success = [SSZipArchive createZipFileAtPath:zippedPath withFilesAtPaths:inputPaths];
    if (success) {
        NSLog(@"%@---",zippedPath);
    }
}

//解压文件
- (void)unzipFile:(id)sender {
    NSString *docsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSAllDomainsMask, YES) firstObject];
    //    NSString *docsPath = PATH_OF_DOCUMENT;
    NSString *zipPath = [docsPath stringByAppendingPathComponent:@"/images.zip"];
    [SSZipArchive unzipFileAtPath:zipPath toDestination: zipPath];
    
    // 解压
    NSString *destinationPath = [docsPath stringByAppendingPathComponent:@"/images/img"];
    [SSZipArchive unzipFileAtPath:zipPath toDestination:destinationPath];
    
}

//删除压缩文件
- (void)deleteZipFile:(id)sender {
    NSString *docsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSAllDomainsMask, YES) firstObject];
    //    NSString *docsPath = PATH_OF_DOCUMENT;
    NSString *zipPath = [docsPath stringByAppendingPathComponent:@"/image.zip"];
    //创建文件管理器
    NSFileManager *fm = [NSFileManager defaultManager];
    //判断指定路径文件是否存在
    BOOL exist = [fm fileExistsAtPath:zipPath];
    if (exist) {
        NSError *error = nil;
        [fm removeItemAtPath:zipPath error:&error];
        if (!error) {
            _statusLabel.text = @"删除压缩文件成功";
        }else{
            _statusLabel.text = @"删除压缩文件失败";
        }
    }else{
        _statusLabel.text = @"文件不存在";
    }
}

//删除解压文件
- (void)deleteZipedFile:(id)sender {
    NSString *docsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSAllDomainsMask, YES) firstObject];
    //    NSString *docsPath = PATH_OF_DOCUMENT;
    NSString *zippedFilePath = [docsPath stringByAppendingPathComponent:@"images"];
    
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL exist = [fm fileExistsAtPath:zippedFilePath];
    if (exist) {
        NSError *error = nil;
        [fm removeItemAtPath:zippedFilePath error:&error];
        if (!error) {
            _statusLabel.text = @"删除解压文件成功";
//            _imgView.image = nil;
        }else{
            _statusLabel.text = @"删除解压文件失败";
        }
    }else{
        _statusLabel.text = @"文件不存在";
    }
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

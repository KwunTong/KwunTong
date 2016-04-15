//
//  PLDefines.h
//  PLTP_I_Integration
//
//  Created by jiaoxt on 15/2/5.
//  Copyright (c) 2015年 中交兴路车联网. All rights reserved.
//

//
#import "JZGContentsDefine.h"
#import "JZGNotificationNames.h"
#import "JZGKeysDefine.h"
#import "JZGColorsFontDefine.h"
#import "JZGRegularsDefine.h"
#import "JZGDeviceDefines.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "JZGHudManager.h"

typedef NS_ENUM(NSInteger, RequestType){
    REQUEST_REFRESH = 1,//下拉刷新请求数据
    OPERATE_LOADINGMORE = 2//上拉加载更多请求数据
};

//delegate对象
#define GZLAppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])
//弱引用对象
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

//普通页每次请求的数据个数
#define PageSize 20

// 左右边界值
#define BORDER_HORIZONTAL 10

/**
 *  顶部导航栏和底部导航栏的高度
 *
 */
#define NAVIGATION_BAR_HEIGHT         64.0f
#define TARBAR_HEIGHT                 49.0f


//设备的宽度和高度
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height


#define XcodeAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define PhoneVersion    [[UIDevice currentDevice] systemVersion]
#define PhoneType       [[UIDevice currentDevice] model]

#define ISRETINA [[UIScreen mainScreen] scale] == 2.f

#define CUTTING_LINE_HEIGHT (ISRETINA ? 0.5 : 0.34)

//图片的宏定义
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@%@",file,IS_IPHONE_6P ? @"@3x" : @"@2x"] ofType:ext]]

#define IMAGE_PATH(file) [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@%@",file,iPhone6Plus ? @"@3x" : @"@2x"] ofType:@"png"]

#pragma mark -

#if (!defined(DEBUG) && !defined (SD_VERBOSE)) || defined(SD_LOG_NONE)
#define NSLog(...)
#endif


#define IMAGE_UPLOAD_TYPE       @"jpeg"


// 当在debug模式时打印详细日志，在release模式时不打印详细日志
#ifdef DEBUG
# define DLog(format, ...) NSLog((@"[文件名:%s]" "[函数名:%s]" "[行号:%d]" format), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define DLog(...);
#endif


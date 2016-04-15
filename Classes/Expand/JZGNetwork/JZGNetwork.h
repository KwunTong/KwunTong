//
//  JZGNetwork.h
//  AFN3.0封装
//
//  Created by Mars on 15/12/20.
//  Copyright © 2015年 Mars. All rights reserved.
//

#ifndef JZGNetwork_h
#define JZGNetwork_h

#import "JZGNetworkDefine.h"
#import "JZGNetworkManager.h"
#import "JZGNetworkHandler.h"
#import "JZGNetWorkRequest.h"
#import "MBProgressHUD.h"
#import "JZGNetworkError.h"

#import "AFNetworking.h"

#define JZGALERT_SHOW(_msg_)  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:_msg_ delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];\
[alert show];

#define WINDOW ([UIApplication sharedApplication].keyWindow)


#endif /* JZGNetwork_h */

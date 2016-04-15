//
//  JZGViewController.h
//  JZGDetectionPlatform
//
//  Created by 杜维欣 on 15/12/18.
//  Copyright © 2015年 Mars. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    LienceArea = 100,
    CarInfo ,
    LienceTime ,
    Mileage ,
    BuyPrice,
    BuyTime,
    SellPrice,
    SellTime,
    CarSource,
    DefaultMode,
} HandleType;
typedef enum {
    JZGRefreshDefault = 0, //默认加载
    JZGRefreshNew, //刷新  下拉
    JZGRefreshMore, //加载更多 上拉
    
} RefreshDataType;
@interface JZGViewController : UIViewController

@end

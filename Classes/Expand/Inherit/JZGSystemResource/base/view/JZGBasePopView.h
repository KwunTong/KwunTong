//
//  PLBasePopView.h
//  PLTP_M_CARRIERS
//
//  Created by Lucas on 14/12/11.
//  Copyright (c) 2014年 Lucas. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  弹出根视图
 */
@interface JZGBasePopView : UIView

/**
 *  弹出视图高度
 */
@property(nonatomic,assign) float                   popViewHeight;
/**
 *  弹出视图
 */
@property(nonatomic,retain) UIView                  *popView;

/**
 *  显示弹出视图
 *
 *  @param hei 高度
 */
-(void)showBasePopView:(float)hei;

@end

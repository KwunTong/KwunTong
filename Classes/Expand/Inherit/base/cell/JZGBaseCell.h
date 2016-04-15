//
//  PLBaseCell.h
//  PLTP_M_CARRIERS
//
//  Created by Lucas on 14-8-22.
//  Copyright (c) 2014年 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZGBaseCell : UITableViewCell

@property (nonatomic,retain)NSIndexPath *indexPath;

+ (CGFloat)cellHeight;
+ (CGFloat)cellHeightWithContent:(NSString *)content;

@end

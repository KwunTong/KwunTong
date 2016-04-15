//
//  PLBaseCell.m
//  PLTP_M_CARRIERS
//
//  Created by Lucas on 14-8-22.
//  Copyright (c) 2014年 Jack. All rights reserved.
//

#import "JZGBaseCell.h"

@implementation JZGBaseCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

+ (CGFloat)cellHeight{
    return 44.0;
}

+(CGFloat)cellHeightWithContent:(NSString *)content{
    return 44.0;
}

@end

//
//  PLCustomSearchBar.m
//  CWZA
//
//  Created by alex on 10/19/15.
//  Copyright © 2015 sequence. All rights reserved.
//

#import "JZGCustomSearchBar.h"

@implementation JZGCustomSearchBar

- (void)layoutSubviews {
    UITextField *searchField;
    NSUInteger numViews = [self.subviews count];
    for(int i = 0; i < numViews; i++) {
        if([[self.subviews objectAtIndex:i] isKindOfClass:[UITextField class]]) {
            searchField = [self.subviews objectAtIndex:i];
        }
    }
    if(!(searchField == nil)) {
        searchField.textColor = RGBCOLOR(0xc3, 0xc8, 0xd2); ;
        searchField.font = PltpFont(15.0f);
    }
    
    [super layoutSubviews];
}

@end

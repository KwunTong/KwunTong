//
//  XYMoviewPlayerViewController.h
//  音视频测试
//
//  Created by Vilimir on 15-9-8.
//  Copyright (c) 2015年 APP研发部. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@interface XYMoviewPlayerViewController : UIViewController
{
    MPMoviePlayerViewController *_playerViewController;
}

@property (strong, nonatomic) NSURL *filePath;
@end

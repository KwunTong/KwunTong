//
//  XYMoviewPlayerViewController.m
//  音视频测试
//
//  Created by Vilimir on 15-9-8.
//  Copyright (c) 2015年 APP研发部. All rights reserved.
//

#import "XYMoviewPlayerViewController.h"
@implementation XYMoviewPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self iniazalizePlayer];
}

- (void)iniazalizePlayer
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 100, 120, 40);
    [button setTitle:@"播放" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(playClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)dealloc{
    //移除所有通知监控
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)playClick:(UIButton *)sender {
    _playerViewController=nil;//保证每次点击都重新创建视频播放控制器视图，避免再次点击时由于不播放的问题
//        NSURL * url = [NSURL URLWithString:@"http://59.63.171.78/youku/6972D2084DB3C8101503783793/030008010054C35216A4EC0058ABF27B7FB15A-D015-2F2A-44F9-E993FB845FA3.mp4"];
    
//    NSURL * url = [NSURL URLWithString:@"http://video.kexinapp.com/data/raindropMh/373/604024/1452567435722.m3u8"];
//    NSURL * url = [NSURL URLWithString:@"http://video.kexinapp.com/data/raindropMh/1/616515/1452764047254.m3u8"];
//    NSURL *url = [NSURL URLWithString:@"http://192.168.0.140:8080/Data/Video/2016\03\10\\video0be9edba-a8ee-4b8b-b069-b6580c27c7fe.mp4"];
    
    
//    NSURL * url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"闪电侠.The.Flash.S01E18.中英字幕.HDTVrip.1024X576" ofType:@"mp4"]];
    NSURL *url = self.filePath;
    
    
    if ([[UIDevice currentDevice].systemVersion floatValue]>=9.0) {
        AVPlayerViewController * vc = [[AVPlayerViewController alloc] init];
        [vc setPlayer:[[AVPlayer alloc] initWithURL:url]];
        vc.allowsPictureInPicturePlayback = NO;
        [self presentViewController:vc animated:YES completion:^{
            [[vc player] play];
        }];
//        [self presentMoviePlayerViewControllerAnimated:vc];
    }else {
        _playerViewController = [[MPMoviePlayerViewController alloc]initWithContentURL:url];
        NSNotificationCenter *notificationCenter=[NSNotificationCenter defaultCenter];
        [notificationCenter addObserver:self selector:@selector(mediaPlayerPlaybackFinished:) name:MPMoviePlayerPlaybackDidFinishNotification object:_playerViewController.moviePlayer];
        [notificationCenter addObserver:self selector:@selector(mediaPlayerPlaybackStateChange:) name:MPMoviePlayerPlaybackStateDidChangeNotification object:_playerViewController.moviePlayer];
        //    [self presentViewController:_playerViewController animated:YES completion:nil];
        //注意，在MPMoviePlayerViewController.h中对UIViewController扩展两个用于模态展示和关闭MPMoviePlayerViewController的方法，增加了一种下拉展示动画效果
        [self presentMoviePlayerViewControllerAnimated:_playerViewController];
    }
}

/**
 *  播放状态改变，注意播放完成时的状态是暂停
 *
 *  @param notification 通知对象
 */
-(void)mediaPlayerPlaybackStateChange:(NSNotification *)notification{
    switch (_playerViewController.moviePlayer.playbackState) {
        case MPMoviePlaybackStatePlaying:
            NSLog(@"正在播放...");
            break;
        case MPMoviePlaybackStatePaused:
            NSLog(@"暂停播放.");
            break;
        case MPMoviePlaybackStateStopped:
            NSLog(@"停止播放.");
            break;
        default:
            NSLog(@"播放状态:%li",_playerViewController.moviePlayer.playbackState);
            break;
    }
}

/**
 *  播放完成
 *
 *  @param notification 通知对象
 */
-(void)mediaPlayerPlaybackFinished:(NSNotification *)notification{
    NSLog(@"播放完成.%li",_playerViewController.moviePlayer.playbackState);
}
@end

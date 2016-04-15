//
//  DetectionOfNetworkState.m
//  KwunTong
//
//  Created by Levin on 16/3/4.
//  Copyright © 2016年 Levin. All rights reserved.
//

#import "DetectionOfNetworkState.h"
#import "RealReachability.h"

static DetectionOfNetworkState *_instance;

@implementation DetectionOfNetworkState

+ (instancetype)shareDetectionOfNetworkState {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[DetectionOfNetworkState alloc]init];
    });
    return _instance;
}

+ (NetworkState)listeningNetworkState
{
    return [[self shareDetectionOfNetworkState] noto];
}

- (NetworkState)noto
{
    [GLobalRealReachability startNotifier];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(networkChanged:)
                                                 name:kRealReachabilityChangedNotification
                                               object:nil];
    
    return self.networkState;
}

+ (NetworkState)shareNetworkState
{
    return [[self shareDetectionOfNetworkState] detectionOfNetworkState];
}

- (NetworkState)detectionOfNetworkState
{
    
    __weak typeof(self) weakSelf = self;
    [GLobalRealReachability reachabilityWithBlock:^(ReachabilityStatus status) {
        switch (status)
        {
            case RealStatusNotReachable:
            {
                weakSelf.networkState = NetworkNotReachable;
                break;
            }
                
            case RealStatusViaWiFi:
            {
                weakSelf.networkState =  NetworkViaWiFi;
                break;
            }
                
            case RealStatusViaWWAN:
            {
                self.networkState = NetworkViaWWAN;
                
                WWANAccessType accessType = [GLobalRealReachability currentWWANtype];
                if (accessType == WWANType2G)
                {
                    self.networkState = NetworkViaWWANType2G;
                }
                else if (accessType == WWANType3G)
                {
                    self.networkState = NetworkViaWWANType3G;
                }
                else if (accessType == WWANType4G)
                {
                    self.networkState = NetworkViaWWANType4G;
                }
                else
                {
                    self.networkState = NetworkNotViaWWANReachable;
                }
                
                break;
            }
                
            default:
                break;
        }
    }];
    
    return self.networkState;
    
}

- (void)networkChanged:(NSNotification *)notification
{
    RealReachability *reachability = (RealReachability *)notification.object;
    ReachabilityStatus status = [reachability currentReachabilityStatus];
    
    if (status == RealStatusNotReachable)
    {
        self.networkState = NetworkNotReachable;
    }
    
    if (status == RealStatusViaWiFi)
    {
        self.networkState = NetworkViaWiFi;
    }
    
    if (status == RealStatusViaWWAN)
    {
        self.networkState = NetworkViaWWAN;
    }
    
    WWANAccessType accessType = [GLobalRealReachability currentWWANtype];
    
    if (status == RealStatusViaWWAN)
    {
        if (accessType == WWANType2G)
        {
            self.networkState = NetworkViaWWANType2G;
        }
        else if (accessType == WWANType3G)
        {
            self.networkState = NetworkViaWWANType3G;
        }
        else if (accessType == WWANType4G)
        {
            self.networkState = NetworkViaWWANType4G;
        }
        else
        {
            self.networkState = NetworkNotViaWWANReachable;
        }
    }
}

+ (void)releaseNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}



@end

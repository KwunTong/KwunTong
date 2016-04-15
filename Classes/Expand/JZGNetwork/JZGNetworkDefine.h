//
//  JZGNetworkDefine.h
//  AFN3.0封装
//
//  Created by Mars on 15/12/20.
//  Copyright © 2015年 Mars. All rights reserved.
//

#ifndef JZGNetworkDefine_h
#define JZGNetworkDefine_h

/**
 *  请求类型
 */
typedef NS_ENUM(NSInteger, JZGNetworkRequestType) {
    JZGNetworkRequestGet = 0,
    JZGNetworkRequestPost = 1,
};

/**
 *  错误类型
 */
typedef NS_ENUM(NSInteger, JZGNetworkErrorType){
    JZGNetworkErrorDefault   = 0,
    JZGNetworkErrorNoServer  = -1003,
    JZGNetworkErrorTimeOut   = -1001,
    JZGNetworkErrorNoNetwork = -1009
};

/**
 *  请求成功时的回调
 *
 *  @param responseObject 回调的对象
 *  @param code           回调的code
 *  @param msg            回调的信息
 */
typedef void (^JZGNetworkRequestSuccessBlock)(id returnData,NSInteger code,NSString *msg);

/**
 *  请求错误的回调
 *
 *  @param error 错误回调的对象
 */
typedef void (^JZGNetworkRequestFailureBlock)(NSError *error);


//typedef NS_ENUM(NSInteger, JZGNSURLError)
//{
//    NSURLErrorUnknown = -1,
//    NSURLErrorCancelled = -999,
//    NSURLErrorBadURL = -1000,
//    NSURLErrorTimedOut = -1001,
//    NSURLErrorUnsupportedURL = -1002,
//    NSURLErrorCannotFindHost = -1003,
//    NSURLErrorCannotConnectToHost = -1004,
//    NSURLErrorDataLengthExceedsMaximum = -1103,
//    NSURLErrorNetworkConnectionLost = -1005,
//    NSURLErrorDNSLookupFailed = -1006,
//    NSURLErrorHTTPTooManyRedirects = -1007,
//    NSURLErrorResourceUnavailable = -1008,
//    NSURLErrorNotConnectedToInternet = -1009,
//    NSURLErrorRedirectToNonExistentLocation = -1010,
//    NSURLErrorBadServerResponse = -1011,
//    NSURLErrorUserCancelledAuthentication = -1012,
//    NSURLErrorUserAuthenticationRequired = -1013,
//    NSURLErrorZeroByteResource = -1014,
//    NSURLErrorCannotDecodeRawData = -1015,
//    NSURLErrorCannotDecodeContentData = -1016,
//    NSURLErrorCannotParseResponse = -1017,
//    NSURLErrorInternationalRoamingOff = -1018,
//    NSURLErrorCallIsActive = -1019,
//    NSURLErrorDataNotAllowed = -1020,
//    NSURLErrorRequestBodyStreamExhausted = -1021,
//    NSURLErrorFileDoesNotExist = -1100,
//    NSURLErrorFileIsDirectory = -1101,
//    NSURLErrorNoPermissionsToReadFile = -1102,
//    NSURLErrorSecureConnectionFailed = -1200,
//    NSURLErrorServerCertificateHasBadDate = -1201,
//    NSURLErrorServerCertificateUntrusted = -1202,
//    NSURLErrorServerCertificateHasUnknownRoot = -1203,
//    NSURLErrorServerCertificateNotYetValid = -1204,
//    NSURLErrorClientCertificateRejected = -1205,
//    NSURLErrorClientCertificateRequired = -1206,
//    NSURLErrorCannotLoadFromNetwork = -2000,
//    NSURLErrorCannotCreateFile = -3000,
//    NSURLErrorCannotOpenFile = -3001,
//    NSURLErrorCannotCloseFile = -3002,
//    NSURLErrorCannotWriteToFile = -3003,
//    NSURLErrorCannotRemoveFile = -3004,
//    NSURLErrorCannotMoveFile = -3005,
//    NSURLErrorDownloadDecodingFailedMidStream = -3006,
//    NSURLErrorDownloadDecodingFailedToComplete = -3007
//};


#endif /* JZGNetworkDefine_h */

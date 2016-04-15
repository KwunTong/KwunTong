//
//  NSString+Hash.h
//
/**
 命令行测试命令
 
 MD5
 $ echo -n abc | openssl md5
 SHA1
 $ echo -n abc | openssl sha1
 SHA256
 $ echo -n abc | openssl sha -sha256
 SHA512
 $ echo -n abc | openssl sha -sha512
 
 说明：abc是要加密的字符串
 */

#import <Foundation/Foundation.h>

@interface NSString (Hash)

@property (nonatomic, readonly) NSString *md5String;
@property (nonatomic, readonly) NSString *sha1String;
@property (nonatomic, readonly) NSString *sha256String;
@property (nonatomic, readonly) NSString *sha512String;

@end

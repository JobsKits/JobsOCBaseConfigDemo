//
//  AES.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_AES_6FD8B3B286
#define JOBS_HEADER_GUARD_AES_6FD8B3B286

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import <stdint.h>
#import <string.h>
#import "JobsAuthenticatedCipher.h"


@interface AES : NSObject

+(NSString *_Nullable)encrypt:(NSString *)message
            password:(NSString *)password;

+(NSString *_Nullable)decrypt:(NSString *)base64EncodedString
            password:(NSString *)password;

+(NSString *_Nullable)encrypt:(NSString *)message password:(NSString *)password error:(NSError **)error;
+(NSString *_Nullable)decrypt:(NSString *)ciphertext password:(NSString *)password error:(NSError **)error;
+(NSString *_Nullable)encryptAuthenticated:(NSString *)message password:(NSString *)password error:(NSError **)error;
/// JobsAES2 验证失败不会回退到旧格式；无版本前缀才按旧 AES 读取。
+(NSString *_Nullable)decryptCompatible:(NSString *)ciphertext password:(NSString *)password error:(NSError **)error;

@end

#endif /* JOBS_HEADER_GUARD_AES_6FD8B3B286 */

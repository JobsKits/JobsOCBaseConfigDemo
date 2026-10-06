//
//  JobsAuthenticatedCipher.h
//  JobsCryptography
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_AUTHENTICATED_CIPHER_H
#define JOBS_AUTHENTICATED_CIPHER_H

#import <CommonCrypto/CommonCrypto.h>
#import <Security/Security.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const JobsAuthenticatedCipherErrorDomain;
/// JAE2：PBKDF2-HMAC-SHA256 派生独立 AES/MAC 密钥，随机 salt/IV，AES256-CBC 后 HMAC-SHA256。
/// 先验证完整 envelope 的 MAC 再解密；支持 iOS 12，不依赖私有 GCM API。
@interface JobsAuthenticatedCipher : NSObject

+(NSData *_Nullable)encryptData:(NSData *)data password:(NSString *)password error:(NSError *_Nullable *_Nullable)error;
+(NSData *_Nullable)decryptData:(NSData *)data password:(NSString *)password error:(NSError *_Nullable *_Nullable)error;
+(NSString *_Nullable)encryptString:(NSString *)text password:(NSString *)password error:(NSError *_Nullable *_Nullable)error;
+(NSString *_Nullable)decryptString:(NSString *)text password:(NSString *)password error:(NSError *_Nullable *_Nullable)error;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_AUTHENTICATED_CIPHER_H */

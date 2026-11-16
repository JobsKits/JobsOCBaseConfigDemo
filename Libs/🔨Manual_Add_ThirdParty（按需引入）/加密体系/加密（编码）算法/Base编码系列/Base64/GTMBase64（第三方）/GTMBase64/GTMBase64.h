//
//  GTMBase64.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_GTMBASE64_09BCC7A7ED
#define JOBS_HEADER_GUARD_GTMBASE64_09BCC7A7ED

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>  // 提供常见摘要算法接口，如 MD5、SHA1、SHA256 等。
#import "GTMDefines.h"

#import "JobsByOCPods.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

// GTMBase64
//
/// Helper for handling Base64 and WebSafeBase64 encodings
//
/// The webSafe methods use different character set and also the results aren't
/// always padded to a multiple of 4 characters.  This is done so the resulting
/// data can be used in urls and url query arguments without needing any
/// encoding.  You must use the webSafe* methods together, the data does not
/// interop with the RFC methods.
//
@interface GTMBase64 : NSObject
//
// Standard Base64 (RFC) handling
//
+(JobsRetDataByDataBlock _Nonnull)encodeData;
+(JobsRetDataByDataBlock _Nonnull)decodeData;
+(NSData *)encodeBytes:(const void *)bytes length:(NSUInteger)length;
+(NSData *)decodeBytes:(const void *)bytes length:(NSUInteger)length;
+(JobsRetStrByDataBlock _Nonnull)stringByEncodingData;
+(NSString *)stringByEncodingBytes:(const void *)bytes length:(NSUInteger)length;
+(NSData *)decodeString:(NSString *)string;
//
// Modified Base64 encoding so the results can go onto urls.
//
// The changes are in the characters generated and also the result isn't
// padded to a multiple of 4.
// Must use the matching call to encode/decode, won't interop with the
// RFC versions.
//
+(NSData *)webSafeEncodeData:(NSData *)data padded:(BOOL)padded;
+(NSData *)webSafeDecodeData:(NSData *)data;
+(NSData *)webSafeEncodeBytes:(const void *)bytes
                       length:(NSUInteger)length
                       padded:(BOOL)padded;
+(NSData *)webSafeDecodeBytes:(const void *)bytes length:(NSUInteger)length;
+(NSString *)stringByWebSafeEncodingData:(NSData *)data padded:(BOOL)padded;
+(NSString *)stringByWebSafeEncodingBytes:(const void *)bytes
                                   length:(NSUInteger)length
                                   padded:(BOOL)padded;
+(JobsRetDataByStrBlock _Nonnull)webSafeDecodeString;
#pragma mark —— base64
+(JobsRetStrByStrBlock _Nonnull)md5_base64;
+(JobsRetStrByStrBlock _Nonnull)encodeBase64String;
+(JobsRetStrByStrBlock _Nonnull)decodeBase64String;
+(JobsRetStrByDataBlock _Nonnull)encodeBase64Data;
+(JobsRetStrByDataBlock _Nonnull)decodeBase64Data;

@end
#endif /* JOBS_HEADER_GUARD_GTMBASE64_09BCC7A7ED */

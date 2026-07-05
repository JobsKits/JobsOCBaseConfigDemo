//
//  SHA-1.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_SHA_1_3DC9DEBCC5
#define JOBS_HEADER_GUARD_SHA_1_3DC9DEBCC5

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>  // 提供常见摘要算法接口，如 MD5、SHA1、SHA256 等。
#import "GTMBase64.h"

#import "JobsByOCPods.h"

/// SHA1 加密
/// @param string 被加密的字符串
/// @param isLowercase 是否大小写
/// @param bit 加密长度
/// @param useBase64 是否用Base64 进行二次加密
NS_INLINE NSString *sha_1(NSString *string,
                                    BOOL isLowercase,
                                    int bit,
                                    BOOL useBase64){
    if (bit == CC_SHA1_DIGEST_LENGTH ||
        bit == CC_SHA1_BLOCK_BYTES) {
        const char *cStr = string.UTF8String;
        NSData *data = [NSData dataWithBytes:cStr length:string.length];
        uint8_t digest[bit];
        CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
        NSString *output = nil;
        if (useBase64) {
            NSData *base64 = [NSData.alloc initWithBytes:digest length:bit];
            base64 = GTMBase64.encodeData(base64);
            output = NSString.initByUTF8Data(base64);
        }else{
            NSMutableString *result = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
            for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
                [result appendFormat:@"%02x", digest[i]];
            }output = (NSString *)result;
        }
        NSString *finalStr = Nil;
        if(isLowercase){
            finalStr = output.lowercaseString;
        }else{
            finalStr = output.uppercaseString;
        };return finalStr;
    }else{
        return nil;
    }
}
#endif /* JOBS_HEADER_GUARD_SHA_1_3DC9DEBCC5 */

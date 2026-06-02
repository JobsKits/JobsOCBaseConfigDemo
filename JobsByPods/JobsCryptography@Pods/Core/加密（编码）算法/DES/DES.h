//
//  DES.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_DES_757A32D9E5
#define JOBS_HEADER_GUARD_DES_757A32D9E5

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>
/// DES 加密
NS_INLINE NSData *_Nullable encryptUseDES(NSData *_Nonnull plainText,
                                          Byte *_Nonnull key){
    NSData *textData = plainText;
    NSUInteger dataLength = textData.length;
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionECBMode,
                                          key,
                                          kCCKeySizeDES,
                                          nil,
                                          textData.bytes,
                                          dataLength,
                                          buffer,
                                          1024,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:buffer
                                      length:(NSUInteger)numBytesEncrypted];
        return data;
    }return nil;
}
/// DES 解密
NS_INLINE NSData *_Nullable decrypUseDES(NSData *_Nonnull plainText,
                                         Byte *_Nonnull key){
    NSData *cipherdata = plainText;
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionECBMode,
                                          key,
                                          kCCKeySizeDES,
                                          nil,
                                          cipherdata.bytes,
                                          cipherdata.length,
                                          buffer,
                                          1024,
                                          &numBytesDecrypted);
    if(cryptStatus == kCCSuccess){
        NSData *plaindata = [NSData dataWithBytes:buffer
                                           length:(NSUInteger)numBytesDecrypted];
        return plaindata;
    }return nil;
}
#endif /* JOBS_HEADER_GUARD_DES_757A32D9E5 */

//
//  AESCipher.m
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AESCipher.h"

NSString const *kInitVector = @"AESBytes16String";
size_t const kKeySize = kCCKeySizeAES128;

#pragma mark —— 公共私有方法
NSData *cipherOperation(NSData *contentData,
                        NSData *keyData,
                        CCOperation operation) {
    if (![contentData isKindOfClass:NSData.class] || ![keyData isKindOfClass:NSData.class] ||
        keyData.length != kKeySize || contentData.length > NSUIntegerMax - kCCBlockSizeAES128) {
        return nil;
    }
    NSUInteger dataLength = contentData.length;
    NSData *ivData = [kInitVector dataUsingEncoding:NSUTF8StringEncoding];
    void const *initVectorBytes = ivData.bytes;
    void const *contentBytes = contentData.bytes;
    void const *keyBytes = keyData.bytes;
    size_t operationSize = dataLength + kCCBlockSizeAES128;
    void *operationBytes = malloc(operationSize);
    if (operationBytes == NULL) {
        return nil;
    }
    size_t actualOutSize = 0;
    CCCryptorStatus cryptStatus = CCCrypt(operation,
                                          kCCAlgorithmAES,
                                          kCCOptionPKCS7Padding,
                                          keyBytes,
                                          kKeySize,
                                          initVectorBytes,
                                          contentBytes,
                                          dataLength,
                                          operationBytes,
                                          operationSize,
                                          &actualOutSize);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:operationBytes length:actualOutSize freeWhenDone:YES];
    }
    free(operationBytes);
    operationBytes = NULL;
    return nil;
}
#pragma mark —— 异常提示
NSData *aesEncryptData(NSData *contentData,
                       NSData *keyData) {
    return cipherOperation(contentData, keyData, kCCEncrypt);
}

NSData *aesDecryptData(NSData *contentData,
                       NSData *keyData) {
    return cipherOperation(contentData, keyData, kCCDecrypt);
}
#pragma mark —— 真正的加解密
NSString *aesEncryptString(NSString *content,
                           NSString *key) {
    if (![content isKindOfClass:NSString.class] || ![key isKindOfClass:NSString.class]) {
        return nil;
    }
    NSData *contentData = [content dataUsingEncoding:NSUTF8StringEncoding];
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encrptedData = aesEncryptData(contentData, keyData);
    return [encrptedData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
}

NSString *aesDecryptString(NSString *content,
                           NSString *key) {
    if (![content isKindOfClass:NSString.class] || ![key isKindOfClass:NSString.class]) {
        return nil;
    }
    NSString *compact = [[content componentsSeparatedByCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet] componentsJoinedByString:@""];
    NSData *contentData = [[NSData alloc] initWithBase64EncodedString:compact options:0];
    if (!contentData.length) {
        return nil;
    }
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *decryptedData = aesDecryptData(contentData, keyData);
    return decryptedData ? [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding] : nil;
}


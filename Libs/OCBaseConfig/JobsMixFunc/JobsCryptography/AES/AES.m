//
//  AES.m
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AES.h"

static NSString *JobsLegacyCipherError(NSError **error, NSString *reason) {
    if (error) {
        *error = [NSError errorWithDomain:JobsAuthenticatedCipherErrorDomain code:8
                                userInfo:@{NSLocalizedDescriptionKey: reason}];
    }
    return nil;
}

// 旧格式固定为SHA256口令派生、零IV的AES-CBC；只负责历史密文兼容。
static NSData *JobsLegacyAESOperation(NSData *input, NSData *password, CCOperation operation, NSError **error) {
    if (password.length > UINT32_MAX || input.length > NSUIntegerMax - kCCBlockSizeAES128) {
        JobsLegacyCipherError(error, @"Input exceeds legacy cipher limits");
        return nil;
    }
    unsigned char key[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(password.bytes, (CC_LONG)password.length, key);
    NSMutableData *result = [NSMutableData dataWithLength:input.length + kCCBlockSizeAES128];
    size_t outputLength = 0;
    CCCryptorStatus status = CCCrypt(operation, kCCAlgorithmAES, kCCOptionPKCS7Padding,
        key, sizeof(key), NULL, input.bytes, input.length,
        result.mutableBytes, result.length, &outputLength);
    memset(key, 0, sizeof(key));
    if (status != kCCSuccess) {
        if (error) {
            *error = [NSError errorWithDomain:NSOSStatusErrorDomain code:status userInfo:nil];
        }
        return nil;
    }
    result.length = outputLength;
    return result;
}

@implementation AES

+(NSString *)encrypt:(NSString *)message password:(NSString *)password {
    return [self encrypt:message password:password error:nil];
}

+(NSString *)encrypt:(NSString *)message password:(NSString *)password error:(NSError **)error {
    if (error) {
        *error = nil;
    }
    if (![message isKindOfClass:NSString.class] || ![password isKindOfClass:NSString.class]) {
        return JobsLegacyCipherError(error, @"Expected text and password");
    }
    NSData *data = [message dataUsingEncoding:NSUTF8StringEncoding];
    NSData *passwordData = [password dataUsingEncoding:NSUTF8StringEncoding];
    if (!data || !passwordData) {
        return JobsLegacyCipherError(error, @"Input is not UTF-8");
    }
    NSData *encrypted = JobsLegacyAESOperation(data, passwordData, kCCEncrypt, error);
    if (!encrypted) {
        if (error && !*error) {
            JobsLegacyCipherError(error, @"Encryption failed");
        }
        return nil;
    }
    return [encrypted base64EncodedStringWithOptions:0];
}

+(NSString *)decrypt:(NSString *)ciphertext password:(NSString *)password {
    return [self decryptCompatible:ciphertext password:password error:nil];
}

+(NSString *)decrypt:(NSString *)ciphertext password:(NSString *)password error:(NSError **)error {
    if (error) {
        *error = nil;
    }
    if (![ciphertext isKindOfClass:NSString.class] || ![password isKindOfClass:NSString.class]) {
        return JobsLegacyCipherError(error, @"Expected ciphertext and password");
    }
    NSString *compact = [[ciphertext componentsSeparatedByCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet] componentsJoinedByString:@""];
    NSData *encrypted = [[NSData alloc] initWithBase64EncodedString:compact options:0];
    NSData *passwordData = [password dataUsingEncoding:NSUTF8StringEncoding];
    if (!encrypted.length || !passwordData) {
        return JobsLegacyCipherError(error, @"Invalid legacy Base64 or password");
    }
    NSData *plain = JobsLegacyAESOperation(encrypted, passwordData, kCCDecrypt, error);
    if (!plain) {
        if (error && !*error) {
            JobsLegacyCipherError(error, @"Decryption failed");
        }
        return nil;
    }
    NSString *result = [[NSString alloc] initWithData:plain encoding:NSUTF8StringEncoding];
    return result ?: JobsLegacyCipherError(error, @"Plaintext is not UTF-8");
}

+(NSString *)encryptAuthenticated:(NSString *)message password:(NSString *)password error:(NSError **)error {
    return [JobsAuthenticatedCipher encryptString:message password:password error:error];
}

+(NSString *)decryptCompatible:(NSString *)ciphertext password:(NSString *)password error:(NSError **)error {
    if ([ciphertext isKindOfClass:NSString.class] && [ciphertext hasPrefix:@"JobsAES"]) {
        return [JobsAuthenticatedCipher decryptString:ciphertext password:password error:error];
    }
    return [self decrypt:ciphertext password:password error:error];
}

@end

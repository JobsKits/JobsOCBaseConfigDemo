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
    NSData *encrypted = [data AES256EncryptedDataUsingKey:passwordData.SHA256Hash error:error];
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
    NSData *plain = [encrypted decryptedAES256DataUsingKey:passwordData.SHA256Hash error:error];
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

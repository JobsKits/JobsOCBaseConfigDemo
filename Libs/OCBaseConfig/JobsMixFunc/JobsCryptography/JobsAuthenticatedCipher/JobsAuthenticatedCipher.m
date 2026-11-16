//
//  JobsAuthenticatedCipher.m
//  JobsCryptography
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsAuthenticatedCipher.h"

NSString *const JobsAuthenticatedCipherErrorDomain = @"JobsAuthenticatedCipher";
static const uint32_t JobsCipherRounds = 200000;
static const NSUInteger JobsCipherHeaderLength = 40;
static const NSUInteger JobsCipherMaximumDataLength = 64 * 1024 * 1024;

static id JobsCipherFailure(NSError **error, NSInteger code, NSString *reason) {
    if (error) {
        *error = [NSError errorWithDomain:JobsAuthenticatedCipherErrorDomain code:code
                                userInfo:@{NSLocalizedDescriptionKey: reason}];
    }
    return nil;
}

static void JobsCipherWipe(void *bytes, size_t length) {
    volatile unsigned char *cursor = bytes;
    while (length--) {
        *cursor++ = 0;
    }
}

static BOOL JobsCipherKeys(NSString *password, const unsigned char *salt, uint32_t rounds, unsigned char keys[64]) {
    NSData *utf8 = [password dataUsingEncoding:NSUTF8StringEncoding];
    return utf8.length && CCKeyDerivationPBKDF(kCCPBKDF2, utf8.bytes, utf8.length, salt, 16,
                                               kCCPRFHmacAlgSHA256, rounds, keys, 64) == kCCSuccess;
}

@implementation JobsAuthenticatedCipher

+(NSData *)encryptData:(NSData *)data password:(NSString *)password error:(NSError **)error {
    if (error) {
        *error = nil;
    }
    if (![data isKindOfClass:NSData.class] || data.length > JobsCipherMaximumDataLength ||
        ![password isKindOfClass:NSString.class] || !password.length) {
        return JobsCipherFailure(error, 1, @"Expected data and a nonempty password");
    }
    unsigned char header[40] = {'J', 'A', 'E', '2',
                               (unsigned char)(JobsCipherRounds >> 24), (unsigned char)(JobsCipherRounds >> 16),
                               (unsigned char)(JobsCipherRounds >> 8), (unsigned char)JobsCipherRounds};
    if (SecRandomCopyBytes(kSecRandomDefault, 32, header + 8) != errSecSuccess) {
        return JobsCipherFailure(error, 2, @"Secure random generation failed");
    }
    unsigned char keys[64] = {0};
    if (!JobsCipherKeys(password, header + 8, JobsCipherRounds, keys)) {
        JobsCipherWipe(keys, sizeof(keys));
        return JobsCipherFailure(error, 3, @"Password derivation failed");
    }
    NSMutableData *ciphertext = [NSMutableData dataWithLength:data.length + kCCBlockSizeAES128];
    size_t written = 0;
    CCCryptorStatus status = CCCrypt(kCCEncrypt, kCCAlgorithmAES, kCCOptionPKCS7Padding,
                                    keys, kCCKeySizeAES256, header + 24,
                                    data.bytes, data.length, ciphertext.mutableBytes, ciphertext.length, &written);
    if (status != kCCSuccess) {
        JobsCipherWipe(keys, sizeof(keys));
        return JobsCipherFailure(error, 4, @"Encryption failed");
    }
    [ciphertext setLength:written];
    NSMutableData *envelope = [NSMutableData dataWithBytes:header length:sizeof(header)];
    [envelope appendData:ciphertext];
    unsigned char mac[CC_SHA256_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA256, keys + 32, 32, envelope.bytes, envelope.length, mac);
    JobsCipherWipe(keys, sizeof(keys));
    [envelope appendBytes:mac length:sizeof(mac)];
    return envelope;
}

+(NSData *)decryptData:(NSData *)data password:(NSString *)password error:(NSError **)error {
    if (error) {
        *error = nil;
    }
    if (![data isKindOfClass:NSData.class] || data.length < 88 ||
        data.length > JobsCipherMaximumDataLength + 88 ||
        ![password isKindOfClass:NSString.class] || !password.length) {
        return JobsCipherFailure(error, 1, @"Invalid envelope or password");
    }
    const unsigned char *bytes = data.bytes;
    if (bytes[0] != 'J' || bytes[1] != 'A' || bytes[2] != 'E' || bytes[3] != '2') {
        return JobsCipherFailure(error, 5, @"Unsupported ciphertext version");
    }
    uint32_t rounds = ((uint32_t)bytes[4] << 24) | ((uint32_t)bytes[5] << 16) |
                      ((uint32_t)bytes[6] << 8) | bytes[7];
    NSUInteger encryptedLength = data.length - JobsCipherHeaderLength - CC_SHA256_DIGEST_LENGTH;
    if (rounds < 100000 || rounds > 1000000 || encryptedLength % kCCBlockSizeAES128) {
        return JobsCipherFailure(error, 1, @"Invalid derivation or ciphertext length");
    }
    unsigned char keys[64] = {0};
    if (!JobsCipherKeys(password, bytes + 8, rounds, keys)) {
        JobsCipherWipe(keys, sizeof(keys));
        return JobsCipherFailure(error, 3, @"Password derivation failed");
    }
    unsigned char expected[CC_SHA256_DIGEST_LENGTH];
    NSUInteger authenticatedLength = data.length - sizeof(expected);
    CCHmac(kCCHmacAlgSHA256, keys + 32, 32, data.bytes, authenticatedLength, expected);
    unsigned char difference = 0;
    for (NSUInteger index = 0; index < sizeof(expected); index++) {
        difference |= expected[index] ^ bytes[authenticatedLength + index];
    }
    if (difference) {
        JobsCipherWipe(keys, sizeof(keys));
        return JobsCipherFailure(error, 6, @"Authentication failed");
    }
    NSMutableData *plaintext = [NSMutableData dataWithLength:encryptedLength];
    size_t written = 0;
    CCCryptorStatus status = CCCrypt(kCCDecrypt, kCCAlgorithmAES, kCCOptionPKCS7Padding,
                                    keys, kCCKeySizeAES256, bytes + 24,
                                    bytes + JobsCipherHeaderLength, encryptedLength,
                                    plaintext.mutableBytes, plaintext.length, &written);
    JobsCipherWipe(keys, sizeof(keys));
    if (status != kCCSuccess) {
        return JobsCipherFailure(error, 4, @"Decryption failed");
    }
    [plaintext setLength:written];
    return plaintext;
}

+(NSString *)encryptString:(NSString *)text password:(NSString *)password error:(NSError **)error {
    if (![text isKindOfClass:NSString.class]) {
        return JobsCipherFailure(error, 1, @"Expected UTF-8 text");
    }
    NSData *envelope = [self encryptData:[text dataUsingEncoding:NSUTF8StringEncoding] password:password error:error];
    return envelope ? [@"JobsAES2:" stringByAppendingString:[envelope base64EncodedStringWithOptions:0]] : nil;
}

+(NSString *)decryptString:(NSString *)text password:(NSString *)password error:(NSError **)error {
    if (![text isKindOfClass:NSString.class] || ![text hasPrefix:@"JobsAES2:"]) {
        return JobsCipherFailure(error, 5, @"Expected JobsAES2 ciphertext");
    }
    NSData *envelope = [[NSData alloc] initWithBase64EncodedString:[text substringFromIndex:9] options:0];
    NSData *plaintext = [self decryptData:envelope password:password error:error];
    if (!plaintext) {
        return nil;
    }
    NSString *result = [[NSString alloc] initWithData:plaintext encoding:NSUTF8StringEncoding];
    return result ?: JobsCipherFailure(error, 7, @"Plaintext is not UTF-8");
}

@end

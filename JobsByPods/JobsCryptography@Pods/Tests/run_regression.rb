# JobsAuthenticatedCipher 的真实 macOS 小回归；不安装依赖、不改 Xcode 工程。
source = <<~'OBJC'
#import <Foundation/Foundation.h>
#import "JobsAuthenticatedCipher.h"

static void Check(BOOL condition, NSString *message) {
    if (!condition) {
        fprintf(stderr, "%s\n", message.UTF8String);
        exit(1);
    }
}

int main(void) {
    @autoreleasepool {
        NSError *error = nil;
        NSString *unicode = [NSString stringWithFormat:@"中文🔐%C尾部", (unichar)0];
        NSString *password = [NSString stringWithFormat:@"口令%C尾部", (unichar)0];
        for (NSString *text in @[@"", @"ASCII", unicode]) {
            NSString *first = [JobsAuthenticatedCipher encryptString:text password:password error:&error];
            Check(first != nil && error == nil, @"Encryption failed");
            NSString *second = [JobsAuthenticatedCipher encryptString:text password:password error:&error];
            Check(![first isEqual:second], @"Random envelope repeated");
            Check([[JobsAuthenticatedCipher decryptString:first password:password error:&error] isEqual:text], @"Roundtrip mismatch");
            Check(error == nil, @"Successful decrypt retained an error");
        }
        NSString *original = [JobsAuthenticatedCipher encryptString:@"original" password:@"correct" error:&error];
        Check([JobsAuthenticatedCipher decryptString:original password:@"wrong" error:&error] == nil && error != nil, @"Wrong password accepted");
        NSData *envelope = [[NSData alloc] initWithBase64EncodedString:[original substringFromIndex:9] options:0];
        for (NSNumber *index in @[@0, @8, @24, @40, @(envelope.length - 1)]) {
            NSMutableData *changed = [envelope mutableCopy];
            ((unsigned char *)changed.mutableBytes)[index.unsignedIntegerValue] ^= 1;
            Check([JobsAuthenticatedCipher decryptData:changed password:@"correct" error:&error] == nil && error != nil, @"Modified envelope accepted");
        }
        for (NSString *text in @[@"JobsAES3:AAAA", @"JobsAES2:%%%%", @"JobsAES2:AAAA", @"legacy"]) {
            Check([JobsAuthenticatedCipher decryptString:text password:@"correct" error:&error] == nil && error != nil, @"Malformed version or envelope accepted");
        }
        NSMutableData *invalidRounds = [envelope mutableCopy];
        memset((unsigned char *)invalidRounds.mutableBytes + 4, 0xff, 4);
        Check([JobsAuthenticatedCipher decryptData:invalidRounds password:@"correct" error:&error] == nil, @"Unbounded PBKDF rounds accepted");
        Check([JobsAuthenticatedCipher encryptString:@"message" password:@"" error:&error] == nil && error != nil, @"Empty password accepted");
        unsigned char key[CC_SHA256_DIGEST_LENGTH];
        NSData *legacyPassword = [@"old password" dataUsingEncoding:NSUTF8StringEncoding];
        CC_SHA256(legacyPassword.bytes, (CC_LONG)legacyPassword.length, key);
        NSData *legacyPlaintext = [@"legacy 中文" dataUsingEncoding:NSUTF8StringEncoding];
        unsigned char ciphertext[64];
        size_t count = 0;
        Check(CCCrypt(kCCEncrypt, kCCAlgorithmAES, kCCOptionPKCS7Padding, key, sizeof(key), NULL,
                      legacyPlaintext.bytes, legacyPlaintext.length, ciphertext, sizeof(ciphertext), &count) == kCCSuccess, @"Legacy vector generation failed");
        printf("legacy-vector: %s\n", [[NSData dataWithBytes:ciphertext length:count] base64EncodedStringWithOptions:0].UTF8String);
        puts("JobsAuthenticatedCipher: 3 roundtrips, randomness, UTF-8 NUL, wrong password, 5 tamper points, malformed/version/KDF boundaries passed");
    }
    return 0;
}
OBJC
include_directory = File.expand_path('../Core/JobsAuthenticatedCipher', __dir__)
implementation = File.join(include_directory, 'JobsAuthenticatedCipher.m')

require 'tmpdir'
require 'open3'

pod_root = File.expand_path('..', __dir__)
sdk, sdk_error, sdk_status = Open3.capture3('xcrun', '--sdk', 'macosx', '--show-sdk-path')
abort sdk_error unless sdk_status.success?
Dir.mktmpdir('jobs-regression-') do |directory|
  main = File.join(directory, 'main.m')
  executable = File.join(directory, 'regression')
  File.write(main, source)
  arguments = ['xcrun', '--sdk', 'macosx', 'clang', '-fobjc-arc', '-fblocks', '-isysroot', sdk.strip,
               '-framework', 'Foundation', '-framework', 'Security', '-I', include_directory,
               main, implementation, '-o', executable]
  output, errors, status = Open3.capture3(*arguments)
  warn errors unless errors.empty?
  abort output unless status.success?
  output, errors, status = Open3.capture3(executable)
  print output
  warn errors unless errors.empty?
  abort 'Regression failed' unless status.success?
end

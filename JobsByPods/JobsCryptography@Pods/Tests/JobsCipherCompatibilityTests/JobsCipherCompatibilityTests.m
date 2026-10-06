//
//  JobsCipherCompatibilityTests.m
//  JobsCryptography
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsCipherCompatibilityTests.h"

@implementation JobsCipherCompatibilityTests

-(void)testAuthenticatedEmptyUnicodeAndRandomness {
    NSError *error = nil;
    for (NSString *message in @[@"", [NSString stringWithFormat:@"中文🔐%C尾部", (unichar)0]]) {
        NSString *first = [AES encryptAuthenticated:message password:@"口令" error:&error];
        NSString *second = [AES encryptAuthenticated:message password:@"口令" error:&error];
        XCTAssertNotEqualObjects(first, second);
        XCTAssertEqualObjects([AES decryptCompatible:first password:@"口令" error:&error], message);
        XCTAssertNil(error);
    }
}

-(void)testAuthenticationAndVersionRejectWithoutDowngrade {
    NSError *error = nil;
    NSString *text = [AES encryptAuthenticated:@"original" password:@"correct" error:&error];
    XCTAssertNil([AES decryptCompatible:text password:@"wrong" error:&error]);
    XCTAssertNotNil(error);
    NSMutableData *bytes = [[[NSData alloc] initWithBase64EncodedString:[text substringFromIndex:9] options:0] mutableCopy];
    ((unsigned char *)bytes.mutableBytes)[40] ^= 1;
    NSString *modified = [@"JobsAES2:" stringByAppendingString:[bytes base64EncodedStringWithOptions:0]];
    XCTAssertNil([AES decryptCompatible:modified password:@"correct" error:&error]);
    XCTAssertNotNil(error);
    XCTAssertNil([AES decryptCompatible:@"JobsAES3:AAAA" password:@"correct" error:&error]);
    XCTAssertNotNil(error);
    XCTAssertNil([AES decryptCompatible:@"invalid%%" password:@"correct" error:&error]);
    XCTAssertNotNil(error);
}

-(void)testLegacyReadsAndFailureAreDistinctFromEmptyText {
    NSError *error = nil;
    NSString *ciphertext = [AES encrypt:@"legacy 中文" password:@"old password" error:&error];
    XCTAssertFalse([ciphertext hasPrefix:@"JobsAES"]);
    XCTAssertEqualObjects(ciphertext, @"4YTGG+jP5UmwMyRmUANvzQ==");
    XCTAssertEqualObjects([AES decryptCompatible:ciphertext password:@"old password" error:&error], @"legacy 中文");
    NSString *empty = [AES encrypt:@"" password:@"old password" error:&error];
    XCTAssertEqualObjects([AES decryptCompatible:empty password:@"old password" error:&error], @"");
    XCTAssertNil([AES decrypt:@"" password:@"old password" error:&error]);
    XCTAssertNotNil(error);
    XCTAssertNil(aesEncryptString(@"message", @"short"));
}
@end

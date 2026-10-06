//
//  JobsKeychainIdentityTests.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsKeychainIdentityTests.h"

@implementation JobsKeychainIdentityTests

-(void)setUp {
    [super setUp];
    self.service = [@"JobsKeychainRegression." stringByAppendingString:NSUUID.UUID.UUIDString];
}

-(void)tearDown {
    JobsKeychainHelper.deleteAccountInfoByService(self.service);
    [super tearDown];
}

-(void)testAccountsAndTargetedDeleteAreIsolated {
    NSError *error = nil;
    BOOL saved = [JobsKeychainHelper saveAccount:@"first" password:@"" forService:self.service error:&error];
    if (!saved && ([error.domain isEqualToString:NSOSStatusErrorDomain] &&
        (error.code == errSecMissingEntitlement || error.code == errSecNotAvailable))) {
        XCTSkip(@"Keychain unavailable: %@", error);
    }
    XCTAssertTrue(saved, @"%@", error);
    XCTAssertTrue([JobsKeychainHelper saveAccount:@"second" password:@"secret" forService:self.service error:&error]);
    XCTAssertEqualObjects([JobsKeychainHelper getPasswordByService:self.service account:@"first" error:&error], @"");
    XCTAssertTrue([JobsKeychainHelper deleteAccount:@"first" forService:self.service error:&error]);
    XCTAssertEqualObjects([JobsKeychainHelper getPasswordByService:self.service account:@"second" error:&error], @"secret");
    XCTAssertTrue([JobsKeychainHelper deleteAccount:@"first" forService:self.service error:&error]);
}

-(void)testFailedArchivePreservesPriorDataAndRestrictsClasses {
    NSError *error = nil;
    BOOL saved = [JobsKeychainHelper save:self.service data:@"original" error:&error];
    if (!saved && ([error.domain isEqualToString:NSOSStatusErrorDomain] &&
        (error.code == errSecMissingEntitlement || error.code == errSecNotAvailable))) {
        XCTSkip(@"Keychain unavailable: %@", error);
    }
    XCTAssertTrue(saved, @"%@", error);
    XCTAssertFalse([JobsKeychainHelper save:self.service data:(id<NSSecureCoding>)NSObject.new error:&error]);
    XCTAssertNotNil(error);
    XCTAssertEqualObjects([JobsKeychainHelper loadService:self.service allowedClasses:[NSSet setWithObject:NSString.class] error:&error], @"original");
    XCTAssertNil([JobsKeychainHelper loadService:self.service allowedClasses:[NSSet setWithObject:NSDate.class] error:&error]);
    XCTAssertNotNil(error);
    XCTAssertEqual(error.code, errSecDecode);
    XCTAssertEqualObjects([JobsKeychainHelper loadService:self.service allowedClasses:[NSSet setWithObject:NSString.class] error:&error], @"original");
    XCTAssertNil(error);

    NSArray *payload = @[@{@"label": @"value", @"count": @1}];
    XCTAssertTrue([JobsKeychainHelper save:self.service data:payload error:&error]);
    NSSet *withoutNumbers = [NSSet setWithObjects:NSArray.class, NSDictionary.class, NSString.class, nil];
    XCTAssertNil([JobsKeychainHelper loadService:self.service allowedClasses:withoutNumbers error:&error]);
    XCTAssertEqual(error.code, errSecDecode);
    NSSet *allPayloadClasses = [withoutNumbers setByAddingObject:NSNumber.class];
    XCTAssertEqualObjects([JobsKeychainHelper loadService:self.service allowedClasses:allPayloadClasses error:&error], payload);
    XCTAssertNil(error);

    XCTAssertNil([JobsKeychainHelper loadService:self.service allowedClasses:(id)@42 error:&error]);
    XCTAssertEqual(error.code, errSecParam);
    XCTAssertNil([JobsKeychainHelper loadService:self.service allowedClasses:(id)[NSSet setWithObject:@"NSString"] error:&error]);
    XCTAssertEqual(error.code, errSecParam);
    XCTAssertNil([JobsKeychainHelper loadService:self.service allowedClasses:nil error:&error]);
    XCTAssertEqual(error.code, errSecParam);
    XCTAssertNil([JobsKeychainHelper loadService:self.service allowedClasses:NSSet.new error:&error]);
    XCTAssertEqual(error.code, errSecParam);
}

-(void)testExplicitMigrationDoesNotOverwriteExistingAccount {
    NSError *error = nil;
    BOOL saved = [JobsKeychainHelper saveAccount:self.service password:@"legacy" forService:self.service error:&error];
    if (!saved && ([error.domain isEqualToString:NSOSStatusErrorDomain] &&
        (error.code == errSecMissingEntitlement || error.code == errSecNotAvailable))) {
        XCTSkip(@"Keychain unavailable: %@", error);
    }
    XCTAssertTrue(saved, @"%@", error);
    XCTAssertTrue([JobsKeychainHelper saveAccount:@"target" password:@"existing" forService:self.service error:&error]);
    XCTAssertFalse([JobsKeychainHelper migrateLegacyPasswordForService:self.service toAccount:@"target" error:&error]);
    XCTAssertEqualObjects([JobsKeychainHelper getPasswordByService:self.service account:self.service error:&error], @"legacy");
    XCTAssertEqualObjects([JobsKeychainHelper getPasswordByService:self.service account:@"target" error:&error], @"existing");
    XCTAssertTrue([JobsKeychainHelper migrateLegacyPasswordForService:self.service toAccount:@"new-target" error:&error]);
    XCTAssertNil([JobsKeychainHelper getPasswordByService:self.service account:self.service error:&error]);
    XCTAssertEqualObjects([JobsKeychainHelper getPasswordByService:self.service account:@"new-target" error:&error], @"legacy");
}
@end

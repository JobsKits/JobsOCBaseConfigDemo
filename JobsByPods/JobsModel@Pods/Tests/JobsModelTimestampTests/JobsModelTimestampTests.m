//
//  JobsModelTimestampTests.m
//  JobsModel
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsModelTimestampTests.h"
#import <JobsModel/NSString+JobsModelTime.h>
#import <JobsModel/JobsUserModel.h>
#import <JobsModel/FMDoorModel.h>

@implementation JobsModelTimestampTests

-(void)testExplicitUnitsAndModelFieldUseCanonicalChinaTime{
    NSString *expected = @"2023-11-15 06:13:20";
    XCTAssertEqualObjects(@"1700000000000".chinaTime(nil), expected);
    XCTAssertEqualObjects([@"1700000000" timeStampByTimeFormatter:nil
                                                  timeZoneType:TimeZoneTypeCSTChina
                                                 intervalStyle:intervalBySec], expected);
    XCTAssertEqualObjects([@"1700000000000" timeStampByTimeFormatter:nil
                                                     timeZoneType:TimeZoneTypeCSTChina
                                                    intervalStyle:intervalByMilliSec], expected);
    JobsUserModel *user = [JobsUserModel new];
    FMDoorModel *door = [FMDoorModel new];
    user.expireTime = @"1700000000000";
    door.expireTime = @"1700000000000";
    XCTAssertEqualObjects(user.tokenExpireTime, expected);
    XCTAssertEqualObjects(door.tokenExpireTime, expected);
    user.expireTime = @"invalid";
    door.expireTime = @"invalid";
    XCTAssertNil(user.tokenExpireTime);
    XCTAssertEqualObjects(door.tokenExpireTime, @"");
}

-(void)testInvalidNumericInputDoesNotProduceEpochOrTruncateAtNUL{
    NSString *embeddedNUL = [NSString stringWithFormat:@"1700000000%Cjunk", (unichar)0];
    NSArray<NSString *> *invalid = @[@"", @".", @"-1", @"nan", @"inf", @"1e3", @"1.2.3", @"123suffix", embeddedNUL];
    for (NSString *value in invalid) {
        NSTimeInterval seconds = 42;
        XCTAssertFalse(JobsModelParseTimestamp(value, NO, &seconds));
        XCTAssertEqual(seconds, 42);
        XCTAssertNil(value.chinaTime(nil));
    }
    XCTAssertNil([@"0" timeStampByTimeFormatter:nil
                                 timeZoneType:TimeZoneTypeCSTChina
                                intervalStyle:(IntervalStyle)999]);
    XCTAssertEqualObjects(@"0".chinaTime(nil), @"1970-01-01 08:00:00");
    NSTimeInterval seconds = -1;
    XCTAssertTrue(JobsModelParseTimestamp(@"1000.5", YES, &seconds));
    XCTAssertEqualWithAccuracy(seconds, 1.0005, 0.000001);
}

@end

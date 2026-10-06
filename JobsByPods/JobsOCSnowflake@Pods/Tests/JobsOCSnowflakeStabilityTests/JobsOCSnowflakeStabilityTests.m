//
//  JobsOCSnowflakeStabilityTests.m
//  JobsOCSnowflake
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsOCSnowflakeStabilityTests.h"

static int JobsSnowflakeCompareIDs(const void *left, const void *right) {
    uint64_t first = *(const uint64_t *)left;
    uint64_t second = *(const uint64_t *)right;
    return (first > second) - (first < second);
}

@implementation JobsOCSnowflakeStabilityTests

-(void)testFrozenMillisecondSequenceWrapAndDecode{
    JobsOCSnowflake *generator = [[JobsOCSnowflake alloc]
        initWithPublishMillisecond:0 IDCID:31 machineID:31 clock:^uint64_t{
            return 10000;
        }];
    XCTAssertNotNil(generator);
    if (!generator) {
        return;
    }
    uint64_t previous = 0;
    for (NSUInteger index = 0; index < 10000; index++) {
        NSNumber *value = generator.nextID();
        XCTAssertNotNil(value);
        uint64_t identifier = value.unsignedLongLongValue;
        XCTAssertGreaterThan(identifier, previous);
        XCTAssertEqual(generator.IDCWithID(identifier), 31U);
        XCTAssertEqual(generator.machineWithID(identifier), 31U);
        XCTAssertEqual(generator.timeWithID(identifier), 10000 + index / 4096);
        previous = identifier;
    }
    // Legacy observation setters cannot reset the issued-ID stream.
    generator.bySequence(0).byLastGeneralMillisecond(0);
    XCTAssertGreaterThan(generator.nextID().unsignedLongLongValue, previous);
}

-(void)testRollbackRejectionAndRecovery{
    __block uint64_t now = 10000;
    JobsOCSnowflake *generator = [[JobsOCSnowflake alloc]
        initWithPublishMillisecond:0 IDCID:0 machineID:0 clock:^uint64_t{
            return now;
        }];
    XCTAssertNotNil(generator);
    if (!generator) {
        return;
    }
    uint64_t first = generator.nextID().unsignedLongLongValue;
    now = 9000;
    uint64_t second = generator.nextID().unsignedLongLongValue;
    XCTAssertGreaterThan(second, first);
    now = 1;
    XCTAssertNil(generator.nextID());
    now = 11000;
    XCTAssertGreaterThan(generator.nextID().unsignedLongLongValue, second);
}

-(void)testNodeAndTimestampBoundsInAllBuildConfigurations{
    JobsRetuint64_tByVoidBlock clock = ^uint64_t{
        return 10000;
    };
    XCTAssertNil([[JobsOCSnowflake alloc] initWithPublishMillisecond:0 IDCID:32 machineID:0 clock:clock]);
    XCTAssertNil([[JobsOCSnowflake alloc] initWithPublishMillisecond:0 IDCID:0 machineID:32 clock:clock]);
    XCTAssertNil([[JobsOCSnowflake alloc] initWithPublishMillisecond:10001 IDCID:0 machineID:0 clock:clock]);
    XCTAssertNil([[JobsOCSnowflake alloc] initWithPublishMillisecond:0 IDCID:0 machineID:0 clock:^uint64_t{
        return UINT64_C(1) << 41;
    }]);
}

-(void)testConcurrentUniqueness{
    JobsOCSnowflake *generator = [[JobsOCSnowflake alloc]
        initWithPublishMillisecond:0 IDCID:1 machineID:1 clock:^uint64_t{
            return 10000;
        }];
    size_t count = 8192;
    uint64_t *identifiers = calloc(count, sizeof(uint64_t));
    XCTAssertNotNil(generator);
    XCTAssertTrue(identifiers != NULL);
    if (!generator || !identifiers) {
        free(identifiers);
        return;
    }
    dispatch_apply(count, dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^(size_t index){
        identifiers[index] = generator.nextID().unsignedLongLongValue;
    });
    qsort(identifiers, count, sizeof(uint64_t), JobsSnowflakeCompareIDs);
    XCTAssertGreaterThan(identifiers[0], 0ULL);
    for (size_t index = 1; index < count; index++) {
        XCTAssertGreaterThan(identifiers[index], identifiers[index - 1]);
    }
    free(identifiers);
}
@end

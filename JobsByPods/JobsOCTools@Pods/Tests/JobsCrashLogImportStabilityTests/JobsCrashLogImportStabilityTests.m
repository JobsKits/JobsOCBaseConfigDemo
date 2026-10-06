//
//  JobsCrashLogImportStabilityTests.m
//  JobsOCTools
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsCrashLogImportStabilityTests.h"

@interface JobsOCCrashLogCenter (JobsCrashImportTesting)

-(BOOL)jobsImportSignalJournalAtPath:(NSString *)signalPath logPath:(NSString *)logPath;
-(BOOL)jobsWriteData:(NSData *)data toPath:(NSString *)path;

@end

@implementation JobsCrashLogImportStabilityTests

-(void)testFailedLogOpenPreservesSignalJournalThenSuccessfulImportClearsIt{
    NSString *directory = [NSTemporaryDirectory() stringByAppendingPathComponent:NSUUID.UUID.UUIDString];
    XCTAssertTrue([NSFileManager.defaultManager createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:nil]);
    NSString *journal = [directory stringByAppendingPathComponent:@"pending.signals"];
    JobsCrashSignalRecord records[] = {
        {JOBS_CRASH_SIGNAL_MAGIC, 1, SIGABRT, 41},
        {JOBS_CRASH_SIGNAL_MAGIC, 1, SIGSEGV, 42}
    };
    NSData *original = [NSData dataWithBytes:records length:sizeof(records)];
    XCTAssertTrue([original writeToFile:journal options:NSDataWritingAtomic error:nil]);
    JobsOCCrashLogCenter *center = [JobsOCCrashLogCenter new];
    XCTAssertFalse([center jobsImportSignalJournalAtPath:journal logPath:directory]);
    XCTAssertEqualObjects([NSData dataWithContentsOfFile:journal], original);
    NSString *log = [directory stringByAppendingPathComponent:@"import.log"];
    XCTAssertTrue([center jobsImportSignalJournalAtPath:journal logPath:log]);
    XCTAssertEqual([NSData dataWithContentsOfFile:journal].length, 0);
    NSString *text = [NSString stringWithContentsOfFile:log encoding:NSUTF8StringEncoding error:nil];
    XCTAssertTrue([text containsString:@"process=41"]);
    XCTAssertTrue([text containsString:@"process=42"]);
    [NSFileManager.defaultManager removeItemAtPath:directory error:nil];
}

-(void)testMalformedJournalPreservesEveryByteAndDoesNotImportValidPrefix{
    NSString *directory = [NSTemporaryDirectory() stringByAppendingPathComponent:NSUUID.UUID.UUIDString];
    XCTAssertTrue([NSFileManager.defaultManager createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:nil]);
    NSString *journal = [directory stringByAppendingPathComponent:@"pending.signals"];
    NSString *log = [directory stringByAppendingPathComponent:@"import.log"];
    JobsCrashSignalRecord records[] = {
        {JOBS_CRASH_SIGNAL_MAGIC, 1, SIGABRT, 41},
        {0, 1, SIGSEGV, 42}
    };
    NSData *original = [NSData dataWithBytes:records length:sizeof(records)];
    XCTAssertTrue([original writeToFile:journal options:NSDataWritingAtomic error:nil]);
    JobsOCCrashLogCenter *center = [JobsOCCrashLogCenter new];
    XCTAssertFalse([center jobsImportSignalJournalAtPath:journal logPath:log]);
    XCTAssertEqualObjects([NSData dataWithContentsOfFile:journal], original);
    XCTAssertFalse([NSFileManager.defaultManager fileExistsAtPath:log]);
    [NSFileManager.defaultManager removeItemAtPath:directory error:nil];
}

-(void)testImportFromOwnIOQueueDoesNotDeadlock{
    NSString *directory = [NSTemporaryDirectory() stringByAppendingPathComponent:NSUUID.UUID.UUIDString];
    XCTAssertTrue([NSFileManager.defaultManager createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:nil]);
    NSString *journal = [directory stringByAppendingPathComponent:@"pending.signals"];
    NSString *log = [directory stringByAppendingPathComponent:@"import.log"];
    JobsCrashSignalRecord record = {JOBS_CRASH_SIGNAL_MAGIC, 1, SIGABRT, 43};
    XCTAssertTrue([[NSData dataWithBytes:&record length:sizeof(record)] writeToFile:journal options:NSDataWritingAtomic error:nil]);
    JobsOCCrashLogCenter *center = [JobsOCCrashLogCenter new];
    dispatch_queue_t queue = [center valueForKey:@"ioQueue"];
    XCTestExpectation *completed = [self expectationWithDescription:@"reentrant import"];
    dispatch_async(queue, ^{
        XCTAssertTrue([center jobsImportSignalJournalAtPath:journal logPath:log]);
        [completed fulfill];
    });
    [self waitForExpectations:@[completed] timeout:3];
    XCTAssertEqual([NSData dataWithContentsOfFile:journal].length, 0);
    [NSFileManager.defaultManager removeItemAtPath:directory error:nil];
}

@end

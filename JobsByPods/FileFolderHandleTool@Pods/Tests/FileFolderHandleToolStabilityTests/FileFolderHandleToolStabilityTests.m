//
//  FileFolderHandleToolStabilityTests.m
//  FileFolderHandleTool
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "FileFolderHandleToolStabilityTests.h"

// 用途：实现自动化测试；验证首次创建、禁止覆盖、原子替换、并发写入和无权限目录的文件保护。
// 运行：在 Xcode 的 Pods 工程 FileFolderHandleTool-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@implementation FileFolderHandleToolStabilityTests

-(void)testFirstCreateNoOverwriteAtomicReplaceAndDirectoryConflict{
    NSString *root = [NSTemporaryDirectory() stringByAppendingPathComponent:NSUUID.UUID.UUIDString];
    NSString *path = [root stringByAppendingPathComponent:@"nested/file"];
    NSData *first = [@"first" dataUsingEncoding:NSUTF8StringEncoding];
    NSData *second = [@"second" dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSString *overwriteNew = [root stringByAppendingPathComponent:@"overwrite-new/file"];
    XCTAssertFalse([NSFileManager.defaultManager fileExistsAtPath:overwriteNew]);
    XCTAssertTrue([FileFolderHandleTool createFileWithFolderAtPath:overwriteNew contentsData:first overwrite:YES error:&error]);
    XCTAssertNil(error);
    XCTAssertEqualObjects([NSData dataWithContentsOfFile:overwriteNew], first);
    XCTAssertTrue([FileFolderHandleTool createFileWithFolderAtPath:path contentsData:first overwrite:NO error:&error]);
    XCTAssertEqualObjects([NSData dataWithContentsOfFile:path], first);
    XCTAssertTrue([FileFolderHandleTool createFileWithFolderAtPath:path contentsData:second overwrite:NO error:&error]);
    XCTAssertEqualObjects([NSData dataWithContentsOfFile:path], first);
    XCTAssertTrue([FileFolderHandleTool createFileWithFolderAtPath:path contentsData:second overwrite:YES error:&error]);
    XCTAssertEqualObjects([NSData dataWithContentsOfFile:path], second);
    XCTAssertFalse([FileFolderHandleTool createFileWithFolderAtPath:[path stringByAppendingPathComponent:@"child"] contentsData:first overwrite:YES error:&error]);
    XCTAssertNotNil(error);
    XCTAssertEqualObjects([NSData dataWithContentsOfFile:path], second);
    [NSFileManager.defaultManager removeItemAtPath:root error:nil];
}

-(void)testConcurrentExclusiveCreateAlwaysPreservesOneWholePayload{
    NSString *root = [NSTemporaryDirectory() stringByAppendingPathComponent:NSUUID.UUID.UUIDString];
    NSString *path = [root stringByAppendingPathComponent:@"shared"];
    NSMutableArray<NSData *> *candidates = [NSMutableArray array];
    for (NSUInteger i = 0; i < 8; i++) {
        NSMutableData *data = [NSMutableData dataWithLength:4096];
        memset(data.mutableBytes, (int)i + 1, data.length);
        [candidates addObject:data];
    }
    NSMutableArray<NSError *> *failures = [NSMutableArray array];
    __block NSUInteger successes = 0;
    dispatch_apply(candidates.count, dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^(size_t index) {
        NSError *error = nil;
        BOOL result = [FileFolderHandleTool createFileWithFolderAtPath:path contentsData:candidates[index] overwrite:NO error:&error];
        @synchronized (failures) {
            if (result) {
                successes += 1;
            } else {
                XCTAssertNotNil(error);
                if (error) {
                    [failures addObject:error];
                }
            }
        }
    });
    XCTAssertGreaterThan(successes, 0);
    XCTAssertEqual(successes + failures.count, candidates.count);
    NSData *written = [NSData dataWithContentsOfFile:path];
    XCTAssertTrue([candidates containsObject:written]);
    XCTAssertEqual(written.length, 4096);
    [NSFileManager.defaultManager removeItemAtPath:root error:nil];
}

-(void)testUnwritableParentReturnsErrorWithoutCreatingFile{
    NSString *root = [NSTemporaryDirectory() stringByAppendingPathComponent:NSUUID.UUID.UUIDString];
    NSString *path = [root stringByAppendingPathComponent:@"forbidden"];
    NSError *error = nil;
    XCTAssertTrue([NSFileManager.defaultManager createDirectoryAtPath:root withIntermediateDirectories:YES attributes:nil error:&error]);
    XCTAssertTrue([NSFileManager.defaultManager setAttributes:@{NSFilePosixPermissions: @0500} ofItemAtPath:root error:&error]);
    @try {
        error = nil;
        XCTAssertFalse([FileFolderHandleTool createFileWithFolderAtPath:path contentsData:NSData.data overwrite:NO error:&error]);
        XCTAssertNotNil(error);
        XCTAssertFalse([NSFileManager.defaultManager fileExistsAtPath:path]);
    } @finally {
        [NSFileManager.defaultManager setAttributes:@{NSFilePosixPermissions: @0700} ofItemAtPath:root error:nil];
        [NSFileManager.defaultManager removeItemAtPath:root error:nil];
    }
}

@end

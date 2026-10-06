//
//  JobsOCSplashStabilityTests.m
//  JobsOCSplash
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsOCSplashStabilityTests.h"
#import "../JobsSplashTransferTaskFixture/JobsSplashTransferTaskFixture.h"

@interface JobsOCSplashMediaCache (JobsStabilityTesting)
-(NSURL *)persistDownloadedFile:(NSURL *)file forRemoteURL:(NSURL *)remote error:(NSError **)error;
-(void)handleVideoDownloadForRemoteURL:(NSURL *)remote fileURL:(NSURL *)file error:(NSError *)error;
-(jobsByURLBlock _Nonnull)trimCacheKeepingURL;
@end

@implementation JobsOCSplashStabilityTests

-(JobsSplashCacheFixture *)fixtureWithDirectory:(NSURL *)directory{
    JobsSplashCacheFixture *cache = [JobsSplashCacheFixture alloc];
    [cache setValue:NSFileManager.defaultManager forKey:@"fileManager"];
    [cache setValue:directory forKey:@"directoryURL"];
    [cache setValue:[NSMutableDictionary dictionary] forKey:@"videoTasks"];
    [cache setValue:[NSMutableDictionary dictionary] forKey:@"videoCompletions"];
    [cache setValue:[NSMutableDictionary dictionary] forKey:@"videoRetryAttempts"];
    [cache setValue:[NSMutableSet set] forKey:@"scheduledVideoRetries"];
    [cache setValue:dispatch_queue_create("com.jobs.splash.tests", DISPATCH_QUEUE_SERIAL) forKey:@"stateQueue"];
    [cache setValue:[NSMutableDictionary dictionary] forKey:@"imageTransfers"];
    return cache;
}

-(void)testAtomicReplacementAndEmptyFileDoesNotEraseCache{
    NSURL *directory = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:NSUUID.UUID.UUIDString] isDirectory:YES];
    [NSFileManager.defaultManager createDirectoryAtURL:directory withIntermediateDirectories:YES attributes:nil error:nil];
    JobsSplashCacheFixture *cache = [self fixtureWithDirectory:directory];
    NSURL *temporary = [directory URLByAppendingPathComponent:@"fixture.bin"];
    NSURL *remote = [NSURL URLWithString:@"https://fixture.invalid/video.mp4"];
    NSError *error = nil;
    [@"old" writeToURL:temporary atomically:YES encoding:NSUTF8StringEncoding error:nil];
    NSURL *destination = [cache persistDownloadedFile:temporary forRemoteURL:remote error:&error];
    XCTAssertNotNil(destination);
    [@"new" writeToURL:temporary atomically:YES encoding:NSUTF8StringEncoding error:nil];
    XCTAssertNotNil([cache persistDownloadedFile:temporary forRemoteURL:remote error:&error]);
    XCTAssertEqualObjects([NSString stringWithContentsOfURL:destination encoding:NSUTF8StringEncoding error:nil], @"new");
    [[NSData data] writeToURL:temporary atomically:YES];
    XCTAssertNil([cache persistDownloadedFile:temporary forRemoteURL:remote error:&error]);
    XCTAssertNotNil(error);
    XCTAssertEqualObjects([NSString stringWithContentsOfURL:destination encoding:NSUTF8StringEncoding error:nil], @"new");
    [NSFileManager.defaultManager setAttributes:@{NSFileModificationDate:[NSDate dateWithTimeIntervalSinceNow:-8 * 24 * 60 * 60]} ofItemAtPath:destination.path error:nil];
    XCTAssertNil(cache.cachedFileURLForRemoteURL(remote));
    [NSFileManager.defaultManager removeItemAtURL:directory error:nil];
}

-(void)testRetryBudgetTerminatesAndCompletesOnceWithoutNetwork{
    JobsSplashCacheFixture *cache = [self fixtureWithDirectory:nil];
    NSURL *remote = [NSURL URLWithString:@"https://fixture.invalid/video.mp4"];
    NSString *key = remote.absoluteString;
    NSMutableDictionary *attempts = [cache valueForKey:@"videoRetryAttempts"];
    attempts[key] = @4;
    XCTestExpectation *finished = [self expectationWithDescription:@"terminal failure"];
    NSMutableDictionary *completions = [cache valueForKey:@"videoCompletions"];
    completions[key] = [NSMutableArray arrayWithObject:[^(NSURL *URL) {
        XCTAssertNil(URL);
        [finished fulfill];
    } copy]];
    [cache handleVideoDownloadForRemoteURL:remote fileURL:nil error:[NSError errorWithDomain:@"JobsOCSplash.VideoPreload" code:500 userInfo:nil]];
    XCTAssertNil(attempts[key]);
    XCTAssertNil(completions[key]);
    XCTAssertEqual([[cache valueForKey:@"scheduledVideoRetries"] count], 0);
    [self waitForExpectations:@[finished] timeout:1];
}

-(void)testGIFDecoderRejectsInvalidAndOversizedEncodedContent{
    XCTAssertNil([JobsOCSplashGIFDecoder imageWithData:[@"not-an-image" dataUsingEncoding:NSUTF8StringEncoding]]);
    XCTAssertNil([JobsOCSplashGIFDecoder imageWithData:[NSMutableData dataWithLength:17 * 1024 * 1024]]);
    UIGraphicsImageRenderer *renderer = [[UIGraphicsImageRenderer alloc] initWithSize:CGSizeMake(1, 1)];
    UIImage *image = [renderer imageWithActions:^(UIGraphicsImageRendererContext *context) {
        [UIColor.redColor setFill];
        [context fillRect:CGRectMake(0, 0, 1, 1)];
    }];
    XCTAssertNotNil([JobsOCSplashGIFDecoder imageWithData:UIImagePNGRepresentation(image)]);
}

-(void)testSharedImageTransferHasIndependentCancellationAndIgnoresOldCompletion{
    JobsSplashCacheFixture *cache = [self fixtureWithDirectory:nil];
    dispatch_queue_t queue = [cache valueForKey:@"stateQueue"];
    NSURL *remote = [NSURL URLWithString:@"https://fixture.invalid/image.png"];
    XCTestExpectation *cancelledCallback = [self expectationWithDescription:@"cancelled subscriber stays silent"];
    cancelledCallback.inverted = YES;
    XCTestExpectation *survivingCallback = [self expectationWithDescription:@"surviving subscriber"];
    JobsOCSplashMediaDownloadToken *first = [cache downloadImage:remote completion:^(NSURL *URL, NSError *error) {
        [cancelledCallback fulfill];
    }];
    JobsOCSplashMediaDownloadToken *second = [cache downloadImage:remote completion:^(NSURL *URL, NSError *error) {
        XCTAssertNotNil(URL);
        [survivingCallback fulfill];
    }];
    dispatch_sync(queue, ^{});
    XCTAssertEqual(cache.rawDownloadCount, 1);
    JobsSplashTransferTaskFixture *task = (JobsSplashTransferTaskFixture *)cache.transferTask;
    first.cancel();
    dispatch_sync(queue, ^{});
    XCTAssertEqual(task.cancellationCount, 0);
    cache.rawCompletion([NSURL fileURLWithPath:@"/fixture.png"], nil);
    [self waitForExpectations:@[survivingCallback, cancelledCallback] timeout:0.2];
    XCTAssertFalse(second.isCancelled);

    JobsOCSplashMediaDownloadToken *third = [cache downloadImage:remote completion:nil];
    dispatch_sync(queue, ^{});
    task = (JobsSplashTransferTaskFixture *)cache.transferTask;
    JobsOCSplashMediaCacheCompletion oldCompletion = cache.rawCompletion;
    third.cancel();
    third.cancel();
    dispatch_sync(queue, ^{});
    XCTAssertEqual(task.cancellationCount, 1);
    XCTestExpectation *last = [self expectationWithDescription:@"new transfer completion"];
    JobsOCSplashMediaDownloadToken *fourth = [cache downloadImage:remote completion:^(NSURL *URL, NSError *error) {
        XCTAssertEqual(error.code, 123);
        [last fulfill];
    }];
    dispatch_sync(queue, ^{});
    oldCompletion([NSURL fileURLWithPath:@"/old.png"], nil);
    dispatch_sync(queue, ^{});
    XCTAssertEqual([[cache valueForKey:@"imageTransfers"] count], 1);
    cache.rawCompletion(nil, [NSError errorWithDomain:@"fixture" code:123 userInfo:nil]);
    [self waitForExpectations:@[last] timeout:1];
    XCTAssertFalse(fourth.isCancelled);
}

-(void)testCacheEvictsOldestFilesWithinLogicalByteLimit{
    NSURL *directory = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:NSUUID.UUID.UUIDString] isDirectory:YES];
    [NSFileManager.defaultManager createDirectoryAtURL:directory withIntermediateDirectories:YES attributes:nil error:nil];
    JobsSplashCacheFixture *cache = [self fixtureWithDirectory:directory];
    NSMutableArray<NSURL *> *files = [NSMutableArray array];
    for (NSUInteger index = 0; index < 3; index++) {
        NSURL *URL = [directory URLByAppendingPathComponent:[NSString stringWithFormat:@"%lu.bin", (unsigned long)index]];
        [[NSData data] writeToURL:URL atomically:YES];
        NSFileHandle *handle = [NSFileHandle fileHandleForWritingAtPath:URL.path];
        [handle truncateFileAtOffset:100 * 1024 * 1024];
        [handle closeFile];
        [NSFileManager.defaultManager setAttributes:@{NSFileModificationDate:[NSDate dateWithTimeIntervalSinceNow:-1000 + index]} ofItemAtPath:URL.path error:nil];
        [files addObject:URL];
    }
    cache.trimCacheKeepingURL(files.lastObject);
    XCTAssertFalse([NSFileManager.defaultManager fileExistsAtPath:files.firstObject.path]);
    XCTAssertTrue([NSFileManager.defaultManager fileExistsAtPath:files.lastObject.path]);
    XCTAssertEqual([NSFileManager.defaultManager contentsOfDirectoryAtPath:directory.path error:nil].count, 2);
    [NSFileManager.defaultManager removeItemAtURL:directory error:nil];
}

@end

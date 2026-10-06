//
//  JobsOCAudioRecorderStabilityTests.m
//  JobsOCAudioRecorder
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsOCAudioRecorderStabilityTests.h"
#import "../JobsAudioRecorderInitializationFixture/JobsAudioRecorderInitializationFixture.h"
#import "../JobsAudioPlayerInitializationFixture/JobsAudioPlayerInitializationFixture.h"

@implementation JobsOCAudioRecorderStabilityTests

-(void)testLateRecorderCallbackDoesNotClearNewRecorderAndStartRejectsBusySession{
    JobsOCAudioRecorderEngine *engine = [JobsOCAudioRecorderEngine alloc];
    AVAudioRecorder *current = (AVAudioRecorder *)[NSObject new];
    AVAudioRecorder *old = (AVAudioRecorder *)[NSObject new];
    [engine setValue:current forKey:@"recorder"];
    NSError *error = nil;
    XCTAssertFalse([engine startWithMode:JobsOCAudioRecordingModeShort maximumDuration:1 error:&error]);
    XCTAssertNotNil(error);
    [engine audioRecorderDidFinishRecording:old successfully:YES];
    XCTAssertEqual([engine valueForKey:@"recorder"], current);
    [engine setValue:nil forKey:@"recorder"];
}

-(void)testNilRecorderInitializationPropagatesErrorAndCleansPartialFileWithoutHardware{
    JobsAudioRecorderInitializationFixture *engine = [JobsAudioRecorderInitializationFixture new];
    engine.fixtureSession = [JobsAudioSessionFixture new];
    engine.fixtureURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:NSUUID.UUID.UUIDString]];
    NSError *error = nil;
    XCTAssertFalse([engine startWithMode:JobsOCAudioRecordingModeShort maximumDuration:1 error:&error]);
    XCTAssertEqual(error.code, 99);
    XCTAssertEqual(engine.fixtureSession.deactivations, 1);
    XCTAssertNil([engine valueForKey:@"recorder"]);
    XCTAssertNil([engine valueForKey:@"currentURL"]);
    XCTAssertTrue(engine.partialFileCreated);
    XCTAssertFalse([NSFileManager.defaultManager fileExistsAtPath:engine.fixtureURL.path]);
}

-(void)testNilPlayerInitializationPropagatesErrorAndDeactivatesOnlyFixtureSession{
    JobsAudioPlayerInitializationFixture *engine = [JobsAudioPlayerInitializationFixture new];
    engine.fixtureSession = [JobsAudioSessionFixture new];
    NSError *error = nil;
    XCTAssertFalse([engine toggleURL:[NSURL fileURLWithPath:@"/fixture.invalid.m4a"] error:&error]);
    XCTAssertEqual(error.code, 100);
    XCTAssertEqual(engine.fixtureSession.deactivations, 1);
    XCTAssertNil([engine valueForKey:@"player"]);
    XCTAssertNil(engine.playingURL);
}

-(void)testOldPlayerCompletionCannotStopCurrentPlayback{
    JobsOCAudioPlayerEngine *engine = [JobsOCAudioPlayerEngine new];
    AVAudioPlayer *current = (AVAudioPlayer *)[NSObject new];
    AVAudioPlayer *old = (AVAudioPlayer *)[NSObject new];
    [engine setValue:current forKey:@"player"];
    [(id<AVAudioPlayerDelegate>)engine audioPlayerDidFinishPlaying:old successfully:YES];
    XCTAssertEqual([engine valueForKey:@"player"], current);
    [engine setValue:nil forKey:@"player"];
}

@end

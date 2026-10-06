//
//  JobsAudioRecorderInitializationFixture.h
//  JobsOCAudioRecorder
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "../JobsAudioSessionFixture/JobsAudioSessionFixture.h"

@interface JobsAudioRecorderInitializationFixture : JobsOCAudioRecorderEngine
@property(nonatomic, strong)JobsAudioSessionFixture *fixtureSession;
@property(nonatomic, strong)NSURL *fixtureURL;
@property(nonatomic, assign)BOOL partialFileCreated;
@end

//
//  JobsAudioSessionFixture.h
//  JobsOCAudioRecorder
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <JobsOCAudioRecorder/JobsOCAudioRecorder.h>

@interface JobsAudioSessionFixture : NSObject
@property(nonatomic, assign)NSUInteger deactivations;
-(BOOL)setActive:(BOOL)active withOptions:(AVAudioSessionSetActiveOptions)options error:(NSError **)error;
@end

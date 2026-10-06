//
//  JobsAudioSessionFixture.m
//  JobsOCAudioRecorder
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsAudioSessionFixture.h"

@implementation JobsAudioSessionFixture
-(BOOL)setActive:(BOOL)active withOptions:(AVAudioSessionSetActiveOptions)options error:(NSError **)error{
    if (!active) self.deactivations += 1;
    return YES;
}
@end

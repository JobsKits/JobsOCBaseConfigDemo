//
//  JobsAudioPlayerInitializationFixture.m
//  JobsOCAudioRecorder
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsAudioPlayerInitializationFixture.h"

@implementation JobsAudioPlayerInitializationFixture
-(BOOL)activatePlaybackSession:(AVAudioSession **)session error:(NSError **)error{
    *session = (AVAudioSession *)self.fixtureSession;
    return YES;
}
-(AVAudioPlayer *)playerWithURL:(NSURL *)URL error:(NSError **)error{
    if (error) *error = [NSError errorWithDomain:@"JobsAudioFixture" code:100 userInfo:nil];
    return nil;
}
@end

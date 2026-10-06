//
//  JobsAudioRecorderInitializationFixture.m
//  JobsOCAudioRecorder
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsAudioRecorderInitializationFixture.h"

@implementation JobsAudioRecorderInitializationFixture
-(BOOL)activateRecordingSession:(AVAudioSession **)session error:(NSError **)error{
    *session = (AVAudioSession *)self.fixtureSession;
    return YES;
}
-(JobsRetNSURLByJobsOCAudioRecordingModeBlock _Nonnull)recordingURLForMode{
    @jobs_weakify(self)
    return ^NSURL *(JobsOCAudioRecordingMode mode) {
        @jobs_strongify(self)
        return self.fixtureURL;
    };
}
-(AVAudioRecorder *)recorderWithURL:(NSURL *)URL settings:(NSDictionary *)settings error:(NSError **)error{
    self.partialFileCreated = [@"partial file" writeToURL:URL
                                             atomically:YES
                                               encoding:NSUTF8StringEncoding
                                                  error:nil];
    if (error) *error = [NSError errorWithDomain:@"JobsAudioFixture" code:99 userInfo:nil];
    return nil;
}
@end

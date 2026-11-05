//
//  JobsAudioRecorderInitializationFixture.m
//  JobsOCAudioRecorder
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsAudioRecorderInitializationFixture.h"

// 用途：实现测试替身（fixture）；注入录音器初始化失败及残留文件，验证错误传递和部分文件清理。
// 运行：由 JobsOCAudioRecorder-Unit-Stability 测试用例创建，不单独运行；不进入主 App，也不代表真实设备或外网验收。

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

//
//  JobsAudioPlayerInitializationFixture.m
//  JobsOCAudioRecorder
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsAudioPlayerInitializationFixture.h"

// 用途：实现测试替身（fixture）；注入播放器初始化失败和测试音频会话，验证失败时的清理逻辑。
// 运行：由 JobsOCAudioRecorder-Unit-Stability 测试用例创建，不单独运行；不进入主 App，也不代表真实设备或外网验收。

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

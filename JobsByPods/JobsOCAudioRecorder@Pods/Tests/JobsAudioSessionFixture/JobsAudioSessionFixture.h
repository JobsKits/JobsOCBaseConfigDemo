//
//  JobsAudioSessionFixture.h
//  JobsOCAudioRecorder
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <JobsOCAudioRecorder/JobsOCAudioRecorder.h>

// 用途：声明测试替身（fixture）；记录音频会话停用次数，供录音和播放失败测试使用，避免操作真实音频会话。
// 运行：由 JobsOCAudioRecorder-Unit-Stability 测试用例创建，不单独运行；不进入主 App，也不代表真实设备或外网验收。

@interface JobsAudioSessionFixture : NSObject

@property(nonatomic, assign)NSUInteger deactivations;
-(BOOL)setActive:(BOOL)active withOptions:(AVAudioSessionSetActiveOptions)options error:(NSError **)error;

@end

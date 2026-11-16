//
//  JobsAudioPlayerInitializationFixture.h
//  JobsOCAudioRecorder
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "../JobsAudioSessionFixture/JobsAudioSessionFixture.h"

// 用途：声明测试替身（fixture）；注入播放器初始化失败和测试音频会话，验证失败时的清理逻辑。
// 运行：由 JobsOCAudioRecorder-Unit-Stability 测试用例创建，不单独运行；不进入主 App，也不代表真实设备或外网验收。

@interface JobsAudioPlayerInitializationFixture : JobsOCAudioPlayerEngine

@property(nonatomic, strong)JobsAudioSessionFixture *fixtureSession;

@end

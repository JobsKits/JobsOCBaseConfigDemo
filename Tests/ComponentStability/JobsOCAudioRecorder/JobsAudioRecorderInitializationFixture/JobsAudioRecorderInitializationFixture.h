//
//  JobsAudioRecorderInitializationFixture.h
//  JobsOCAudioRecorder
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "../JobsAudioSessionFixture/JobsAudioSessionFixture.h"

// 用途：声明测试替身（fixture）；注入录音器初始化失败及残留文件，验证错误传递和部分文件清理。
// 运行：由 JobsOCAudioRecorder-Unit-Stability 测试用例创建，不单独运行；不进入主 App，也不代表真实设备或外网验收。

@interface JobsAudioRecorderInitializationFixture : JobsOCAudioRecorderEngine

@property(nonatomic, strong)JobsAudioSessionFixture *fixtureSession;
@property(nonatomic, strong)NSURL *fixtureURL;
@property(nonatomic, assign)BOOL partialFileCreated;

@end

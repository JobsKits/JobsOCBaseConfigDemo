//
//  JobsSplashTransferTaskFixture.m
//  JobsOCSplash
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsSplashTransferTaskFixture.h"

// 用途：实现测试替身（fixture）；记录取消次数，供开屏共享传输验证各订阅的取消行为。
// 运行：由 JobsOCSplash-Unit-Stability 测试用例创建，不单独运行；不进入主 App，也不代表真实设备或外网验收。

@implementation JobsSplashTransferTaskFixture

-(void)cancel{
    self.cancellationCount += 1;
}

@end

//
//  JobsAPIRequestConstraintFixture.h
//  JobsAPIs
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <JobsAPIs/JobsBaseApi.h>

// 用途：声明测试替身（fixture）；提供固定 GET 参数、超时和蜂窝限制，可切换标准请求与 raw 请求路径。
// 运行：由 JobsAPIs-Unit-Stability 测试用例创建，不单独运行；不进入主 App，也不代表真实设备或外网验收。

@interface JobsAPIRequestConstraintFixture : JobsBaseApi

@property(nonatomic, copy) NSString *fixturePath;
@property(nonatomic, assign) BOOL usesRawRequest;

@end

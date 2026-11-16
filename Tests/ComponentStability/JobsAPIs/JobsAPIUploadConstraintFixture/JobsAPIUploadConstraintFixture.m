//
//  JobsAPIUploadConstraintFixture.m
//  JobsAPIs
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsAPIUploadConstraintFixture.h"

// 用途：实现测试替身（fixture）；提供固定上传地址、超时和蜂窝限制，供真实 multipart 上传链路断言。
// 运行：由 JobsAPIs-Unit-Stability 测试用例创建，不单独运行；不进入主 App，也不代表真实设备或外网验收。

@implementation JobsAPIUploadConstraintFixture

-(NSString *)requestUrl{
    return @"https://jobs-stability.invalid/upload";
}

-(NSTimeInterval)requestTimeoutInterval{
    return 7.25;
}

-(BOOL)allowsCellularAccess{
    return NO;
}

@end

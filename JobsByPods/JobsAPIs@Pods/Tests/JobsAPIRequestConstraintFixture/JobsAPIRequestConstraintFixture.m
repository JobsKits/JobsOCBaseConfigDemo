//
//  JobsAPIRequestConstraintFixture.m
//  JobsAPIs
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsAPIRequestConstraintFixture.h"

// 用途：实现测试替身（fixture）；提供固定 GET 参数、超时和蜂窝限制，可切换标准请求与 raw 请求路径。
// 运行：由 JobsAPIs-Unit-Stability 测试用例创建，不单独运行；不进入主 App，也不代表真实设备或外网验收。

@implementation JobsAPIRequestConstraintFixture

-(NSString *)requestUrl{
    return [@"https://jobs-stability.invalid" stringByAppendingString:self.fixturePath ?: @"/get"];
}

-(YTKRequestMethod)requestMethod{
    return YTKRequestMethodGET;
}

-(NSTimeInterval)requestTimeoutInterval{
    return 7.25;
}

-(BOOL)allowsCellularAccess{
    return NO;
}

-(id)requestArgument{
    return @{@"unicode": @"空 格&+", @"integer": @42};
}

-(NSURLRequest *)buildCustomUrlRequest{
    if (!self.usesRawRequest) {
        return [super buildCustomUrlRequest];
    }
    return self.jobsMakeRequestByBlock(^(NSMutableURLRequest *request) {
        request.HTTPMethod = @"GET";
    });
}

@end

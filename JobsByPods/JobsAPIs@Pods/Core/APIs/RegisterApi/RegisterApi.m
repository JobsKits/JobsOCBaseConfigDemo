//
//  RegisterApi.m
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "RegisterApi.h"

@implementation RegisterApi
/// 请求的完整URL：
-(NSString *_Nonnull)requestUrl {
    return @"";
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}
/// 在链式请求中，下一个请求的参数来源于上一个请求的结果
-(NSString *_Nonnull)userId{
    return [[self.responseJSONObject objectForKey:@"userId"] stringValue] ? : @"".tr;
}

@end

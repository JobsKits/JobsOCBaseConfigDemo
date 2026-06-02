//
//  GetUserInfoApi.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "GetUserInfoApi.h"

@implementation GetUserInfoApi
/// 请求的完整URL：
-(NSString *)requestUrl{
    return This.BaseUrl.add(@"");
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

@end

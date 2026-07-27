//
//  GetCustomerContactApi.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "GetCustomerContactApi.h"

@implementation GetCustomerContactApi
/// 请求Api
-(NSString *)requestUrl{
    return This.BaseUrl.add(@"");
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

@end

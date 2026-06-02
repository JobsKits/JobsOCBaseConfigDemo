//
//  IP_api.m
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "IP_api.h"

@implementation IP_api
/// 请求的完整URL：提供丰富的地理位置信息@GET
/// http://ip-api.com/json/
-(NSString *)requestUrl{
    return [@"http://ip-api.com/json/" stringByAppendingString:self.urlParameters ?: @""];
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

@end

@implementation IPApiModel

@end

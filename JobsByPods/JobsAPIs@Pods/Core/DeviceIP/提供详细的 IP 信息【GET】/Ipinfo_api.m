//
//  Ipinfo_api.m
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "Ipinfo_api.h"

@implementation Ipinfo_api
/// 请求的完整URL：提供详细的IP信息@GET
/// https://ipinfo.io/json
-(NSString *)requestUrl{
    return [@"https://ipinfo.io/json" stringByAppendingString:self.urlParameters ?: @""];
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

@end

@implementation IpinfoModel

@end

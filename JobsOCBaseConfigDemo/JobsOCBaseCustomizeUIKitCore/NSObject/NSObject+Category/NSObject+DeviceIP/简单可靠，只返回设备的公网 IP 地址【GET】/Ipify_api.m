//
//  Ipify_api.m
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "Ipify_api.h"

@implementation Ipify_api
/// 请求的完整URL：简单可靠，只返回设备的公网IP地址@GET
/// https://api.ipify.org?format=json
-(NSString *)requestUrl{
    return [@"https://api.ipify.org?format=json" stringByAppendingString:self.urlParameters ?: @""];// YOUR_API_KEY
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

@end

@implementation IpifyModel

@end

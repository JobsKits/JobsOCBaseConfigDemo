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
    JobsRetStrByVoidBlock action = ((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Ipinfo_api.class, @selector(jobsRequestUrl)))(self, @selector(jobsRequestUrl));
    return action ? action() : nil;
}

-(JobsRetStrByVoidBlock _Nonnull)jobsRequestUrl{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return [@"https://ipinfo.io/json" stringByAppendingString:self.urlParameters ?: @""];
    };
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    JobsRetYTKRequestMethodByVoidBlock action = ((JobsRetYTKRequestMethodByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Ipinfo_api.class, @selector(jobsRequestMethod)))(self, @selector(jobsRequestMethod));
    return action ? action() : (YTKRequestMethod){0};
}

-(JobsRetYTKRequestMethodByVoidBlock _Nonnull)jobsRequestMethod{
    @jobs_weakify(self)
    return ^YTKRequestMethod{
        @jobs_strongify(self)
        if (!self) return (YTKRequestMethod){0};
        return YTKRequestMethodGET;
    };
}

@end

@implementation IpinfoModel

@end

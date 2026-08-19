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
    JobsRetStrByVoidBlock action = ((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GetCustomerContactApi.class, @selector(jobsRequestUrl)))(self, @selector(jobsRequestUrl));
    return action ? action() : nil;
}

-(JobsRetStrByVoidBlock _Nonnull)jobsRequestUrl{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return This.jobsBaseUrl().add(@"");
    };
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    JobsRetYTKRequestMethodByVoidBlock action = ((JobsRetYTKRequestMethodByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(GetCustomerContactApi.class, @selector(jobsRequestMethod)))(self, @selector(jobsRequestMethod));
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

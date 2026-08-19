//
//  JobsBaseApi.m
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsBaseApi.h"

#import "NSObject+Extra.h"

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN NSMutableURLRequest
@interface NSMutableURLRequest (JobsLocalPropertyDSLAutogen_22f0fb778a)
-(JobsRetNSMutableURLRequestByNSDataBlock _Nonnull)byHTTPBody;
-(JobsRetNSMutableURLRequestByNSStringBlock _Nonnull)byHTTPMethod;
-(void)setHTTPBody:(NSData * _Nullable)data;
-(void)setHTTPMethod:(NSString * _Nullable)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END NSMutableURLRequest

@implementation JobsBaseApi
#pragma mark —— 覆写 YTKBaseRequest 方法
-(__kindof NSURLRequest *)buildCustomUrlRequest{
    JobsRetURLRequestByVoidBlock action = ((JobsRetURLRequestByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsBaseApi.class, @selector(jobsBuildCustomUrlRequest)))(self, @selector(jobsBuildCustomUrlRequest));
    return action ? action() : nil;
}

-(JobsRetURLRequestByVoidBlock _Nonnull)jobsBuildCustomUrlRequest{
    @jobs_weakify(self)
    return ^__kindof NSURLRequest *{
        @jobs_strongify(self)
        if (!self) return nil;
        @jobs_weakify(self)
        return self.jobsMakeRequestByBlock(^(__kindof NSMutableURLRequest * _Nullable request) {
            @jobs_strongify(self)
            /// 请求头
            for (NSString *key in self.requestHeaderFieldValueDictionary) {
                [request setValue:self.requestHeaderFieldValueDictionary[key] forHTTPHeaderField:key];
            }
            /// 请求方法
            request.byHTTPMethod(httpMethod(self.requestMethod));
            /// 请求的（Body）参数
            if(self.requestMethod != YTKRequestMethodGET){
                request.byHTTPBody(self.dataByJSONObject(self.parameters));
            }self.printRequestMessage(request);// 打印URLRequest
        });
    };
}
#pragma mark —— （本类）父类实现的
/// Body 参数
-(id _Nullable)requestArgument{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsBaseApi.class, @selector(jobsRequestArgument)))(self, @selector(jobsRequestArgument));
    return action ? action() : nil;
}

-(JobsRetIDByVoidBlock _Nonnull)jobsRequestArgument{
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.parameters;
    };
}
/// 限定接收到的字段类型，如果不匹配则外层block走Failure
-(id)jsonValidator{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsBaseApi.class, @selector(jobsJsonValidator)))(self, @selector(jobsJsonValidator));
    return action ? action() : nil;
}

-(JobsRetIDByVoidBlock _Nonnull)jobsJsonValidator{
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        return nil;
    };
}

-(NSInteger)cacheTimeInSeconds{
    JobsRetNSIntegerByVoidBlock action = ((JobsRetNSIntegerByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsBaseApi.class, @selector(jobsCacheTimeInSeconds)))(self, @selector(jobsCacheTimeInSeconds));
    return action ? action() : (NSInteger){0};
}

-(JobsRetNSIntegerByVoidBlock _Nonnull)jobsCacheTimeInSeconds{
    @jobs_weakify(self)
    return ^NSInteger{
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        return 60 * 3;
    };
}
#pragma mark —— 以下需要在很具体子类进行实现的
/// URL
-(NSString *)requestUrl{
    JobsRetStrByVoidBlock action = ((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsBaseApi.class, @selector(jobsRequestUrl)))(self, @selector(jobsRequestUrl));
    return action ? action() : nil;
}

-(JobsRetStrByVoidBlock _Nonnull)jobsRequestUrl{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"";
    };
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    JobsRetYTKRequestMethodByVoidBlock action = ((JobsRetYTKRequestMethodByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsBaseApi.class, @selector(jobsRequestMethod)))(self, @selector(jobsRequestMethod));
    return action ? action() : (YTKRequestMethod){0};
}

-(JobsRetYTKRequestMethodByVoidBlock _Nonnull)jobsRequestMethod{
    @jobs_weakify(self)
    return ^YTKRequestMethod{
        @jobs_strongify(self)
        if (!self) return (YTKRequestMethod){0};
        return YTKRequestMethodPOST;
    };
}

@end

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN NSMutableURLRequest
@implementation NSMutableURLRequest (JobsLocalPropertyDSLAutogen_22f0fb778a)
-(JobsRetNSMutableURLRequestByNSDataBlock _Nonnull)byHTTPBody{
    @jobs_weakify(self)
    return ^__kindof NSMutableURLRequest * _Nullable(NSData * _Nullable data){
        @jobs_strongify(self)
        [self setHTTPBody:data];
        return self;
    };
}

-(JobsRetNSMutableURLRequestByNSStringBlock _Nonnull)byHTTPMethod{
    @jobs_weakify(self)
    return ^__kindof NSMutableURLRequest * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setHTTPMethod:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END NSMutableURLRequest

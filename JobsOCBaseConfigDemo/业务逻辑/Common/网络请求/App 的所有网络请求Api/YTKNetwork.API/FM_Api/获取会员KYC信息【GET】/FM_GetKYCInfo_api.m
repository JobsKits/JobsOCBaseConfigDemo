//
//  FM_GetKYCInfo_api.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "FM_GetKYCInfo_api.h"

@implementation FM_GetKYCInfo_api
/// 请求的完整URL：获取会员KYC信息【GET】
-(NSString *)requestUrl{
    JobsRetStrByVoidBlock action = ((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(FM_GetKYCInfo_api.class, @selector(jobsRequestUrl)))(self, @selector(jobsRequestUrl));
    return action ? action() : nil;
}

-(JobsRetStrByVoidBlock _Nonnull)jobsRequestUrl{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return This.jobsBaseUrl()
            .add(self.jobs_get_kyc_info().url)
            .add(self.urlParameters);
    };
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    JobsRetYTKRequestMethodByVoidBlock action = ((JobsRetYTKRequestMethodByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(FM_GetKYCInfo_api.class, @selector(jobsRequestMethod)))(self, @selector(jobsRequestMethod));
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
/// 在链式请求中，下一个请求的参数来源于上一个请求的结果
-(JobsRetStrByVoidBlock _Nonnull)kyc{
    @jobs_weakify(self)
    return ^NSString *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        JobsResponseModel *responseModel = JobsResponseModel.byData(self.responseObject);
    //    KYVModel *data = KYVModel.byData(responseModel.data);
    //    return toStringByNSInteger(data.kycStatus);
        return @"";
    };
}

@end

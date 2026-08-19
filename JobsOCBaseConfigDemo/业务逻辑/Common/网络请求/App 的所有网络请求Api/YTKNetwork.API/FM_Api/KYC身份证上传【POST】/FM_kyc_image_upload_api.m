//
//  FM_kyc_image_upload_api.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "FM_kyc_image_upload_api.h"

@implementation FM_kyc_image_upload_api
/// KYC身份证上传@POST
-(NSString *)requestUrl{
    JobsRetStrByVoidBlock action = ((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(FM_kyc_image_upload_api.class, @selector(jobsRequestUrl)))(self, @selector(jobsRequestUrl));
    return action ? action() : nil;
}

-(JobsRetStrByVoidBlock _Nonnull)jobsRequestUrl{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return This.jobsBaseUrl()
            .add(self.jobs_post_kyc_image_upload().url)
            .add(self.urlParameters);
    };
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    JobsRetYTKRequestMethodByVoidBlock action = ((JobsRetYTKRequestMethodByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(FM_kyc_image_upload_api.class, @selector(jobsRequestMethod)))(self, @selector(jobsRequestMethod));
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

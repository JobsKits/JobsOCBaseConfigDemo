//
//  FM_promotion_advertise_api.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "FM_promotion_advertise_api.h"

@implementation FM_promotion_advertise_api
/// 请求的完整URL：查询广告列表-支持游客：APP首页右下3Banner【GET】
-(NSString *)requestUrl{
    JobsRetStrByVoidBlock action = ((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(FM_promotion_advertise_api.class, @selector(jobsRequestUrl)))(self, @selector(jobsRequestUrl));
    return action ? action() : nil;
}

-(JobsRetStrByVoidBlock _Nonnull)jobsRequestUrl{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return This.jobsBaseUrl().add(self.jobs_get_promotion_advertise_infoP_list_appIndex().url);
    };
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    JobsRetYTKRequestMethodByVoidBlock action = ((JobsRetYTKRequestMethodByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(FM_promotion_advertise_api.class, @selector(jobsRequestMethod)))(self, @selector(jobsRequestMethod));
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

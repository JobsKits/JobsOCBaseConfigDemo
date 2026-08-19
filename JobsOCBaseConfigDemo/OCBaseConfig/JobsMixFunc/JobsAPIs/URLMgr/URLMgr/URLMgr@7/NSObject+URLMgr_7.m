//
//  NSObject+URLMgr_7.m
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+URLMgr_7.h"

#import "NSObject+Extra.h"

@implementation NSObject (URLMgr_7)
#pragma mark —— 其他
/// 获取客服
-(URLManagerModel *_Nullable)post_operation_advice_config_serviceLines{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_operation_advice_config_serviceLines)))(self, @selector(jobs_post_operation_advice_config_serviceLines)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_operation_advice_config_serviceLines{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/operation/advice/config/serviceLines");
    };
}
/// kyc 身份证上传
-(URLManagerModel *_Nullable)post_kyc_image_upload{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_kyc_image_upload)))(self, @selector(jobs_post_kyc_image_upload)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_kyc_image_upload{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/file/kyc/image/upload");
    };
}

@end

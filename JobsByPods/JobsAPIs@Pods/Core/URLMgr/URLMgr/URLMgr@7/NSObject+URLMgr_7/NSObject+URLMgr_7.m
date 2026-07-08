//
//  NSObject+URLMgr_7.m
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+URLMgr_7.h"
#import <JobsAPIs/NSObject+Extra.h>

@implementation NSObject (URLMgr_7)
#pragma mark —— 其他
/// 获取客服
-(URLManagerModel *)post_operation_advice_config_serviceLines{
    return JobsURL(@"/api/operation/advice/config/serviceLines");
}
/// kyc 身份证上传
-(URLManagerModel *)post_kyc_image_upload{
    return JobsURL(@"/api/file/kyc/image/upload");
}

@end

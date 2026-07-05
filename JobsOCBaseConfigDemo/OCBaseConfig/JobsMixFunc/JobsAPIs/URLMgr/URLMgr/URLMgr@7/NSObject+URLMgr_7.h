//
//  NSObject+URLMgr_7.h
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_URLMGR_7_DC73C95761
#define JOBS_HEADER_GUARD_NSOBJECT_URLMGR_7_DC73C95761

#import <Foundation/Foundation.h>
#import "URLMgr.h"

#import "JobsModelDSL.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (URLMgr_7)
#pragma mark —— 其他
/// 获取客服
-(URLManagerModel *)post_operation_advice_config_serviceLines;
/// kyc 身份证上传
-(URLManagerModel *)post_kyc_image_upload;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_URLMGR_7_DC73C95761 */

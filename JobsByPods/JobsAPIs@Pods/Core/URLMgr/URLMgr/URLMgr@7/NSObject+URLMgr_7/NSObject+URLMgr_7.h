//
//  NSObject+URLMgr_7.h
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_URLMGR_7_DC73C95761
#define JOBS_HEADER_GUARD_NSOBJECT_URLMGR_7_DC73C95761

#import <Foundation/Foundation.h>
#import <JobsAPIs/URLMgr.h>

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (URLMgr_7)
#pragma mark —— 其他
/// 获取客服
-(URLManagerModel *_Nullable)post_operation_advice_config_serviceLines;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_operation_advice_config_serviceLines;
/// kyc 身份证上传
-(URLManagerModel *_Nullable)post_kyc_image_upload;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_kyc_image_upload;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_URLMGR_7_DC73C95761 */

//
//  NSObject+Extra.h
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_EXTRA_2B0DA31167
#define JOBS_HEADER_GUARD_NSOBJECT_EXTRA_2B0DA31167

#pragma once

#import <Foundation/Foundation.h>
#import <JobsLinkageMenuView/NSString+Extra.h>
#import <JobsLinkageMenuView/UIImpactFeedbackGenerator+Extra.h>
#import <JobsLinkageMenuView/NSString+Sys.h>

#if __has_include(<JobsStringUtils/JobsStringUtilsHeader.h>)
#import <JobsStringUtils/JobsStringUtilsHeader.h>
#else
#import "JobsStringUtilsHeader.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (JobsLinkageMenuViewExtra)
/// 获取本地普通图像
Prop_strong(readonly,nullable)UIImage *img;    // -(nullable UIImage *)img;
-(JobsRetImageByStrBlock _Nonnull)imageByDataURL;
/// 震动特效反馈
+(jobsByViewBlock _Nonnull)feedbackGenerator;
-(JobsRetIDByDataBlock _Nonnull)JSONkNilOptions;
-(JobsRetIDByDataBlock _Nonnull)JSONReadingMutableContainers;
-(JobsRetDataByDicBlock _Nonnull)JSONWritingPrettyPrinted;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_EXTRA_2B0DA31167 */

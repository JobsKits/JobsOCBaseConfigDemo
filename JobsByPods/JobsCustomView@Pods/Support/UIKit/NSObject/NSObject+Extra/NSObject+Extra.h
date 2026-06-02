//
//  NSObject+Extra.h
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_EXTRA_B7B50B66CA
#define JOBS_HEADER_GUARD_NSOBJECT_EXTRA_B7B50B66CA

#pragma once

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h> // 用于调用系统级音频能力。
#import <JobsCustomView/NSData+Extra.h>
#import <JobsCustomView/NSString+Extra.h>
#import <JobsCustomView/UIImpactFeedbackGenerator+Extra.h>

#if __has_include(<JobsStringUtils/JobsStringUtils.h>)
#import <JobsStringUtils/JobsStringUtils.h>
#else
#import "JobsStringUtils.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Extra)
/// 获取本地普通图像
Prop_strong(readonly,nullable)UIImage *img;    // -(nullable UIImage *)img;
/// 震动特效反馈
+(jobsByViewBlock _Nonnull)feedbackGenerator;
-(JobsRetImageByStrBlock _Nonnull)imageByDataURL;
/// JSON对象转NSData
-(JobsRetDataByDicBlock _Nonnull)JSONWritingPrettyPrinted;
-(JobsRetIDByDataBlock _Nonnull)JSONReadingMutableContainers;
-(JobsRetIDByDataBlock _Nonnull)JSONkNilOptions;
-(JobsRetDataByStrBlock _Nonnull)initByContentsOfFile;
/// KVC 的二次封装
-(jobsByKey_ValueBlock _Nonnull)jobsKVC;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_EXTRA_B7B50B66CA */

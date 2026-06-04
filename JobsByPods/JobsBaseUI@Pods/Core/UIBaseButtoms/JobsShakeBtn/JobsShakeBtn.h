//
//  JobsShakeBtn.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSSHAKEBTN_FA305CA67E
#define JOBS_HEADER_GUARD_JOBSSHAKEBTN_FA305CA67E

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsOCRuntimeKits/JobsOCRuntimeKits.h>)
#import <JobsOCRuntimeKits/JobsOCRuntimeKits.h>
#else
#import "JobsOCRuntimeKits.h"
#endif

#if __has_include(<JobsLoadingImage/JobsLoadingImage.h>)
#import <JobsLoadingImage/JobsLoadingImage.h>
#else
#import "JobsLoadingImage.h"
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

/// hidden 的 权限优先级 > alpha
NS_ASSUME_NONNULL_BEGIN
/// 高仿iOS长按删除+抖动
@interface JobsShakeBtn : UIButton

Prop_assign(getter=isShaking)BOOL shaking;// 是否抖动
Prop_strong()UIImageView *iconBtn;// 右上角的按钮

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSSHAKEBTN_FA305CA67E */

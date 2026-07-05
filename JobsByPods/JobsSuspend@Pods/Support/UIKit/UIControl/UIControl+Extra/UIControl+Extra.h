//
//  UIControl+Extra.h
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UICONTROL_EXTRA_AEDC046A7E
#define JOBS_HEADER_GUARD_UICONTROL_EXTRA_AEDC046A7E

#pragma once

#import <UIKit/UIKit.h>

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

@interface UIControl (Extra)

-(instancetype)jobs_onChange:(jobsByCtrlBlock _Nonnull)block;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UICONTROL_EXTRA_AEDC046A7E */

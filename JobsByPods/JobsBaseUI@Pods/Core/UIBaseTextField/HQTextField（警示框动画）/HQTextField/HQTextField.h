//
//  HQTextField.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_HQTEXTFIELD_D8087C6D6C
#define JOBS_HEADER_GUARD_HQTEXTFIELD_D8087C6D6C

#import <UIKit/UIKit.h>
#import <JobsBaseUI/CJTextField.h>

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface HQTextField : CJTextField
/// 显示警示框
-(void)showWarn;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_HQTEXTFIELD_D8087C6D6C */

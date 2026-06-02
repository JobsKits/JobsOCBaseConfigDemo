//
//  UIView+Chain.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_CHAIN_8F207088CF
#define JOBS_HEADER_GUARD_UIVIEW_CHAIN_8F207088CF

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#if __has_include(<JobsOCRuntimeKits/JobsOCRuntimeKits.h>)
#import <JobsOCRuntimeKits/JobsOCRuntimeKits.h>
#else
#import "JobsOCRuntimeKits.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/**
 * iOS 子视图超出父视图不响应解决办法
 * 使用的时候将需要作用的View的ableRespose设置为YES即可
*/
@interface UIView (Chain)

Prop_assign()BOOL ableRespose;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_UIVIEW_CHAIN_8F207088CF */

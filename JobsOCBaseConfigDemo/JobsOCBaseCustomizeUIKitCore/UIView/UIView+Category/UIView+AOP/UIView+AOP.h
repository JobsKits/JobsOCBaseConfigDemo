//
//  UIView+AOP.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_AOP_F2F015B329
#define JOBS_HEADER_GUARD_UIVIEW_AOP_F2F015B329

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "JobsOCRuntimeKits.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN
/// 文本选择器的自定义颜色，因为是内部类，所以需要用runtime来修改
@interface UIView (AOP)

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_AOP_F2F015B329 */

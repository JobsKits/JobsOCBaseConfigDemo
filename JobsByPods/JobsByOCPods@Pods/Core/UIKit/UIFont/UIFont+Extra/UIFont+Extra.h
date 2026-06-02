//
//  UIFont+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIFONT_EXTRA_F8293062DC
#define JOBS_HEADER_GUARD_UIFONT_EXTRA_F8293062DC

#import <UIKit/UIKit.h>
#import <JobsByOCPods/NSMutableArray+Extra.h>
#import <JobsByOCPods/NSArray+Extra.h>

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

@interface UIFont (Extra)
/// 打印全员字体
+(JobsRetArrByVoidBlock _Nonnull)getAvailableFont;
/// 打印外援字体
+(JobsRetArrByVoidBlock _Nonnull)foreignAidFontName;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIFONT_EXTRA_F8293062DC */

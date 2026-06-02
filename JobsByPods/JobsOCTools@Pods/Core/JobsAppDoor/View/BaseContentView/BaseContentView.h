//
//  BaseContentView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASECONTENTVIEW_CA7C7BDB1E
#define JOBS_HEADER_GUARD_BASECONTENTVIEW_CA7C7BDB1E

#import <UIKit/UIKit.h>

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

static const CGFloat btnWidth = 64;

NS_ASSUME_NONNULL_BEGIN

@interface BaseContentView : BaseView

-(void)showContentViewWithOffsetY:(CGFloat)offsetY;
-(void)removeContentViewWithOffsetY:(CGFloat)offsetY;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_BASECONTENTVIEW_CA7C7BDB1E */

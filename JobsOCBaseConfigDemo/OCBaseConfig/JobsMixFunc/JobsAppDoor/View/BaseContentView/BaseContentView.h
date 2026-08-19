//
//  BaseContentView.h
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASECONTENTVIEW_CA7C7BDB1E
#define JOBS_HEADER_GUARD_BASECONTENTVIEW_CA7C7BDB1E

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import "JobsBaseUI.h"
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import "JobsByOCPods.h"
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import "JobsDefines.h"
#else
#import "JobsDefines.h"
#endif

static const CGFloat btnWidth = 64;

NS_ASSUME_NONNULL_BEGIN

@interface BaseContentView : BaseView

-(jobsByCGFloatBlock _Nonnull)showContentViewWithOffsetY;
-(jobsByCGFloatBlock _Nonnull)removeContentViewWithOffsetY;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN BaseContentView
-(JobsRetBaseContentViewByCGRectBlock _Nonnull)byInitialContentViewRect;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END BaseContentView
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_BASECONTENTVIEW_CA7C7BDB1E */

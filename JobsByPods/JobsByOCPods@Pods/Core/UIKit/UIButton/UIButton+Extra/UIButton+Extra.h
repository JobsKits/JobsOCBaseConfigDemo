//
//  UIButton+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIBUTTON_EXTRA_A29F7FE6D1
#define JOBS_HEADER_GUARD_UIBUTTON_EXTRA_A29F7FE6D1

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsByOCPods/UIButton+UI.h>
#import <JobsByOCPods/UILabel+Measure.h>
#import <JobsByOCPods/UIView+AutoSelfAdaptionSize.h>
#import <JobsByOCPods/UIView+Masonry.h>


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

@interface UIButton (Extra)

Prop_assign()CGFloat imageTitleSpace;

-(JobsRetBtnByNSUIntegerBlock _Nonnull)makeBtnTitleByShowingType;
-(JobsRetBtnByNSUIntegerBlock _Nonnull)makeBtnSubTitleByShowingType;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIBUTTON_EXTRA_A29F7FE6D1 */

//
//  UIButton+Extra.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIBUTTON_EXTRA_DDEAC04373
#define JOBS_HEADER_GUARD_UIBUTTON_EXTRA_DDEAC04373

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsNavBar/UIButton+UI.h>
#import <JobsNavBar/UILabel+Measure.h>
#import <JobsNavBar/UIView+AutoSelfAdaptionSize.h>
#import <JobsNavBar/UIView+Masonry.h>

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
#endif /* JOBS_HEADER_GUARD_UIBUTTON_EXTRA_DDEAC04373 */

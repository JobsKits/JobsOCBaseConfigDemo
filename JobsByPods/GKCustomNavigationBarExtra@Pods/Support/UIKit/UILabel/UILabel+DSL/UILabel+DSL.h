//
//  UILabel+DSL.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UILABEL_DSL_F98BD010B8
#define JOBS_HEADER_GUARD_UILABEL_DSL_F98BD010B8

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <GKCustomNavigationBarExtra/UIView+Extra.h>
#import <GKCustomNavigationBarExtra/UIView+Measure.h>
#import <GKCustomNavigationBarExtra/UIView+Masonry.h>

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

@interface UILabel (DSL)

Prop_assign()UILabelShowingType labelShowingType;

-(JobsRetLabelByCorBlock _Nonnull)byTextCor;
-(JobsRetLabelByFontBlock _Nonnull)byFont;
-(JobsRetLabelByTextAlignmentBlock _Nonnull)byTextAlignment;
-(JobsRetLabelByTextBlock _Nonnull)byText;
-(JobsRetLabelByAttributedStringBlock _Nonnull)byAttributedString;
/// 设置UILabel的显示样式 【在Masonry以后拿到了frame】
-(JobsRetLabelByNSUIntegerBlock _Nonnull)makeLabelByShowingType;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UILABEL_DSL_F98BD010B8 */

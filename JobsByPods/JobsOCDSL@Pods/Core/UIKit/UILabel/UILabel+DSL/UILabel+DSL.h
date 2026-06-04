//
//  UILabel+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_UILABEL_DSL_8E4C0C6C8B
#define JOBS_HEADER_GUARD_UILABEL_DSL_8E4C0C6C8B

#import <QuartzCore/QuartzCore.h>
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

@interface UILabel (DSL)

Prop_assign()UILabelShowingType labelShowingType;
Prop_assign()CGFloat value;
Prop_assign()CGFloat lastValue;
Prop_strong()CAShapeLayer *shapeLayer;
Prop_assign()JobsDirectionType transformLayerDirectionType;

- (__kindof NSMutableAttributedString *)makeAttributedStringBySelfText;
- (JobsRetLabelByNSIntegerBlock _Nonnull)transformLayer;
- (JobsRetLabelByImageBlock _Nonnull)bgImage;
- (JobsRetLabelByNSIntegerBlock _Nonnull)byNumberOfLines;
- (JobsRetLabelByNSUIntegerBlock _Nonnull)makeLabelByShowingType;

- (JobsRetLabelByAttributedStringBlock _Nonnull)byAttributedString;
- (JobsRetLabelByCorBlock _Nonnull)byBgColor;
- (JobsRetLabelByTextBlock _Nonnull)byText;
- (JobsRetLabelByTextBlock _Nonnull)byNextText;
- (JobsRetLabelByAttributedStringBlock _Nonnull)byNextAttributedText;
- (JobsRetLabelByAttributedStringBlock _Nonnull)byNextAttributedTextWithvalue;
- (JobsRetLabelByCorBlock _Nonnull)byTextCor;
- (JobsRetLabelByFontBlock _Nonnull)byFont;
- (JobsRetLabelByTextAlignmentBlock _Nonnull)byTextAlignment;

- (jobsByVoidBlock _Nonnull)labelAutoWidthByFont;
- (jobsByVoidBlock _Nonnull)labelAutoFontByWidth;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UILABEL_DSL_8E4C0C6C8B */

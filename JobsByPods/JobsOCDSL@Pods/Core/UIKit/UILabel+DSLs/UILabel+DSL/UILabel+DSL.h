//
//  UILabel+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_UILABEL_DSL_8E4C0C6C8B
#define JOBS_HEADER_GUARD_UILABEL_DSL_8E4C0C6C8B

#import <CoreText/CoreText.h>
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

-(__kindof NSMutableAttributedString *)makeAttributedStringBySelfText;
-(JobsRetLabelByNSIntegerBlock _Nonnull)transformLayer;
-(JobsRetLabelByImageBlock _Nonnull)bgImage;
-(JobsRetLabelByNSIntegerBlock _Nonnull)byNumberOfLines;
-(JobsRetLabelByNSUIntegerBlock _Nonnull)makeLabelByShowingType;

-(JobsRetLabelByAttributedStringBlock _Nonnull)byAttributedString;
-(JobsRetLabelByTextBlock _Nonnull)byText;
-(JobsRetLabelByTextBlock _Nonnull)byNextText;
-(JobsRetLabelByAttributedStringBlock _Nonnull)byNextAttributedText;
-(JobsRetLabelByAttributedStringBlock _Nonnull)byNextAttributedTextWithvalue;
-(JobsRetLabelByLabelBlock _Nonnull)byLabelBlock;
-(JobsRetLabelByCorBlock _Nonnull)byTextCor;
-(JobsRetLabelByFontBlock _Nonnull)byFont;
-(JobsRetLabelByTextAlignmentBlock _Nonnull)byTextAlignment;
-(JobsRetUILabelByVibrancyBlock _Nonnull)byPreferredVibrancy API_AVAILABLE(ios(17.0), tvos(17.0), visionos(1.0)) API_UNAVAILABLE(watchos);
-(JobsRetUILabelByLineBreakModeBlock _Nonnull)byLineBreakMode;
-(JobsRetUILabelByUIColorBlock _Nonnull)byHighlightedTextColor;
-(JobsRetUILabelByBOOLBlock _Nonnull)byHighlighted;
-(JobsRetUILabelByBOOLBlock _Nonnull)byEnabled;
-(JobsRetUILabelByBOOLBlock _Nonnull)byAdjustsFontSizeToFitWidth;
-(JobsRetUILabelByBOOLBlock _Nonnull)byAdjustsFontForContentSizeCategory;
-(JobsRetUILabelByBaselineAdjustmentBlock _Nonnull)byBaselineAdjustment;
-(JobsRetUILabelByCGFloatBlock _Nonnull)byMinimumScaleFactor API_AVAILABLE(ios(6.0));
-(JobsRetUILabelByBOOLBlock _Nonnull)byAllowsDefaultTighteningForTruncation API_AVAILABLE(ios(9.0));
-(JobsRetUILabelByLineBreakStrategyBlock _Nonnull)byLineBreakStrategy API_AVAILABLE(ios(14.0), tvos(14.0)) API_UNAVAILABLE(watchos);
-(JobsRetUILabelByCGFloatBlock _Nonnull)byPreferredMaxLayoutWidth API_AVAILABLE(ios(6.0));
-(JobsRetUILabelByBOOLBlock _Nonnull)byShowsExpansionTextWhenTruncated API_AVAILABLE(macCatalyst(15.0)) API_UNAVAILABLE(watchos);

-(JobsRetLabelByVoidBlock _Nonnull)labelAutoFontByWidth;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UILABEL_DSL_8E4C0C6C8B */

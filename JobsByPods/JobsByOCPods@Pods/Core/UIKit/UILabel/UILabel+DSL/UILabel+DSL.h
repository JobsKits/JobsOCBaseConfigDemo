//
//  UILabel+DSL.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UILABEL_DSL_D812D8EDF0
#define JOBS_HEADER_GUARD_UILABEL_DSL_D812D8EDF0

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <JobsByOCPods/UIView+Masonry.h>
#import <JobsByOCPods/UIView+AutoSelfAdaptionSize.h>
#import <JobsByOCPods/UIBezierPath+Extra.h>
#import <JobsByOCPods/CALayer+Extra.h>
#import <JobsByOCPods/NSObject+Extra.h>
#import <JobsByOCPods/NSString+CALayer.h>

#if __has_include(<JobsRichTextUtils/JobsRichTextUtils.h>)
#import <JobsRichTextUtils/JobsRichTextUtils.h>
#else
#import "JobsRichTextUtils.h"
#endif

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
/// for JobsAnimationLabel
Prop_assign()CGFloat value;
Prop_assign()CGFloat lastValue;
Prop_strong()CAShapeLayer *shapeLayer;
Prop_assign()JobsDirectionType transformLayerDirectionType;
#pragma mark —— 一些公共方法
/// 将label.text + label.textColor + label.font;包装成富文本
-(__kindof NSMutableAttributedString *)makeAttributedStringBySelfText;
/// UILabel文字旋转
-(JobsRetLabelByNSIntegerBlock _Nonnull)transformLayer;
/// 通过传入的(UIImage *)bgImage 来设置背景颜色
-(JobsRetLabelByImageBlock _Nonnull)bgImage;
/// 行数
-(JobsRetLabelByNSIntegerBlock _Nonnull)byNumberOfLines;
/// 设置UILabel的显示样式 【在Masonry以后拿到了frame】
-(JobsRetLabelByNSUIntegerBlock _Nonnull)makeLabelByShowingType;
#pragma mark —— 系统方法链式语法封装
-(JobsRetLabelByAttributedStringBlock _Nonnull)byAttributedString;
-(JobsRetLabelByCorBlock _Nonnull)byBgColor;
-(JobsRetLabelByTextBlock _Nonnull)byText;
-(JobsRetLabelByTextBlock _Nonnull)byNextText;
-(JobsRetLabelByAttributedStringBlock _Nonnull)byNextAttributedText;
-(JobsRetLabelByAttributedStringBlock _Nonnull)byNextAttributedTextWithvalue;
-(JobsRetLabelByCorBlock _Nonnull)byTextCor;
-(JobsRetLabelByFontBlock _Nonnull)byFont;
-(JobsRetLabelByTextAlignmentBlock _Nonnull)byTextAlignment;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UILABEL_DSL_D812D8EDF0 */

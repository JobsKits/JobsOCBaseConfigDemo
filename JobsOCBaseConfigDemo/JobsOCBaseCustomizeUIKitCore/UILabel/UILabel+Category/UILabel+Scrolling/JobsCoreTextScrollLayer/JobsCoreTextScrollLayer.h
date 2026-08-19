//
//  JobsCoreTextScrollLayer.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月17日，星期五.
//

#import <CoreText/CoreText.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDSL/CALayer+DSL.h>)
#import <JobsOCDSL/CALayer+DSL.h>
#else
#import "CALayer+DSL.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

/// 文字只由 CoreText 排版和绘制；滚动阶段只改变当前 Layer 的位移。
@interface JobsCoreTextScrollLayer : CALayer

Prop_assign(readonly)CGFloat textWidth;
/// CoreText 排版推进宽度；只用于判断 UILabel 是否真的容纳不下当前文案。
Prop_assign(readonly)CGFloat textLayoutWidth;

-(void)updateWithAttributedText:(NSAttributedString *)attributedText
                         height:(CGFloat)height
               duplicateSpacing:(nullable NSNumber *)duplicateSpacing;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsCoreTextScrollLayer
-(JobsRetJobsCoreTextScrollLayerByCGFloatBlock _Nonnull)byBaselineY;
-(JobsRetJobsCoreTextScrollLayerByCGFloatBlock _Nonnull)byLineOriginX;
-(JobsRetJobsCoreTextScrollLayerByCGFloatBlock _Nonnull)byTextLayoutWidth;
-(JobsRetJobsCoreTextScrollLayerByCGFloatBlock _Nonnull)byTextWidth;
-(JobsRetJobsCoreTextScrollLayerByCTLineRefBlock _Nonnull)byTextLine;
-(JobsRetJobsCoreTextScrollLayerByNSNumberBlock _Nonnull)byDuplicateOriginX;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsCoreTextScrollLayer
@end

NS_ASSUME_NONNULL_END

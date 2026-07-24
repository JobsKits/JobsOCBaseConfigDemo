//
//  JobsCoreTextScrollLayer.h
//  JobsOCUILabelScrolling
//
//  Created by Jobs on 2026年7月17日，星期五.
//

#import <CoreText/CoreText.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

/// 文字只由 CoreText 排版和绘制；滚动阶段只改变当前 Layer 的位移。
@interface JobsCoreTextScrollLayer : CALayer

Prop_assign(readonly)CGFloat textWidth;

-(void)updateWithAttributedText:(NSAttributedString *)attributedText
                         height:(CGFloat)height
               duplicateSpacing:(nullable NSNumber *)duplicateSpacing;

@end

NS_ASSUME_NONNULL_END

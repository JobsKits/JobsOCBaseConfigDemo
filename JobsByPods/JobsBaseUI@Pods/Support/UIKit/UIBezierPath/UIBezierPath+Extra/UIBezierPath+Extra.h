//
//  UIBezierPath+Extra.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月17日，星期日.
//

#ifndef JOBS_HEADER_GUARD_UIBEZIERPATH_EXTRA_4D18B1013B
#define JOBS_HEADER_GUARD_UIBEZIERPATH_EXTRA_4D18B1013B

#import <CoreText/CoreText.h> // 提供底层文本排版与渲染能力，适合富文本、复杂排版和精细文本控制场景。
#import <UIKit/UIKit.h>

#if __has_include(<JobsRichTextUtils/JobsRichTextUtils.h>)
#import <JobsRichTextUtils/JobsRichTextUtils.h>
#else
#import "JobsRichTextUtils.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
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

@interface UIBezierPath (Extra)
/// 将指定的文本（text）转换成一个 UIBezierPath 对象，可以用于自定义文本的绘制效果
+(UIBezierPath *)bezierPathWithText:(NSString *)text
                               font:(UIFont *)font
                   andWithDirection:(JobsDirectionType)textDirection;
/// addLineToPoint
-(jobsByPointBlock _Nonnull)add;
/// moveToPoint
-(jobsByPointBlock _Nonnull)moveTo;
/// 对系统方法 bezierPathWithRect
+(JobsRetBezierPathByFrameBlock _Nonnull)initByRect;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIBEZIERPATH_EXTRA_4D18B1013B */

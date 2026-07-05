//
//  UIBezierPath+Extra.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月17日，星期日.
//

#ifndef JOBS_HEADER_GUARD_UIBEZIERPATH_EXTRA_12DD1576FA
#define JOBS_HEADER_GUARD_UIBEZIERPATH_EXTRA_12DD1576FA

#import <CoreText/CoreText.h> // 提供底层文本排版与渲染能力，适合富文本、复杂排版和精细文本控制场景。
#import <UIKit/UIKit.h>

#import "JobsRichTextUtils.h"

#import "JobsMakes.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

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
#endif /* JOBS_HEADER_GUARD_UIBEZIERPATH_EXTRA_12DD1576FA */

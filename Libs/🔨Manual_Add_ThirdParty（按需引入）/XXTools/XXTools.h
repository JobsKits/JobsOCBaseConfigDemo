//
//  XXTools.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_XXTOOLS_09C64B7EB1
#define JOBS_HEADER_GUARD_XXTOOLS_09C64B7EB1

#import <UIKit/UIKit.h>

#import "JobsMakes.h"

#import "JobsByOCPods.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface XXTools : NSObject
/// 创建一个左上角的显示标记的markLabel
/// - Parameters:
///   - text: 要展示的文字
///   - width: 斜边宽度
///   - superView:  父视图
///   - cornerRadius: 圆角弧度
- (NSArray *)addMarkLabelWithText:(NSString *)text
                       maxWidth:(CGFloat)width
                      superView:(UIView *)superView
                   cornerRadius:(CGFloat)cornerRadius;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_XXTOOLS_09C64B7EB1 */

//
//  UIControl+XY.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UICONTROL_XY_6A30585738
#define JOBS_HEADER_GUARD_UICONTROL_XY_6A30585738

#import <objc/runtime.h>
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
/// 资料来源：http://www.jianshu.com/p/a830d0a57378
@interface UIControl (XY)

Prop_assign()NSTimeInterval uxy_acceptEventInterval;//可以用这个给重复点击加间隔

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UICONTROL_XY_6A30585738 */

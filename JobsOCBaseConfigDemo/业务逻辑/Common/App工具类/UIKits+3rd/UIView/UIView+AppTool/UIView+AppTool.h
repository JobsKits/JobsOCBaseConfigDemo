//
//  UIView+AppTool.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsAppTools/JobsAppTools.h>)
#import <JobsAppTools/JobsAppTools.h>
#else
#import "JobsAppTools.h"
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

@interface UIView (AppTool)
/// 仅在横屏情况下交换Size宽高的值
-(JobsRetFrameByVoidBlock _Nonnull)fitSize;
/// 仅在横屏情况下交换坐标XY的值
-(JobsRetFrameByVoidBlock _Nonnull)fitOrigin;

@end

NS_ASSUME_NONNULL_END

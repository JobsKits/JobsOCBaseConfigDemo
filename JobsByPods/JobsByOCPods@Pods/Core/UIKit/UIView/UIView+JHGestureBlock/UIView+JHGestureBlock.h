//
//  UIView+JHGestureBlock.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_JHGESTUREBLOCK_82856ACF4F
#define JOBS_HEADER_GUARD_UIVIEW_JHGESTUREBLOCK_82856ACF4F

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

typedef NS_ENUM(NSUInteger, JHGestureType) {
    JHGestureType_Tap,      // 点击
    JHGestureType_LongPress,// 长按
    JHGestureType_Swipe,    // 轻扫
    JHGestureType_Pan,      // 移动
    JHGestureType_Rotate,   // 旋转
    JHGestureType_Pinch,    // 缩放
};

typedef void(^JHGestureBlock)(__kindof UIView *view, __kindof UIGestureRecognizer *gesture);

@interface UIView (JHGestureBlock)

-(__kindof UIGestureRecognizer *)addGestureRecognizer:(JHGestureType)type block:(JHGestureBlock)block;

@end

#endif /* JOBS_HEADER_GUARD_UIVIEW_JHGESTUREBLOCK_82856ACF4F */

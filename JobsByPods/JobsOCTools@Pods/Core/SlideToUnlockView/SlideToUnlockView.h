//
//  SlideToUnlockView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_SLIDETOUNLOCKVIEW_13A574E09E
#define JOBS_HEADER_GUARD_SLIDETOUNLOCKVIEW_13A574E09E

#import <UIKit/UIKit.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface SlideToUnlockView : UIView
/// 滑到最右侧时回调（只在成功滑到头时调用）
Prop_copy(nullable)jobsByVoidBlock onUnlock;
/// DSL：点语法配置解锁回调
Prop_copy(readonly)SlideToUnlockView * _Nonnull (^byOnUnlock)(jobsByVoidBlock _Nullable);
/// 复位到最左侧
-(jobsByBOOLBlock _Nonnull)byResetAnimated;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof SlideToUnlockView *_Nonnull
jobsMakeSlideToUnlockView(jobsBySlideToUnlockViewBlock _Nonnull block){
    SlideToUnlockView *data = SlideToUnlockView.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_SLIDETOUNLOCKVIEW_13A574E09E */

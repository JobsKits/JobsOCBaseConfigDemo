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

#import "JobsMakes.h"

#import "JobsLanMgr.h"

#import "JobsByOCPods.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

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

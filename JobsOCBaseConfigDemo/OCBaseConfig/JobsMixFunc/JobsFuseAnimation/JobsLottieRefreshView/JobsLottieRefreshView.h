//
//  JobsLottieRefreshView.h
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import <UIKit/UIKit.h>

#if __has_include(<lottie-ios/Lottie.h>)
#import <lottie-ios/Lottie.h>
#else
#import "Lottie.h"
#endif

#if __has_include(<JobsFuseAnimation/JobsRefreshAnimatorProtocol.h>)
#import <JobsFuseAnimation/JobsRefreshAnimatorProtocol.h>
#else
#import "JobsRefreshAnimatorProtocol.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

/// Lottie 刷新插件；拖拽进度会同步到动画进度，刷新态自动循环。
@interface JobsLottieRefreshView : UIView<JobsRefreshAnimatorProtocol>

Prop_copy(readonly)NSString *animationName;
Prop_assign()CGSize indicatorSize;

-(instancetype)initWithAnimationNamed:(NSString *)animationName;
-(instancetype)initWithAnimationPath:(NSString *)animationPath;
-(instancetype)byStart;
-(instancetype)byPause;
-(instancetype)byResume;
-(instancetype)byStop;

@end

NS_ASSUME_NONNULL_END

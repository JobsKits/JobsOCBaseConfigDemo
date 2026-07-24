//
//  JobsImageRefreshView.h
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsFuseAnimation/JobsRefreshAnimatorProtocol.h>)
#import <JobsFuseAnimation/JobsRefreshAnimatorProtocol.h>
#else
#import "JobsRefreshAnimatorProtocol.h"
#endif

#if __has_include(<JobsOCTimer/JobsOCTimer.h>)
#import <JobsOCTimer/JobsOCTimer.h>
#else
#import "JobsOCTimer.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
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

/// 单图静态展示；多图由 JobsTimer 轮播形成动画。
@interface JobsImageRefreshView : UIView<JobsRefreshAnimatorProtocol>

Prop_copy(readonly)NSArray<UIImage *> *images;
Prop_assign(readonly)NSTimeInterval frameInterval;
Prop_assign()CGSize indicatorSize;

-(instancetype)initWithImage:(UIImage *)image;
-(instancetype)initWithImages:(NSArray<UIImage *> *)images
                frameInterval:(NSTimeInterval)frameInterval;
-(instancetype)byStart;
-(instancetype)byPause;
-(instancetype)byResume;
-(instancetype)byStop;

@end

NS_ASSUME_NONNULL_END

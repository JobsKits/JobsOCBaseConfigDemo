//
//  TLTabBarAnimation.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_TLTABBARANIMATION_18F2AC4B13
#define JOBS_HEADER_GUARD_TLTABBARANIMATION_18F2AC4B13

#import <JobsOCTools/TLAnimationProtocol.h>

#if __has_include(<JobsOCDefs/JobsDefineProperty.h>)
#import <JobsOCDefs/JobsDefineProperty.h>
#else
#import "JobsDefineProperty.h"
#endif

#define  kDuration  0.5f
#define  kAnimationKeyPathScale @"transform.scale"
#define  kAnimationKeyPathRotation @"transform.rotation"
#define  kAnimationKeyPathKeyFrame @"contents"
#define  kAnimationKeyPathPositionY @"position.y"
#define  kAnimationKeyPathOpacity @"opacity"

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/** 弹性动画 */
@interface TLBounceAnimation : NSObject <TLAnimationProtocol>
/// 是否需要播放烟花效果，默认NO
Prop_assign()BOOL isPlayFireworksAnimation;

@end
/** 仿烟动画 */
@interface TLFumeAnimation : NSObject <TLAnimationProtocol>

@end
/** 旋转动画 */
@interface TLRotationAnimation : NSObject <TLAnimationProtocol>

@end
/** 贞动画 */
@interface TLFrameAnimation : NSObject <TLAnimationProtocol>

Prop_strong()NSArray <CIImage *>*images;
/// 是否需要播放烟花效果，默认NO
Prop_assign()BOOL isPlayFireworksAnimation;

@end
/** 转场动画 */
@interface TLTransitionAniamtion : NSObject <TLAnimationProtocol>
/** direction 翻转方向, 取值1-6，默认1
 * UIViewAnimationOptionTransitionFlipFromLeft    = 1,
 * UIViewAnimationOptionTransitionFlipFromRight   = 2,
 * UIViewAnimationOptionTransitionFlipFromTop     = 3,
 * UIViewAnimationOptionTransitionFlipFromBottom  = 4,
 * UIViewAnimationOptionTransitionCurlUp          = 5,
 * UIViewAnimationOptionTransitionCurlDown        = 6,
 */
Prop_assign()NSUInteger direction;
/// 不播放撤销选择动画， default ： NO
Prop_assign()BOOL disableDeselectAnimation;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_TLTABBARANIMATION_18F2AC4B13 */

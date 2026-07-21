//
//  JobsOCRefreshComponent.h
//  JobsOCRefresher
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "JobsOCRefreshConfig.h"

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

@interface JobsOCRefreshComponent : UIView

Prop_assign() JobsOCRefreshPosition position;
Prop_assign() JobsOCRefreshRole role;
Prop_strong() JobsOCRefreshConfig *config;
Prop_assign(readonly) JobsOCRefreshState state;
Prop_strong(readonly) id<JobsRefreshAnimatorProtocol> animator;

- (instancetype)initWithPosition:(JobsOCRefreshPosition)position
                            role:(JobsOCRefreshRole)role
                          config:(JobsOCRefreshConfig *)config NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;
- (void)applyState:(JobsOCRefreshState)state progress:(CGFloat)progress;
- (void)replaceAnimator:(nullable id<JobsRefreshAnimatorProtocol>)animator;
- (void)markRefreshedAt:(NSDate *)date;
- (CGFloat)refreshLength;

@end

NS_ASSUME_NONNULL_END

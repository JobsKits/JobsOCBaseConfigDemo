//
//  JobsOCRefreshComponent.h
//  JobsOCRefresher
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "JobsOCRefreshConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCRefreshComponent : UIView

Prop_assign() JobsOCRefreshPosition position;
Prop_assign() JobsOCRefreshRole role;
Prop_strong() JobsOCRefreshConfig *config;
Prop_assign(readonly) JobsOCRefreshState state;

- (instancetype)initWithPosition:(JobsOCRefreshPosition)position
                            role:(JobsOCRefreshRole)role
                          config:(JobsOCRefreshConfig *)config NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;
- (void)applyState:(JobsOCRefreshState)state progress:(CGFloat)progress;
- (void)markRefreshedAt:(NSDate *)date;
- (CGFloat)refreshLength;

@end

NS_ASSUME_NONNULL_END

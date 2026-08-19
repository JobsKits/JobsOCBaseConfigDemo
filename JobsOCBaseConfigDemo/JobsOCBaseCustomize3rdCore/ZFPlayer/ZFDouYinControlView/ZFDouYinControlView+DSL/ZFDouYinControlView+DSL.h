//
//  ZFDouYinControlView+DSL.h
//  ZFPlayerExtra
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#ifndef JOBS_HEADER_GUARD_ZFDOUYINCONTROLVIEW_DSL_24809A0534
#define JOBS_HEADER_GUARD_ZFDOUYINCONTROLVIEW_DSL_24809A0534

#import "ZFDouYinControlView.h"

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

typedef __kindof ZFDouYinControlView *_Nullable(^JobsRetZFDouYinControlViewByPlayerBlock)(ZFPlayerController *_Nullable data);
typedef __kindof ZFDouYinControlView *_Nullable(^JobsRetZFDouYinControlViewByStringBlock)(NSString *_Nullable data);

@interface ZFDouYinControlView (DSL)

-(JobsRetZFDouYinControlViewByPlayerBlock _Nonnull)byPlayer;
-(JobsRetZFDouYinControlViewByVoidBlock _Nonnull)byResetControlView;
-(JobsRetZFDouYinControlViewByStringBlock _Nonnull)byShowCoverViewWithUrl;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_ZFDOUYINCONTROLVIEW_DSL_24809A0534 */

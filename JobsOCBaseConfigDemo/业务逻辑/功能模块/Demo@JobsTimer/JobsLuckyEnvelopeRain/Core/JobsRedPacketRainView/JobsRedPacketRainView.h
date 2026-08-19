//
//  JobsRedPacketRainView.h
//  JobsLuckyEnvelopeRain
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsLuckyEnvelopeRain/JobsRedPacketRainConfig.h>)
#import <JobsLuckyEnvelopeRain/JobsRedPacketRainConfig.h>
#elif __has_include("../JobsRedPacketRainConfig/JobsRedPacketRainConfig.h")
#import "../JobsRedPacketRainConfig/JobsRedPacketRainConfig.h"
#else
#import "JobsRedPacketRainConfig.h"
#endif

#if __has_include(<JobsOCTimer/JobsOCTimer.h>)
#import <JobsOCTimer/JobsOCTimer.h>
#else
#import "JobsOCTimer.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@class JobsRedPacketRainView;

@interface JobsRedPacketRainView : UIView

Prop_strong()JobsRedPacketRainConfig *config;
Prop_copy(nullable)void(^tapCallback)(__kindof JobsRedPacketRainView *rainView, NSUInteger tappedCount);
Prop_assign(readonly,getter=isRunning)BOOL running;
Prop_assign(readonly)NSUInteger tappedCount;

-(JobsRetJobsRedPacketRainViewByBOOLBlock _Nonnull)byRunning;
+(JobsRetIDByJobsRedPacketRainConfigBlock _Nonnull)rainViewWithConfig;
-(instancetype)initWithFrame:(CGRect)frame
                      config:(JobsRedPacketRainConfig *_Nullable)config;
-(JobsRetIDByvoidJobsRedPacketRainViewNSUIntegerBlock _Nonnull)onPacketTap;
-(jobsByVoidBlock _Nonnull)start;
-(jobsByVoidBlock _Nonnull)pause;
-(jobsByVoidBlock _Nonnull)resume;
-(jobsByBOOLBlock _Nonnull)stopWithClear;
-(jobsByVoidBlock _Nonnull)reset;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsRedPacketRainView
-(JobsRetJobsRedPacketRainViewByJobsTimerBlock _Nonnull)byFallTimer;
-(JobsRetJobsRedPacketRainViewByJobsTimerBlock _Nonnull)bySpawnTimer;
-(JobsRetJobsRedPacketRainViewByNSUIntegerBlock _Nonnull)byTappedCount;
-(JobsRetJobsRedPacketRainViewByvoidJobsRedPacketRainViewrainViewNSUIntegertappedCountBlock _Nonnull)byTapCallback;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsRedPacketRainView
@end

NS_ASSUME_NONNULL_END

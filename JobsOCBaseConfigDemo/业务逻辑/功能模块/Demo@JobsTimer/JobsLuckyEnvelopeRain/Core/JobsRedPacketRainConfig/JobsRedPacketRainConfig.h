//
//  JobsRedPacketRainConfig.h
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

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsRedPacketRainConfig : NSObject<NSCopying>

/// 每次生成红包的间隔。
Prop_assign()NSTimeInterval spawnInterval;
/// 最小下落时长。
Prop_assign()NSTimeInterval minFallDuration;
/// 最大下落时长。
Prop_assign()NSTimeInterval maxFallDuration;
/// 红包尺寸。
Prop_assign()CGSize packetSize;
/// 屏幕上最多同时存在多少个红包。
Prop_assign()NSUInteger maxConcurrentCount;
/// 生成区域的内边距。
Prop_assign()UIEdgeInsets spawnInsets;
/// 是否允许点按红包。
Prop_assign()BOOL tapEnabled;
/// 自定义红包图片；不传则使用内置绘制红包。
Prop_strong(nullable)UIImage *packetImage;

+(JobsRetIDByVoidBlock _Nonnull)defaultConfig;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsRedPacketRainConfig
-(JobsRetJobsRedPacketRainConfigByBOOLBlock _Nonnull)byTapEnabled;
-(JobsRetJobsRedPacketRainConfigByCGSizeBlock _Nonnull)byPacketSize;
-(JobsRetJobsRedPacketRainConfigByNSTimeIntervalBlock _Nonnull)byMaxFallDuration;
-(JobsRetJobsRedPacketRainConfigByNSTimeIntervalBlock _Nonnull)byMinFallDuration;
-(JobsRetJobsRedPacketRainConfigByNSTimeIntervalBlock _Nonnull)bySpawnInterval;
-(JobsRetJobsRedPacketRainConfigByNSUIntegerBlock _Nonnull)byMaxConcurrentCount;
-(JobsRetJobsRedPacketRainConfigByUIEdgeInsetsBlock _Nonnull)bySpawnInsets;
-(JobsRetJobsRedPacketRainConfigByUIImageBlock _Nonnull)byPacketImage;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsRedPacketRainConfig
@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsRedPacketRainConfig *_Nonnull
jobsMakeRedPacketRainConfig(void(^_Nullable block)(__kindof JobsRedPacketRainConfig *_Nullable config)){
    JobsRedPacketRainConfig *data = JobsRedPacketRainConfig.defaultConfig();
    if (block) block(data);
    return data;
}

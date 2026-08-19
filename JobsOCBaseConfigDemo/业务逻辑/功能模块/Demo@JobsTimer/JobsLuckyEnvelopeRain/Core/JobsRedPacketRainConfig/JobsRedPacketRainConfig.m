//
//  JobsRedPacketRainConfig.m
//  JobsLuckyEnvelopeRain
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import "JobsRedPacketRainConfig.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsRedPacketRainConfig
@interface JobsRedPacketRainConfig (JobsPropertyDSLSetterAutogen_f96b3d1bb5)
-(void)setMaxConcurrentCount:(NSUInteger)data;
-(void)setMaxFallDuration:(NSTimeInterval)data;
-(void)setMinFallDuration:(NSTimeInterval)data;
-(void)setPacketImage:(UIImage * _Nullable)data;
-(void)setPacketSize:(CGSize)data;
-(void)setSpawnInsets:(UIEdgeInsets)data;
-(void)setSpawnInterval:(NSTimeInterval)data;
-(void)setTapEnabled:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsRedPacketRainConfig

@implementation JobsRedPacketRainConfig
+(JobsRetIDByVoidBlock _Nonnull)defaultConfig{
    return ^id{
        return JobsRedPacketRainConfig.new;
    };
}

-(instancetype)init{
    if (self = [super init]) {
        _spawnInterval = 0.25;
        _minFallDuration = 2.5;
        _maxFallDuration = 4.0;
        _packetSize = CGSizeMake(44, 54);
        _maxConcurrentCount = 60;
        _spawnInsets = UIEdgeInsetsMake(0, 10, 0, 10);
        _tapEnabled = YES;
    };return self;
}

-(id)copyWithZone:(NSZone *)zone{
    JobsRedPacketRainConfig *config = [[JobsRedPacketRainConfig allocWithZone:zone] init];
    config.bySpawnInterval(self.spawnInterval);
    config.byMinFallDuration(self.minFallDuration);
    config.byMaxFallDuration(self.maxFallDuration);
    config.byPacketSize(self.packetSize);
    config.byMaxConcurrentCount(self.maxConcurrentCount);
    config.bySpawnInsets(self.spawnInsets);
    config.byTapEnabled(self.tapEnabled);
    config.byPacketImage(self.packetImage);
    return config;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsRedPacketRainConfig
-(JobsRetJobsRedPacketRainConfigByBOOLBlock _Nonnull)byTapEnabled{
    @jobs_weakify(self)
    return ^__kindof JobsRedPacketRainConfig * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setTapEnabled:data];
        return self;
    };
}

-(JobsRetJobsRedPacketRainConfigByCGSizeBlock _Nonnull)byPacketSize{
    @jobs_weakify(self)
    return ^__kindof JobsRedPacketRainConfig * _Nullable(CGSize data){
        @jobs_strongify(self)
        [self setPacketSize:data];
        return self;
    };
}

-(JobsRetJobsRedPacketRainConfigByNSTimeIntervalBlock _Nonnull)byMaxFallDuration{
    @jobs_weakify(self)
    return ^__kindof JobsRedPacketRainConfig * _Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        [self setMaxFallDuration:data];
        return self;
    };
}

-(JobsRetJobsRedPacketRainConfigByNSTimeIntervalBlock _Nonnull)byMinFallDuration{
    @jobs_weakify(self)
    return ^__kindof JobsRedPacketRainConfig * _Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        [self setMinFallDuration:data];
        return self;
    };
}

-(JobsRetJobsRedPacketRainConfigByNSTimeIntervalBlock _Nonnull)bySpawnInterval{
    @jobs_weakify(self)
    return ^__kindof JobsRedPacketRainConfig * _Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        [self setSpawnInterval:data];
        return self;
    };
}

-(JobsRetJobsRedPacketRainConfigByNSUIntegerBlock _Nonnull)byMaxConcurrentCount{
    @jobs_weakify(self)
    return ^__kindof JobsRedPacketRainConfig * _Nullable(NSUInteger data){
        @jobs_strongify(self)
        [self setMaxConcurrentCount:data];
        return self;
    };
}

-(JobsRetJobsRedPacketRainConfigByUIEdgeInsetsBlock _Nonnull)bySpawnInsets{
    @jobs_weakify(self)
    return ^__kindof JobsRedPacketRainConfig * _Nullable(UIEdgeInsets data){
        @jobs_strongify(self)
        [self setSpawnInsets:data];
        return self;
    };
}

-(JobsRetJobsRedPacketRainConfigByUIImageBlock _Nonnull)byPacketImage{
    @jobs_weakify(self)
    return ^__kindof JobsRedPacketRainConfig * _Nullable(UIImage * _Nullable data){
        @jobs_strongify(self)
        [self setPacketImage:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsRedPacketRainConfig
@end

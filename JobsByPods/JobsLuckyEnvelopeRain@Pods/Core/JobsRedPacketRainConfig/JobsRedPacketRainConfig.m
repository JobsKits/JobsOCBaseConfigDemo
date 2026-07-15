//
//  JobsRedPacketRainConfig.m
//  JobsLuckyEnvelopeRain
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import "JobsRedPacketRainConfig.h"

@implementation JobsRedPacketRainConfig
+(instancetype)defaultConfig{
    return JobsRedPacketRainConfig.new;
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
    config.spawnInterval = self.spawnInterval;
    config.minFallDuration = self.minFallDuration;
    config.maxFallDuration = self.maxFallDuration;
    config.packetSize = self.packetSize;
    config.maxConcurrentCount = self.maxConcurrentCount;
    config.spawnInsets = self.spawnInsets;
    config.tapEnabled = self.tapEnabled;
    config.packetImage = self.packetImage;
    return config;
}

@end

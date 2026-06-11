//
//  CADisplayLink+DSL.m
//  JobsOCDSL
//
#import "CADisplayLink+DSL.h"

@implementation CADisplayLink (JobsChain)
-(JobsRetCADisplayLinkByBOOLBlock)byPaused{
    @jobs_weakify(self)
    return ^__kindof CADisplayLink *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.paused = data;
        return self;
    };
}

-(JobsRetCADisplayLinkByNSIntegerBlock)byPreferredFramesPerSecond{
    @jobs_weakify(self)
    return ^__kindof CADisplayLink *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.preferredFramesPerSecond = data;
        return self;
    };
}

-(JobsRetCADisplayLinkByVoidBlock)byInvalidate{
    @jobs_weakify(self)
    return ^__kindof CADisplayLink *_Nullable(void){
        @jobs_strongify(self)
        [self invalidate];
        return self;
    };
}
#if defined(__IPHONE_15_0)
-(JobsRetCADisplayLinkByCAFrameRateRangeBlock)byPreferredFrameRateRange API_AVAILABLE(ios(15.0)){
    @jobs_weakify(self)
    return ^__kindof CADisplayLink *_Nullable(CAFrameRateRange data){
        @jobs_strongify(self)
        if (@available(iOS 15.0, *)) self.preferredFrameRateRange = data;
        return self;
    };
}
#endif

@end

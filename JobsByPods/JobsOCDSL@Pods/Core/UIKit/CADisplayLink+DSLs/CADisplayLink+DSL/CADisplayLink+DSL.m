//
//  CADisplayLink+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#import "CADisplayLink+DSL.h"

@implementation CADisplayLink (JobsChain)
-(JobsRetCADisplayLinkByNSIntegerBlock _Nonnull)byFrameInterval{
    @jobs_weakify(self)
    return ^__kindof CADisplayLink *_Nullable(NSInteger data){
        @jobs_strongify(self)
        NSInteger frameInterval = MAX(1, data);
        if (@available(iOS 10.0, tvOS 10.0, *)) {
            self.preferredFramesPerSecond = MAX(1,
                                                UIScreen.mainScreen.maximumFramesPerSecond / frameInterval);
        }else{
            SuppressWdeprecatedDeclarationsWarning(self.frameInterval = frameInterval);
        };return self;
    };
}

-(JobsRetCADisplayLinkByNSIntegerBlock _Nonnull)byPreferredFramesPerSecond{
    @jobs_weakify(self)
    return ^__kindof CADisplayLink *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.preferredFramesPerSecond = data;
        return self;
    };
}

-(JobsRetCADisplayLinkByVoidBlock _Nonnull)byInvalidate{
    @jobs_weakify(self)
    return ^__kindof CADisplayLink *_Nullable(void){
        @jobs_strongify(self)
        [self invalidate];
        return self;
    };
}
#if defined(__IPHONE_15_0)
-(JobsRetCADisplayLinkByCAFrameRateRangeBlock _Nonnull)byPreferredFrameRateRange API_AVAILABLE(ios(15.0)){
    @jobs_weakify(self)
    return ^__kindof CADisplayLink *_Nullable(CAFrameRateRange data){
        @jobs_strongify(self)
        if (@available(iOS 15.0, *)) self.preferredFrameRateRange = data;
        return self;
    };
}
#endif

@end

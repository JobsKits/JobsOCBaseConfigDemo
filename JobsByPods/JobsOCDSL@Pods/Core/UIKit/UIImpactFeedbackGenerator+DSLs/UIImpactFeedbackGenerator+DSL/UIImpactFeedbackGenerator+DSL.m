//
//  UIImpactFeedbackGenerator+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "UIImpactFeedbackGenerator+DSL.h"

@implementation UIImpactFeedbackGenerator (DSL)
-(JobsRetImpactFeedbackGeneratorByVoidBlock _Nonnull)byImpactOccurred{
    @jobs_weakify(self)
    return ^UIImpactFeedbackGenerator *_Nonnull(void){
        @jobs_strongify(self)
        [self impactOccurred];
        return self;
    };
}

#if defined(__IPHONE_17_5)
-(JobsRetImpactFeedbackGeneratorByCGPointBlock _Nonnull)byImpactOccurredAtLocation{
    @jobs_weakify(self)
    return ^UIImpactFeedbackGenerator *_Nonnull(CGPoint data){
        @jobs_strongify(self)
        [self impactOccurredAtLocation:data];
        return self;
    };
}
#endif

#if defined(__IPHONE_13_0)
-(JobsRetImpactFeedbackGeneratorByCGFloatBlock _Nonnull)byImpactOccurredWithIntensity{
    @jobs_weakify(self)
    return ^UIImpactFeedbackGenerator *_Nonnull(CGFloat data){
        @jobs_strongify(self)
        [self impactOccurredWithIntensity:data];
        return self;
    };
}
#endif

@end

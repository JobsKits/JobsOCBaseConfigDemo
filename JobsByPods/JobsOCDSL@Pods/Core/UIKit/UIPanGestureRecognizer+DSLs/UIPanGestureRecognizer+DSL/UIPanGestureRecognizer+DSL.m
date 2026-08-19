//
//  UIPanGestureRecognizer+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#import "UIPanGestureRecognizer+DSL.h"

@implementation UIPanGestureRecognizer (JobsChain)
-(JobsRetPanGestureRecognizerByNSUIntegerBlock _Nonnull)byMinimumNumberOfTouches{
    @jobs_weakify(self)
    return ^__kindof UIPanGestureRecognizer *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.minimumNumberOfTouches = data;
        return self;
    };
}

-(JobsRetPanGestureRecognizerByNSUIntegerBlock _Nonnull)byMaximumNumberOfTouches{
    @jobs_weakify(self)
    return ^__kindof UIPanGestureRecognizer *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.maximumNumberOfTouches = data;
        return self;
    };
}

@end

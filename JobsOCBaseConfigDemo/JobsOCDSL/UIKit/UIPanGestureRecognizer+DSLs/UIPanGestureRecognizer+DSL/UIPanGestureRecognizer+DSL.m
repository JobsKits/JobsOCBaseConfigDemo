//
//  UIPanGestureRecognizer+DSL.m
//  JobsOCBaseConfigDemo
//
#import "UIPanGestureRecognizer+DSL.h"

@implementation UIPanGestureRecognizer (JobsChain)
-(JobsRetPanGestureRecognizerByNSUIntegerBlock)byMinimumNumberOfTouches{
    @jobs_weakify(self)
    return ^__kindof UIPanGestureRecognizer *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.minimumNumberOfTouches = data;
        return self;
    };
}

-(JobsRetPanGestureRecognizerByNSUIntegerBlock)byMaximumNumberOfTouches{
    @jobs_weakify(self)
    return ^__kindof UIPanGestureRecognizer *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.maximumNumberOfTouches = data;
        return self;
    };
}

@end

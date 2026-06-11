//
//  UILongPressGestureRecognizer+DSL.m
//  JobsOCDSL
//
#import "UILongPressGestureRecognizer+DSL.h"

@implementation UILongPressGestureRecognizer (JobsChain)
-(JobsRetLongPressGestureRecognizerByNSUIntegerBlock)byNumberOfTapsRequired{
    @jobs_weakify(self)
    return ^__kindof UILongPressGestureRecognizer *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.numberOfTapsRequired = data;
        return self;
    };
}

-(JobsRetLongPressGestureRecognizerByNSUIntegerBlock)byNumberOfTouchesRequired{
    @jobs_weakify(self)
    return ^__kindof UILongPressGestureRecognizer *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.numberOfTouchesRequired = data;
        return self;
    };
}

-(JobsRetLongPressGestureRecognizerByNSTimeIntervalBlock)byMinimumPressDuration{
    @jobs_weakify(self)
    return ^__kindof UILongPressGestureRecognizer *_Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        self.minimumPressDuration = data;
        return self;
    };
}

-(JobsRetLongPressGestureRecognizerByCGFloatBlock)byAllowableMovement{
    @jobs_weakify(self)
    return ^__kindof UILongPressGestureRecognizer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.allowableMovement = data;
        return self;
    };
}

@end

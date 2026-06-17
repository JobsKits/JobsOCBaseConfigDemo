//
//  UISwipeGestureRecognizer+DSL.m
//  JobsOCBaseConfigDemo
//
#import "UISwipeGestureRecognizer+DSL.h"

@implementation UISwipeGestureRecognizer (JobsChain)
-(JobsRetSwipeGestureRecognizerByNSUIntegerBlock)byNumberOfTouchesRequired{
    @jobs_weakify(self)
    return ^__kindof UISwipeGestureRecognizer *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.numberOfTouchesRequired = data;
        return self;
    };
}

-(JobsRetSwipeGestureRecognizerByDirectionBlock)byDirection{
    @jobs_weakify(self)
    return ^__kindof UISwipeGestureRecognizer *_Nullable(UISwipeGestureRecognizerDirection data){
        @jobs_strongify(self)
        self.direction = data;
        return self;
    };
}

@end

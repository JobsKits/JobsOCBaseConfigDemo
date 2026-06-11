//
//  UITapGestureRecognizer+DSL.m
//  JobsOCDSL
//
#import "UITapGestureRecognizer+DSL.h"

@implementation UITapGestureRecognizer (JobsChain)
-(JobsRetTapGestureRecognizerByNSUIntegerBlock)byNumberOfTapsRequired{
    @jobs_weakify(self)
    return ^__kindof UITapGestureRecognizer *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.numberOfTapsRequired = data;
        return self;
    };
}

-(JobsRetTapGestureRecognizerByNSUIntegerBlock)byNumberOfTouchesRequired{
    @jobs_weakify(self)
    return ^__kindof UITapGestureRecognizer *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.numberOfTouchesRequired = data;
        return self;
    };
}

@end

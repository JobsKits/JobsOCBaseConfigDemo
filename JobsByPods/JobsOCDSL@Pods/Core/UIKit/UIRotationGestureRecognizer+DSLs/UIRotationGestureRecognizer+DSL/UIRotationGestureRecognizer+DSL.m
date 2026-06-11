//
//  UIRotationGestureRecognizer+DSL.m
//  JobsOCDSL
//
#import "UIRotationGestureRecognizer+DSL.h"

@implementation UIRotationGestureRecognizer (JobsChain)
-(JobsRetRotationGestureRecognizerByCGFloatBlock)byRotation{
    @jobs_weakify(self)
    return ^__kindof UIRotationGestureRecognizer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.rotation = data;
        return self;
    };
}

@end

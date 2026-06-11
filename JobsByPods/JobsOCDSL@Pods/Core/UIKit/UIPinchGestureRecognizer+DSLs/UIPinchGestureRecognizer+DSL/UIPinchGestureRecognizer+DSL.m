//
//  UIPinchGestureRecognizer+DSL.m
//  JobsOCDSL
//
#import "UIPinchGestureRecognizer+DSL.h"

@implementation UIPinchGestureRecognizer (JobsChain)
-(JobsRetPinchGestureRecognizerByCGFloatBlock)byScale{
    @jobs_weakify(self)
    return ^__kindof UIPinchGestureRecognizer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.scale = data;
        return self;
    };
}

@end

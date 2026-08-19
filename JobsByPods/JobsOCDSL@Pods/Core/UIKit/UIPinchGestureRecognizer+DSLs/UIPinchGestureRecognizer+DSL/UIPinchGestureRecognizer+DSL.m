//
//  UIPinchGestureRecognizer+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#import "UIPinchGestureRecognizer+DSL.h"

@implementation UIPinchGestureRecognizer (JobsChain)
-(JobsRetPinchGestureRecognizerByCGFloatBlock _Nonnull)byScale{
    @jobs_weakify(self)
    return ^__kindof UIPinchGestureRecognizer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.scale = data;
        return self;
    };
}

@end

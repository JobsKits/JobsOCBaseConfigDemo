//
//  UIRotationGestureRecognizer+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#import "UIRotationGestureRecognizer+DSL.h"

@implementation UIRotationGestureRecognizer (JobsChain)
-(JobsRetRotationGestureRecognizerByCGFloatBlock _Nonnull)byRotation{
    @jobs_weakify(self)
    return ^__kindof UIRotationGestureRecognizer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.rotation = data;
        return self;
    };
}

@end

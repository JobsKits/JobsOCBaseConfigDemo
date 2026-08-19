//
//  UILongPressGestureRecognizer+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#import "UILongPressGestureRecognizer+DSL.h"

@implementation UILongPressGestureRecognizer (JobsChain)
-(JobsRetLongPressGestureRecognizerByNSUIntegerBlock _Nonnull)byNumberOfTapsRequired{
    @jobs_weakify(self)
    return ^__kindof UILongPressGestureRecognizer *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.numberOfTapsRequired = data;
        return self;
    };
}

-(JobsRetLongPressGestureRecognizerByNSUIntegerBlock _Nonnull)byNumberOfTouchesRequired{
    @jobs_weakify(self)
    return ^__kindof UILongPressGestureRecognizer *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.numberOfTouchesRequired = data;
        return self;
    };
}

-(JobsRetLongPressGestureRecognizerByNSTimeIntervalBlock _Nonnull)byMinimumPressDuration{
    @jobs_weakify(self)
    return ^__kindof UILongPressGestureRecognizer *_Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        self.minimumPressDuration = data;
        return self;
    };
}

-(JobsRetLongPressGestureRecognizerByCGFloatBlock _Nonnull)byAllowableMovement{
    @jobs_weakify(self)
    return ^__kindof UILongPressGestureRecognizer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.allowableMovement = data;
        return self;
    };
}

@end

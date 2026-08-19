//
//  UISwipeGestureRecognizer+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#import "UISwipeGestureRecognizer+DSL.h"

@implementation UISwipeGestureRecognizer (JobsChain)
-(JobsRetSwipeGestureRecognizerByNSUIntegerBlock _Nonnull)byNumberOfTouchesRequired{
    @jobs_weakify(self)
    return ^__kindof UISwipeGestureRecognizer *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.numberOfTouchesRequired = data;
        return self;
    };
}

-(JobsRetSwipeGestureRecognizerByDirectionBlock _Nonnull)byDirection{
    @jobs_weakify(self)
    return ^__kindof UISwipeGestureRecognizer *_Nullable(UISwipeGestureRecognizerDirection data){
        @jobs_strongify(self)
        self.direction = data;
        return self;
    };
}

@end

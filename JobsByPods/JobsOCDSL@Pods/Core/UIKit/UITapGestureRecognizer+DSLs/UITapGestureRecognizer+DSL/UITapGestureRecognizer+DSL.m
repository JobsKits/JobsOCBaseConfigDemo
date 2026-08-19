//
//  UITapGestureRecognizer+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#import "UITapGestureRecognizer+DSL.h"

@implementation UITapGestureRecognizer (JobsChain)
-(JobsRetTapGestureRecognizerByNSUIntegerBlock _Nonnull)byNumberOfTapsRequired{
    @jobs_weakify(self)
    return ^__kindof UITapGestureRecognizer *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.numberOfTapsRequired = data;
        return self;
    };
}

-(JobsRetTapGestureRecognizerByNSUIntegerBlock _Nonnull)byNumberOfTouchesRequired{
    @jobs_weakify(self)
    return ^__kindof UITapGestureRecognizer *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.numberOfTouchesRequired = data;
        return self;
    };
}

@end

//
//  UIGestureRecognizer+ReactiveCocoa.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIGestureRecognizer+ReactiveCocoa.h"
#import <JobsOCDSL/UIGestureRecognizer+DSL.h>

@implementation UIGestureRecognizer (ReactiveCocoa)
+(JobsRetIDByVoidBlock _Nonnull)rac_recognizer{
    return ^id{
        UIGestureRecognizer *recognizer = self.new;
        recognizer.rac_initializeRAC();
        [recognizer addTarget:recognizer.rac_gestureHandler
                       action:@selector(rac_handleGesture)];
        return recognizer;
    };
}

-(JobsRetRACSignalByVoidBlock _Nonnull)rac_signal{
    @jobs_weakify(self)
    return ^RACSignal *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.rac_subject;
    };
}

-(jobsByVoidBlock _Nonnull)rac_initializeRAC{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byRac_gestureHandler(RACGestureRecognizerActionHandler.new);
        self.byRac_subject(RACSubject.subject);
    };
}

@end

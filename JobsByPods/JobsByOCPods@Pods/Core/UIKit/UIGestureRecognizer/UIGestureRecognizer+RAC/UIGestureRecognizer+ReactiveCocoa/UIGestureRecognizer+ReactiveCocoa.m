//
//  UIGestureRecognizer+ReactiveCocoa.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIGestureRecognizer+ReactiveCocoa.h"

@implementation UIGestureRecognizer (ReactiveCocoa)

+(instancetype)rac_recognizer{
    UIGestureRecognizer *recognizer = self.new;
    [recognizer rac_initializeRAC];
    [recognizer addTarget:recognizer.rac_gestureHandler
                   action:@selector(rac_handleGesture)];
    return recognizer;
}

-(RACSignal *)rac_signal{
    return self.rac_subject;
}

-(void)rac_initializeRAC{
    self.rac_gestureHandler = RACGestureRecognizerActionHandler.new;
    self.rac_subject = RACSubject.subject;
}

@end

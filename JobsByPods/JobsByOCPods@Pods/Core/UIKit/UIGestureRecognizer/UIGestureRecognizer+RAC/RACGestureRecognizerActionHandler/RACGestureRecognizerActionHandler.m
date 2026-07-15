//
//  RACGestureRecognizerActionHandler.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "RACGestureRecognizerActionHandler.h"

@implementation RACGestureRecognizerActionHandler
-(jobsByGestureRecognizerBlock _Nonnull)rac_handleGesture{
    return ^(__kindof UIGestureRecognizer *_Nullable recognizer){
        [recognizer.rac_subject sendNext:recognizer];
    };
}

@end

//
//  UIGestureRecognizer+RAC.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef UIGestureRecognizer_RAC_h
#define UIGestureRecognizer_RAC_h

#import <JobsByOCPods/RACGestureRecognizerActionHandler.h>
#import <JobsByOCPods/UIGestureRecognizer+ReactiveCocoaProtected.h>
#import <JobsByOCPods/UIGestureRecognizer+ReactiveCocoa.h>

#endif /* UIGestureRecognizer_RAC_h */

/**
 UITapGestureRecognizer *tapGesture = UITapGestureRecognizer.rac_recognizer;
 [tapGesture.rac_gestureSignal subscribeNext:^(__kindof UIGestureRecognizer * _Nullable gesture) {
     JobsLog(@"");
 }];
 self.topBar.addGesture(tapGesture);
 */

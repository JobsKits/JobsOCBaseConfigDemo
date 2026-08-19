//
//  JobsOCNumberStepper.h
//  JobsOCNumberStepper
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#ifndef JobsOCNumberStepper_h
#define JobsOCNumberStepper_h

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCNumberStepper : UIControl

Prop_assign(readonly)NSInteger value;
Prop_strong(readonly, nullable)NSNumber *minimumValue;
Prop_strong(readonly, nullable)NSNumber *maximumValue;
Prop_assign(readonly)NSInteger stepValue;
Prop_strong(readonly)UIButton *decreaseButton;
Prop_strong(readonly)UITextField *textField;
Prop_strong(readonly)UIButton *increaseButton;

-(JobsRetJobsOCNumberStepperByNSIntegerBlock _Nonnull)byValue;
-(JobsRetJobsOCNumberStepperByNumberBlock _Nonnull)byMinimumValue;
-(JobsRetJobsOCNumberStepperByNumberBlock _Nonnull)byMaximumValue;
-(JobsRetJobsOCNumberStepperByNSIntegerBlock _Nonnull)byStepValue;
-(instancetype)configureWithValue:(NSInteger)value
                     minimumValue:(nullable NSNumber *)minimumValue
                     maximumValue:(nullable NSNumber *)maximumValue
                         stepValue:(NSInteger)stepValue;
-(void)setBoundsWithMinimumValue:(nullable NSNumber *)minimumValue
                   maximumValue:(nullable NSNumber *)maximumValue;
-(void)setValue:(NSInteger)value sendActions:(BOOL)sendActions;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsOCNumberStepper_h */

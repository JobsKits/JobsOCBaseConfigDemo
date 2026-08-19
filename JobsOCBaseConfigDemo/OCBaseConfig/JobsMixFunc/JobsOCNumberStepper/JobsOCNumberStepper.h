//
//  JobsOCNumberStepper.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#ifndef JobsOCNumberStepper_h

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#define JobsOCNumberStepper_h

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsBaseUI.h"
#import "JobsMakes.h"
#import "JobsOCDSL.h"
#import "JobsDefines.h"

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

-(JobsRetCGSizeByVoidBlock _Nonnull)jobsIntrinsicContentSize;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsOCNumberStepper_h */

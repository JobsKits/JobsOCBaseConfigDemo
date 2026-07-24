//
//  JobsOCNumberStepper.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#ifndef JobsOCNumberStepper_h
#define JobsOCNumberStepper_h

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
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

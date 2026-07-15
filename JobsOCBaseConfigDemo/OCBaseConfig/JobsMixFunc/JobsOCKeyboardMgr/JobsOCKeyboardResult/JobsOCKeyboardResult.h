//
//  JobsOCKeyboardResult.h
//  JobsOCKeyboardMgr
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#ifndef JobsOCKeyboardResult_h
#define JobsOCKeyboardResult_h

#import <UIKit/UIKit.h>
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCKeyboardResult : NSObject

Prop_assign() BOOL keyboardVisible;
Prop_assign() BOOL shouldAdjust;
Prop_assign() CGFloat offsetY;
Prop_assign() CGRect keyboardFrameInContainer;
Prop_assign() CGRect accessoryFrameInContainer;
Prop_assign() CGRect obstructionFrameInContainer;
Prop_assign() CGRect targetFrameInContainer;
Prop_assign() CGRect triggerFrameInContainer;
Prop_assign() NSTimeInterval animationDuration;
Prop_assign() UIViewAnimationOptions animationOptions;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsOCKeyboardResult_h */

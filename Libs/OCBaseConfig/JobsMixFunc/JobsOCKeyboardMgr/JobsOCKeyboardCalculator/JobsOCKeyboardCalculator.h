//
//  JobsOCKeyboardCalculator.h
//  JobsOCKeyboardMgr
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#ifndef JobsOCKeyboardCalculator_h
#define JobsOCKeyboardCalculator_h

#import <UIKit/UIKit.h>
#import "JobsOCKeyboardConfig.h"
#import "JobsOCKeyboardResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCKeyboardCalculator : NSObject

+(__kindof JobsOCKeyboardResult *)resultByConfig:(__kindof JobsOCKeyboardConfig *_Nullable)config
                                  notification:(NSNotification *_Nullable)notification;
+(__kindof JobsOCKeyboardResult *)resultByConfig:(__kindof JobsOCKeyboardConfig *_Nullable)config
                           keyboardFrameInScreen:(CGRect)keyboardFrameInScreen
                                        userInfo:(NSDictionary *_Nullable)userInfo;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsOCKeyboardCalculator_h */

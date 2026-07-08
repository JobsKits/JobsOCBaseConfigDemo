//
//  JobsDefineKeyboardEnums.h
//  JobsOCDefs
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#ifndef JobsDefineKeyboardEnums_h
#define JobsDefineKeyboardEnums_h

#import <Foundation/Foundation.h>

#pragma mark —— 键盘相关
typedef NS_ENUM(NSUInteger, JobsOCKeyboardApplyMode) {
    JobsOCKeyboardApplyModeNone = 0,
    JobsOCKeyboardApplyModeTransform
};

typedef NS_ENUM(NSUInteger, JobsOCKeyboardAccessoryPolicy) {
    JobsOCKeyboardAccessoryPolicyAuto = 0,
    JobsOCKeyboardAccessoryPolicyIgnore,
    JobsOCKeyboardAccessoryPolicyDeclaredHeight
};

#endif /* JobsDefineKeyboardEnums_h */

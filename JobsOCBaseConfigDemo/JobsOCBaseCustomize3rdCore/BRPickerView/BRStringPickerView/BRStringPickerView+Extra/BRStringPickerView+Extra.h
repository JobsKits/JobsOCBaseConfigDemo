//
//  BRStringPickerView+Extra.h
//  FM
//
//  Created by Admin on 26/11/2024.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "BRStringPickerView.h"

#if __has_include(<BRPickerView/BRPickerView.h>)
#import <BRPickerView/BRPickerView.h>
#else
#import "BRPickerView.h"
#endif

typedef BRTextPickerMode BRStringPickerMode;

#ifndef BRStringPickerComponentSingle
#define BRStringPickerComponentSingle BRTextPickerComponentSingle
#endif

#ifndef BRStringPickerComponentMulti
#define BRStringPickerComponentMulti BRTextPickerComponentMulti
#endif

#ifndef BRStringPickerComponentCascade
#define BRStringPickerComponentCascade BRTextPickerComponentCascade
#endif

#ifndef BRStringPickerComponentLinkage
#define BRStringPickerComponentLinkage BRTextPickerComponentCascade
#endif

NS_ASSUME_NONNULL_BEGIN

@interface BRStringPickerView (Extra)

+(JobsReturnBRStringPickerViewByPickerModeBlock _Nonnull)initBy;

@end

NS_ASSUME_NONNULL_END

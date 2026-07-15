//
//  BRTextPickerView+Extra.m
//  BRPickerViewExtra
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Updated for latest BRPickerView on 2026年5月29日，星期五.
//

#import "BRTextPickerView+Extra.h"

@implementation BRTextPickerView (Extra)
+(BRPickerViewExtraRetTextPickerViewByPickerModeBlock)initBy {
    return ^BRTextPickerView *_Nonnull(BRTextPickerMode mode) {
        return [[BRTextPickerView alloc] initWithPickerMode:mode];
    };
}

@end

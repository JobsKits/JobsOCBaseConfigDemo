//
//  BRStringPickerView+Extra.m
//  JobsOCBaseConfigDemo
//
//  Created by Admin on 26/11/2024.
//

#import "BRStringPickerView+Extra.h"

#ifndef BRStringPickerView
@implementation BRStringPickerView (Extra)

+(JobsRetBRStringPickerViewByPickerModeBlock _Nonnull)initBy{
    return ^BRStringPickerView *_Nonnull(BRStringPickerMode mode){
        return [BRStringPickerView.alloc initWithPickerMode:mode];
    };
}

@end
#endif

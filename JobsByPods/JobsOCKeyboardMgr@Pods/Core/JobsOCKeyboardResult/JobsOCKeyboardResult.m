//
//  JobsOCKeyboardResult.m
//  JobsOCKeyboardMgr
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#import "JobsOCKeyboardResult.h"

@implementation JobsOCKeyboardResult

-(instancetype)init{
    if (self = [super init]) {
        _keyboardFrameInContainer = CGRectNull;
        _accessoryFrameInContainer = CGRectNull;
        _obstructionFrameInContainer = CGRectNull;
        _targetFrameInContainer = CGRectNull;
        _triggerFrameInContainer = CGRectNull;
        _animationDuration = 0.25f;
        _animationOptions = UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction;
    };return self;
}

@end

//
//  JobsOCKeyboardCalculator.m
//  JobsOCKeyboardMgr
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#import "JobsOCKeyboardCalculator.h"

@implementation JobsOCKeyboardCalculator

+(__kindof UIView *)containerViewByConfig:(__kindof JobsOCKeyboardConfig *)config{
    if (config.containerView) return config.containerView;
    if (config.targetView.window) return config.targetView.window;
    return config.targetView.superview;
}

+(CGRect)accessoryFrameByConfig:(__kindof JobsOCKeyboardConfig *)config
                      container:(__kindof UIView *)container
                  keyboardFrame:(CGRect)keyboardFrame{
    if (config.accessoryPolicy == JobsOCKeyboardAccessoryPolicyIgnore) return CGRectNull;

    UIView *accessoryView = config.accessoryView ?: config.triggerView.inputAccessoryView;
    if (config.accessoryPolicy == JobsOCKeyboardAccessoryPolicyAuto && accessoryView) {
        if (accessoryView.window) {
            return [container convertRect:accessoryView.bounds fromView:accessoryView];
        }
        CGFloat height = CGRectGetHeight(accessoryView.bounds);
        if (height > 0) {
            return CGRectMake(CGRectGetMinX(keyboardFrame),
                              CGRectGetMinY(keyboardFrame) - height,
                              CGRectGetWidth(keyboardFrame),
                              height);
        }
    }

    CGFloat accessoryHeight = config.accessoryHeight;
    if (config.accessoryPolicy == JobsOCKeyboardAccessoryPolicyDeclaredHeight && accessoryHeight > 0) {
        return CGRectMake(CGRectGetMinX(keyboardFrame),
                          CGRectGetMinY(keyboardFrame) - accessoryHeight,
                          CGRectGetWidth(keyboardFrame),
                          accessoryHeight);
    };return CGRectNull;
}

+(UIViewAnimationOptions)animationOptionsByUserInfo:(NSDictionary *)userInfo{
    NSNumber *curveNumber = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    NSInteger curve = curveNumber ? curveNumber.integerValue : UIViewAnimationCurveEaseInOut;
    return (UIViewAnimationOptions)(curve << 16) |
           UIViewAnimationOptionBeginFromCurrentState |
           UIViewAnimationOptionAllowUserInteraction;
}

+(BOOL)rect:(CGRect)left horizontallyIntersectsRect:(CGRect)right{
    return CGRectGetMaxX(left) > CGRectGetMinX(right) &&
           CGRectGetMinX(left) < CGRectGetMaxX(right);
}

+(__kindof JobsOCKeyboardResult *)resultByConfig:(__kindof JobsOCKeyboardConfig *)config
                                  notification:(NSNotification *)notification{
    NSDictionary *userInfo = notification.userInfo ?: @{};
    CGRect keyboardEndFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    return [self resultByConfig:config
          keyboardFrameInScreen:keyboardEndFrame
                       userInfo:userInfo];
}

+(__kindof JobsOCKeyboardResult *)resultByConfig:(__kindof JobsOCKeyboardConfig *)config
                           keyboardFrameInScreen:(CGRect)keyboardFrameInScreen
                                        userInfo:(NSDictionary *)userInfo{
    JobsOCKeyboardResult *result = JobsOCKeyboardResult.new;
    userInfo = userInfo ?: @{};
    NSNumber *durationNumber = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    if (durationNumber) result.animationDuration = durationNumber.doubleValue;
    result.animationOptions = [self animationOptionsByUserInfo:userInfo];

    if (!config.isValid) return result;
    UIView *container = [self containerViewByConfig:config];
    UIView *targetView = config.targetView;
    if (!container || !targetView) return result;
    UIView *triggerView = config.triggerView ?: targetView;

    if (CGRectIsNull(keyboardFrameInScreen) || CGRectIsEmpty(keyboardFrameInScreen)) return result;
    CGRect keyboardFrame = [container convertRect:keyboardFrameInScreen fromView:nil];
    result.keyboardFrameInContainer = keyboardFrame;
    result.targetFrameInContainer = [container convertRect:targetView.bounds fromView:targetView];
    result.triggerFrameInContainer = [container convertRect:triggerView.bounds fromView:triggerView];

    BOOL hasKeyboardSize = CGRectGetWidth(keyboardFrame) > 0 && CGRectGetHeight(keyboardFrame) > 0;
    BOOL keyboardVisible = hasKeyboardSize &&
                           CGRectIntersectsRect(container.bounds, keyboardFrame) &&
                           CGRectGetMinY(keyboardFrame) < CGRectGetMaxY(container.bounds);
    result.keyboardVisible = keyboardVisible;
    if (!keyboardVisible) return result;

    CGRect accessoryFrame = [self accessoryFrameByConfig:config
                                              container:container
                                          keyboardFrame:keyboardFrame];
    result.accessoryFrameInContainer = accessoryFrame;

    CGRect obstructionFrame = keyboardFrame;
    if (!CGRectIsNull(accessoryFrame) && !CGRectIsEmpty(accessoryFrame)) {
        obstructionFrame = CGRectUnion(obstructionFrame, accessoryFrame);
    }
    result.obstructionFrameInContainer = obstructionFrame;

    if (config.shouldCheckHorizontalOverlap &&
        ![self rect:result.triggerFrameInContainer horizontallyIntersectsRect:obstructionFrame]) {
        return result;
    }

    CGFloat targetBottom = CGRectGetMaxY(result.triggerFrameInContainer) + MAX(0, config.extraSpacing);
    CGFloat rawOffset = MAX(0, targetBottom - CGRectGetMinY(obstructionFrame));
    CGFloat safeTop = container.safeAreaInsets.top + MAX(0, config.topSpacing);
    CGFloat maxLift = config.maxLiftDistance > 0
        ? config.maxLiftDistance
        : MAX(0, CGRectGetMinY(result.targetFrameInContainer) - safeTop);
    result.offsetY = MIN(rawOffset, maxLift);
    result.shouldAdjust = result.offsetY > 0;
    return result;
}

@end

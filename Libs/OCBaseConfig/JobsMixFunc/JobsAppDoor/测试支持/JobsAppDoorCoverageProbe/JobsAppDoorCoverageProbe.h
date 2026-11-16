//
//  JobsAppDoorCoverageProbe.h
//  JobsAppDoor
//
//  Created by Jobs on 2026年11月4日，星期三.
//

#import <UIKit/UIKit.h>

#ifndef JobsAppDoorCoverageProbe_h
#define JobsAppDoorCoverageProbe_h

NS_INLINE BOOL JobsAppDoorCoverageEnabled(void) {
#if DEBUG
    return [NSProcessInfo.processInfo.arguments containsObject:@"--jobs-coverage-route"];
#else
    return NO;
#endif
}

NS_INLINE void JobsAppDoorCoverageName(UIView *button, NSString *identifier) {
    if (!JobsAppDoorCoverageEnabled()) {
        return;
    }
    button.accessibilityIdentifier = identifier;
}

NS_INLINE UITextField * _Nullable JobsAppDoorCoverageUniqueTextField(UIView *input) {
    NSMutableArray<UIView *> *queue = [NSMutableArray arrayWithObject:input];
    UITextField *field = nil;
    for (NSUInteger index = 0; index < queue.count; index++) {
        UIView *view = queue[index];
        if ([view isKindOfClass:UITextField.class]) {
            if (field) {
                return nil;
            }
            field = (UITextField *)view;
        }
        [queue addObjectsFromArray:view.subviews];
    }
    return field;
}

// 创建时只登记角色；父表单按真实字段 ID 绑定，不依赖分配顺序。
NS_INLINE void JobsAppDoorCoverageBindInput(UIView *input, NSString *fieldID) {
    if (!JobsAppDoorCoverageEnabled()) {
        return;
    }
    NSMutableArray<UIView *> *queue = [NSMutableArray arrayWithObject:input];
    NSString *prefix = @"jobs.coverage.auth.role.";
    for (NSUInteger index = 0; index < queue.count; index++) {
        UIView *view = queue[index];
        if ([view.accessibilityIdentifier hasPrefix:prefix]) {
            NSString *role = [view.accessibilityIdentifier substringFromIndex:prefix.length];
            view.accessibilityIdentifier = [fieldID stringByAppendingFormat:@".%@", role];
        }
        [queue addObjectsFromArray:view.subviews];
    }
}

// 仅从原业务长按 block 调用；不安装识别器、不合成触摸或业务回调。
NS_INLINE void JobsAppDoorCoverageLongPress(id sender) {
    if (!JobsAppDoorCoverageEnabled() || ![sender isKindOfClass:UIView.class]) {
        return;
    }
    UIView *button = sender;
    UILongPressGestureRecognizer *active = nil;
    NSUInteger count = 0;
    for (UIGestureRecognizer *gesture in button.gestureRecognizers) {
        if ([gesture isKindOfClass:UILongPressGestureRecognizer.class] &&
            gesture.state != UIGestureRecognizerStatePossible &&
            gesture.state != UIGestureRecognizerStateFailed) {
            active = (UILongPressGestureRecognizer *)gesture;
            count += 1;
        }
    }
    if (count != 1) {
        button.accessibilityValue = @"longPress:ambiguousRecognizer";
        return;
    }
    if (active.state == UIGestureRecognizerStateBegan) {
        button.accessibilityValue = @"longPress:began";
    } else if (active.state == UIGestureRecognizerStateEnded) {
        button.accessibilityValue = [button.accessibilityValue isEqualToString:@"longPress:began"]
            ? @"longPress:completed" : @"longPress:missingBegan";
    } else if (active.state == UIGestureRecognizerStateCancelled) {
        button.accessibilityValue = @"longPress:cancelled";
    }
}

#endif

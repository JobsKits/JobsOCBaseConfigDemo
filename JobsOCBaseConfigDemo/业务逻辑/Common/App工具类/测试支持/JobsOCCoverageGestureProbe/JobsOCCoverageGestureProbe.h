//
//  JobsOCCoverageGestureProbe.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年11月4日，星期三.
//

#import <UIKit/UIKit.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#ifndef JobsOCCoverageGestureProbe_h
#define JobsOCCoverageGestureProbe_h

NS_INLINE BOOL JobsOCCoverageGestureProbeEnabled(void) {
#if DEBUG
    return [NSProcessInfo.processInfo.arguments containsObject:@"--jobs-coverage-route"];
#else
    return NO;
#endif
}

NS_INLINE void JobsOCCoveragePrepareLongPressButton(UIView * _Nullable button,
                                                   NSString * _Nonnull identifier) {
#if DEBUG
    if (!JobsOCCoverageGestureProbeEnabled() || !button) {
        return;
    }
    if (![button.accessibilityIdentifier isEqualToString:identifier]) {
        button.accessibilityIdentifier = identifier;
        button.accessibilityValue = @"longPress:idle";
    }
#endif
}

// 同一注册点先给真实实例互异的临时ID；宿主随后按真实row/section绑定最终ID。
NS_INLINE void JobsOCCoveragePrepareIndexedLongPressButton(UIView * _Nullable button,
                                                          NSString * _Nonnull prefix) {
#if DEBUG
    if (!JobsOCCoverageGestureProbeEnabled() || !button) {
        return;
    }
    static NSMutableDictionary<NSString *, NSMapTable<UIView *, NSString *> *> *targets;
    static NSMutableDictionary<NSString *, NSNumber *> *nextIndexes;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        targets = NSMutableDictionary.dictionary;
        nextIndexes = NSMutableDictionary.dictionary;
    });
    NSMapTable<UIView *, NSString *> *table = targets[prefix];
    if (!table) {
        table = NSMapTable.weakToStrongObjectsMapTable;
        targets[prefix] = table;
    }
    NSString *identifier = [table objectForKey:button];
    if (!identifier) {
        NSUInteger index = [nextIndexes[prefix] unsignedIntegerValue];
        nextIndexes[prefix] = @(index + 1);
        identifier = [NSString stringWithFormat:@"%@.%lu", prefix, (unsigned long)index];
        [table setObject:identifier forKey:button];
    }
    JobsOCCoveragePrepareLongPressButton(button, identifier);
#endif
}

// 显式组件 fixture：只提供 UIKit 普通响应链的触摸面，不绑定 target 或 recognizer。
NS_INLINE void JobsOCCoverageInstallTouchSurface(UIView * _Nonnull host,
                                                NSString * _Nonnull identifier) {
#if DEBUG
    if (!JobsOCCoverageGestureProbeEnabled()) {
        return;
    }
    for (UIView *existing in host.subviews) {
        if ([existing.accessibilityIdentifier isEqualToString:identifier]) {
            return;
        }
    }
    UILabel *surface = UILabel.new;
    surface.text = @"巡检组件：原始触摸响应链";
    surface.font = [UIFont systemFontOfSize:12];
    surface.textAlignment = NSTextAlignmentCenter;
    surface.backgroundColor = UIColor.secondarySystemBackgroundColor;
    surface.textColor = UIColor.labelColor;
    surface.userInteractionEnabled = YES;
    surface.isAccessibilityElement = YES;
    surface.accessibilityIdentifier = identifier;
    [host addSubview:surface];
    [surface mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(host);
        make.width.mas_equalTo(210);
        make.height.mas_equalTo(30);
    }];
#endif
}

NS_INLINE UIButton * _Nullable JobsOCCoverageUniqueButtonInView(UIView * _Nonnull root) {
    NSMutableArray<UIView *> *queue = [NSMutableArray arrayWithObject:root];
    UIButton *found = nil;
    for (NSUInteger index = 0; index < queue.count; index++) {
        UIView *view = queue[index];
        if ([view isKindOfClass:UIButton.class]) {
            if (found) {
                return nil;
            }
            found = (UIButton *)view;
        }
        [queue addObjectsFromArray:view.subviews];
    }
    return found;
}

NS_INLINE void JobsOCCoverageRetagLongPressReceiver(UIView * _Nonnull root,
                                                   NSString * _Nonnull prefix,
                                                   NSString * _Nonnull suffix) {
#if DEBUG
    if (!JobsOCCoverageGestureProbeEnabled()) {
        return;
    }
    NSMutableArray<UIView *> *queue = [NSMutableArray arrayWithObject:root];
    NSMutableArray<UIView *> *matches = NSMutableArray.array;
    for (NSUInteger index = 0; index < queue.count; index++) {
        UIView *view = queue[index];
        if ([view.accessibilityIdentifier hasPrefix:[prefix stringByAppendingString:@"."]]) {
            [matches addObject:view];
        }
        [queue addObjectsFromArray:view.subviews];
    }
    if (matches.count == 1) {
        JobsOCCoveragePrepareLongPressButton(matches.firstObject,
            [NSString stringWithFormat:@"%@.%@", prefix, suffix]);
    }
#endif
}

NS_INLINE void JobsOCCoverageLongPressRecognizerDelivered(UIView * _Nonnull button,
                                                          UILongPressGestureRecognizer * _Nonnull gesture) {
#if DEBUG
    if (!JobsOCCoverageGestureProbeEnabled() || gesture.view != button) {
        return;
    }
    if (gesture.state == UIGestureRecognizerStateBegan) {
        button.accessibilityValue = @"longPress:began";
    } else if (gesture.state == UIGestureRecognizerStateEnded) {
        button.accessibilityValue = [button.accessibilityValue isEqualToString:@"longPress:began"]
            ? @"longPress:completed" : @"longPress:missingBegan";
    } else if (gesture.state == UIGestureRecognizerStateCancelled) {
        button.accessibilityValue = @"longPress:cancelled";
    }
#endif
}

// 只能从原业务 block 内调用；不安装手势，也不代替业务回调。
NS_INLINE void JobsOCCoverageLongPressDelivered(id _Nullable sender) {
#if DEBUG
    if (!JobsOCCoverageGestureProbeEnabled() || ![sender isKindOfClass:UIView.class]) {
        return;
    }
    UIView *button = (UIView *)sender;
    UILongPressGestureRecognizer *active = nil;
    NSUInteger activeCount = 0;
    for (UIGestureRecognizer *gesture in button.gestureRecognizers) {
        if (![gesture isKindOfClass:UILongPressGestureRecognizer.class] ||
            gesture.state == UIGestureRecognizerStatePossible ||
            gesture.state == UIGestureRecognizerStateFailed) {
            continue;
        }
        active = (UILongPressGestureRecognizer *)gesture;
        activeCount += 1;
    }
    if (activeCount != 1) {
        button.accessibilityValue = @"longPress:ambiguousRecognizer";
        return;
    }
    JobsOCCoverageLongPressRecognizerDelivered(button, active);
#endif
}

#endif

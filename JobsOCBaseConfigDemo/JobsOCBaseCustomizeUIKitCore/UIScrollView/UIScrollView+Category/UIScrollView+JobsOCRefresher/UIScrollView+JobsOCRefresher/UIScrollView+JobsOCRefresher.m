//
//  UIScrollView+JobsOCRefresher.m
//  JobsOCRefresher
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "UIScrollView+JobsOCRefresher.h"
#import <objc/runtime.h>
#import <AudioToolbox/AudioToolbox.h>

static void *JobsOCRefreshKVOContext = &JobsOCRefreshKVOContext;
static char JobsOCRefreshProxyKey;

@interface JobsOCRefreshSlot : NSObject

Prop_assign() JobsOCRefreshPosition position;
Prop_assign() JobsOCRefreshRole role;
Prop_assign() CGFloat trigger;
Prop_assign() BOOL ending;
Prop_weak() UIScrollView *scrollView;
Prop_strong() JobsOCRefreshComponent *component;
Prop_copy() JobsOCRefreshActionBlock action;

- (instancetype)initWithPosition:(JobsOCRefreshPosition)position
                             role:(JobsOCRefreshRole)role
                           config:(JobsOCRefreshConfig *)config
                           action:(JobsOCRefreshActionBlock)action;
- (void)attachToScrollView:(UIScrollView *)scrollView;
- (void)detach;
- (void)layoutInScrollView:(UIScrollView *)scrollView;
- (void)handleWithScrollView:(UIScrollView *)scrollView;
- (void)beginRefreshing;
- (void)reset;
- (void)fail;
- (void)disable;
- (void)noticeNoMoreData;

@end

@interface JobsOCRefreshProxy : NSObject

Prop_weak() UIScrollView *scrollView;
Prop_assign() BOOL observing;
Prop_assign() BOOL enablesHaptics;
Prop_assign() BOOL usesCustomHapticsSetting;
Prop_assign() JobsOCRefreshHorizontalMode horizontalMode;
Prop_copy(nullable) NSString *soundName;
Prop_strong(nullable) JobsOCRefreshSlot *header;
Prop_strong(nullable) JobsOCRefreshSlot *footer;
Prop_strong(nullable) JobsOCRefreshSlot *left;
Prop_strong(nullable) JobsOCRefreshSlot *right;

- (instancetype)initWithScrollView:(UIScrollView *)scrollView;
- (JobsOCRefreshSlot *)slotForPosition:(JobsOCRefreshPosition)position;
- (void)setSlot:(JobsOCRefreshSlot *)slot position:(JobsOCRefreshPosition)position;
- (void)tick;
- (void)playFeedbackForPosition:(JobsOCRefreshPosition)position;
- (void)playHapticFeedback;
- (void)playSoundNamed:(NSString *)soundName;
- (NSURL *)soundURLForName:(NSString *)soundName;

@end

@implementation JobsOCRefreshSlot

- (instancetype)initWithPosition:(JobsOCRefreshPosition)position
                             role:(JobsOCRefreshRole)role
                           config:(JobsOCRefreshConfig *)config
                           action:(JobsOCRefreshActionBlock)action {
    if (self = super.init) {
        _position = position;
        _role = role;
        _trigger = config.triggerDistance > 0 ? config.triggerDistance : 60;
        _component = [[JobsOCRefreshComponent alloc] initWithPosition:position role:role config:config];
        _component.hidden = !config.showsInfo;
        _action = action;
    };return self;
}

- (void)attachToScrollView:(UIScrollView *)scrollView {
    self.scrollView = scrollView;
    if (self.component.superview != scrollView) {
        [scrollView addSubview:self.component];
    }
    [self layoutInScrollView:scrollView];
}

- (void)detach {
    [self.component removeFromSuperview];
    [self.component applyState:JobsOCRefreshStateRemoved progress:0];
}

- (void)layoutInScrollView:(UIScrollView *)scrollView {
    CGFloat length = self.component.refreshLength;
    UIEdgeInsets baseInset = scrollView.contentInset;
    if (self.component.state == JobsOCRefreshStateRefreshing ||
        self.component.state == JobsOCRefreshStateEnding) {
        switch (self.position) {
            case JobsOCRefreshPositionHeader: baseInset.top = MAX(0, baseInset.top - length); break;
            case JobsOCRefreshPositionFooter: baseInset.bottom = MAX(0, baseInset.bottom - length); break;
            case JobsOCRefreshPositionLeft: baseInset.left = MAX(0, baseInset.left - length); break;
            case JobsOCRefreshPositionRight: baseInset.right = MAX(0, baseInset.right - length); break;
        }
    }
    CGSize boundsSize = scrollView.bounds.size;
    switch (self.position) {
        case JobsOCRefreshPositionHeader:
            self.component.frame = CGRectMake(0, -length - baseInset.top, boundsSize.width, length);
            break;
        case JobsOCRefreshPositionFooter: {
            CGFloat contentH = MAX(scrollView.contentSize.height,
                                   boundsSize.height - scrollView.adjustedContentInset.top - scrollView.adjustedContentInset.bottom);
            self.component.frame = CGRectMake(0, contentH + baseInset.bottom, boundsSize.width, length);
            break;
        }
        case JobsOCRefreshPositionLeft:
            self.component.frame = CGRectMake(-length - baseInset.left, 0, length, boundsSize.height);
            break;
        case JobsOCRefreshPositionRight: {
            CGFloat contentW = MAX(scrollView.contentSize.width,
                                   boundsSize.width - scrollView.adjustedContentInset.left - scrollView.adjustedContentInset.right);
            self.component.frame = CGRectMake(contentW + baseInset.right, 0, length, boundsSize.height);
            break;
        }
    }
}

- (void)handleWithScrollView:(UIScrollView *)scrollView {
    if (self.ending ||
        self.component.state == JobsOCRefreshStateRemoved ||
        self.component.state == JobsOCRefreshStateDisabled ||
        self.component.state == JobsOCRefreshStateRefreshing ||
        self.component.state == JobsOCRefreshStateNoMoreData) return;
    [self layoutInScrollView:scrollView];
    UIEdgeInsets inset = scrollView.adjustedContentInset;
    CGPoint offset = scrollView.contentOffset;
    CGFloat distance = 0;
    switch (self.position) {
        case JobsOCRefreshPositionHeader:
            distance = -(offset.y + inset.top);
            break;
        case JobsOCRefreshPositionFooter: {
            CGFloat contentH = MAX(scrollView.contentSize.height,
                                   scrollView.bounds.size.height - inset.top - inset.bottom);
            distance = offset.y + scrollView.bounds.size.height - contentH - inset.bottom;
            break;
        }
        case JobsOCRefreshPositionLeft:
            distance = -(offset.x + inset.left);
            break;
        case JobsOCRefreshPositionRight: {
            CGFloat contentW = MAX(scrollView.contentSize.width,
                                   scrollView.bounds.size.width - inset.left - inset.right);
            distance = offset.x + scrollView.bounds.size.width - contentW - inset.right;
            break;
        }
    }
    CGFloat progress = MAX(0, MIN(1, distance / self.trigger));
    if (scrollView.isDragging) {
        [self.component applyState:progress >= 1 ? JobsOCRefreshStateReady : JobsOCRefreshStatePulling
                          progress:progress];
    } else if (self.component.state == JobsOCRefreshStateReady) {
        [self beginRefreshing];
    } else if (self.component.state == JobsOCRefreshStatePulling) {
        [self.component applyState:JobsOCRefreshStateIdle progress:0];
    }
}

- (void)beginRefreshing {
    UIScrollView *scrollView = self.scrollView;
    if (!scrollView ||
        self.component.state == JobsOCRefreshStateRefreshing ||
        self.component.state == JobsOCRefreshStateDisabled ||
        self.component.state == JobsOCRefreshStateNoMoreData) return;
    [(JobsOCRefreshProxy *)objc_getAssociatedObject(scrollView, &JobsOCRefreshProxyKey) playFeedbackForPosition:self.position];
    [self.component applyState:JobsOCRefreshStateRefreshing progress:1];
    CGFloat length = self.component.refreshLength;
    UIEdgeInsets oldAdjusted = scrollView.adjustedContentInset;
    UIEdgeInsets inset = scrollView.contentInset;
    CGPoint targetOffset = scrollView.contentOffset;
    switch (self.position) {
        case JobsOCRefreshPositionHeader:
            inset.top += length;
            targetOffset.y = -(oldAdjusted.top + length);
            break;
        case JobsOCRefreshPositionFooter: {
            inset.bottom += length;
            CGFloat contentH = MAX(scrollView.contentSize.height,
                                   scrollView.bounds.size.height - oldAdjusted.top - oldAdjusted.bottom);
            targetOffset.y = contentH + oldAdjusted.bottom + length - scrollView.bounds.size.height;
            break;
        }
        case JobsOCRefreshPositionLeft:
            inset.left += length;
            targetOffset.x = -(oldAdjusted.left + length);
            break;
        case JobsOCRefreshPositionRight: {
            inset.right += length;
            CGFloat contentW = MAX(scrollView.contentSize.width,
                                   scrollView.bounds.size.width - oldAdjusted.left - oldAdjusted.right);
            targetOffset.x = contentW + oldAdjusted.right + length - scrollView.bounds.size.width;
            break;
        }
    }
    [UIView animateWithDuration:0.25 animations:^{
        scrollView.contentInset = inset;
        [scrollView setContentOffset:targetOffset animated:NO];
    }];
    if (self.action) {
        self.action();
    } else {
        [self reset];
    }
}

- (void)endWithFinalState:(JobsOCRefreshState)finalState {
    UIScrollView *scrollView = self.scrollView;
    if (!scrollView || self.component.state != JobsOCRefreshStateRefreshing) return;
    if (self.role == JobsOCRefreshRoleRefresh) {
        [self.component markRefreshedAt:NSDate.date];
    }
    UIEdgeInsets inset = scrollView.contentInset;
    CGFloat length = self.component.refreshLength;
    switch (self.position) {
        case JobsOCRefreshPositionHeader: inset.top -= length; break;
        case JobsOCRefreshPositionFooter: inset.bottom -= length; break;
        case JobsOCRefreshPositionLeft: inset.left -= length; break;
        case JobsOCRefreshPositionRight: inset.right -= length; break;
    }
    self.ending = YES;
    [self.component applyState:JobsOCRefreshStateEnding progress:0];
    [UIView animateWithDuration:0.25 animations:^{
        scrollView.contentInset = inset;
        [self layoutInScrollView:scrollView];
    } completion:^(__unused BOOL finished) {
        self.ending = NO;
        [self layoutInScrollView:scrollView];
        [self.component applyState:finalState progress:0];
    }];
}

- (void)reset {
    if (self.component.state == JobsOCRefreshStateRefreshing) {
        [self endWithFinalState:JobsOCRefreshStateIdle];
    } else {
        [self.component applyState:JobsOCRefreshStateIdle progress:0];
    }
}

- (void)fail {
    if (self.component.state == JobsOCRefreshStateRefreshing) {
        [self endWithFinalState:JobsOCRefreshStateFailed];
    } else {
        [self.component applyState:JobsOCRefreshStateFailed progress:0];
    }
}

- (void)disable {
    if (self.component.state == JobsOCRefreshStateRefreshing) {
        [self endWithFinalState:JobsOCRefreshStateDisabled];
    } else {
        [self.component applyState:JobsOCRefreshStateDisabled progress:0];
    }
}

- (void)noticeNoMoreData {
    if (self.role != JobsOCRefreshRoleLoadMore) return;
    [self.component applyState:JobsOCRefreshStateNoMoreData progress:0];
}

@end

@implementation JobsOCRefreshProxy

- (instancetype)initWithScrollView:(UIScrollView *)scrollView {
    if (self = super.init) {
        _scrollView = scrollView;
        _horizontalMode = JobsOCRefreshHorizontalModeRefreshRightLoadLeft;
        [self addObservers];
    };return self;
}

- (void)dealloc {
    [self removeObservers];
}

- (void)addObservers {
    if (self.observing || !self.scrollView) return;
    [self.scrollView addObserver:self
                      forKeyPath:@"contentOffset"
                         options:NSKeyValueObservingOptionNew
                         context:JobsOCRefreshKVOContext];
    [self.scrollView.panGestureRecognizer addObserver:self
                                           forKeyPath:@"state"
                                              options:NSKeyValueObservingOptionNew
                                              context:JobsOCRefreshKVOContext];
    self.observing = YES;
}

- (void)removeObservers {
    if (!self.observing || !self.scrollView) return;
    [self.scrollView removeObserver:self forKeyPath:@"contentOffset" context:JobsOCRefreshKVOContext];
    [self.scrollView.panGestureRecognizer removeObserver:self forKeyPath:@"state" context:JobsOCRefreshKVOContext];
    self.observing = NO;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
    if (context == JobsOCRefreshKVOContext) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self tick];
        });
        return;
    }
    [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
}

- (JobsOCRefreshSlot *)slotForPosition:(JobsOCRefreshPosition)position {
    switch (position) {
        case JobsOCRefreshPositionHeader: return self.header;
        case JobsOCRefreshPositionFooter: return self.footer;
        case JobsOCRefreshPositionLeft: return self.left;
        case JobsOCRefreshPositionRight: return self.right;
    }
}

- (void)setSlot:(JobsOCRefreshSlot *)slot position:(JobsOCRefreshPosition)position {
    switch (position) {
        case JobsOCRefreshPositionHeader: self.header = slot; break;
        case JobsOCRefreshPositionFooter: self.footer = slot; break;
        case JobsOCRefreshPositionLeft: self.left = slot; break;
        case JobsOCRefreshPositionRight: self.right = slot; break;
    }
}

- (void)tick {
    UIScrollView *scrollView = self.scrollView;
    if (!scrollView) return;
    [self.header handleWithScrollView:scrollView];
    [self.footer handleWithScrollView:scrollView];
    [self.left handleWithScrollView:scrollView];
    [self.right handleWithScrollView:scrollView];
}

- (void)playFeedbackForPosition:(JobsOCRefreshPosition)position {
    JobsOCRefreshSlot *slot = [self slotForPosition:position];
    JobsOCRefreshConfig *config = slot.component.config;
    BOOL enablesHaptics = self.usesCustomHapticsSetting ? self.enablesHaptics : config.enablesHaptics;
    if (enablesHaptics) {
        [self playHapticFeedback];
    }
    NSString *soundName = config.soundName.length ? config.soundName : self.soundName;
    if (soundName.length) [self playSoundNamed:soundName];
}

- (void)playHapticFeedback {
    if (@available(iOS 10.0, *)) {
        UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
        [generator prepare];
        [generator impactOccurred];
    } else {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
}

- (void)playSoundNamed:(NSString *)soundName {
    NSURL *url = [self soundURLForName:soundName];
    if (!url) return;
    SystemSoundID soundID = 0;
    OSStatus status = AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    if (status != kAudioServicesNoError || !soundID) return;
    if (@available(iOS 9.0, *)) {
        AudioServicesPlaySystemSoundWithCompletion(soundID, ^{
            AudioServicesDisposeSystemSoundID(soundID);
        });
    } else {
        AudioServicesPlaySystemSound(soundID);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)),
                       dispatch_get_main_queue(), ^{
            AudioServicesDisposeSystemSoundID(soundID);
        });
    }
}

- (NSURL *)soundURLForName:(NSString *)soundName {
    if (!soundName.length) return nil;
    if ([NSFileManager.defaultManager fileExistsAtPath:soundName]) {
        return [NSURL fileURLWithPath:soundName];
    }
    NSString *base = soundName.stringByDeletingPathExtension.length ? soundName.stringByDeletingPathExtension : soundName;
    NSString *ext = soundName.pathExtension.length ? soundName.pathExtension : @"wav";
    return [NSBundle.mainBundle URLForResource:base withExtension:ext];
}

@end

@implementation UIScrollView (JobsOCRefresher)

- (JobsOCRefreshProxy *)jobs_refreshProxy {
    JobsOCRefreshProxy *proxy = objc_getAssociatedObject(self, &JobsOCRefreshProxyKey);
    if (!proxy) {
        proxy = [[JobsOCRefreshProxy alloc] initWithScrollView:self];
        objc_setAssociatedObject(self, &JobsOCRefreshProxyKey, proxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    };return proxy;
}

- (__kindof UIScrollView *)jobs_setHorizontalRefreshMode:(JobsOCRefreshHorizontalMode)mode {
    self.jobs_refreshProxy.horizontalMode = mode;
    self.jobs_refreshProxy.left.role = JobsOCRefreshRoleForPosition(mode, JobsOCRefreshPositionLeft);
    self.jobs_refreshProxy.left.component.role = self.jobs_refreshProxy.left.role;
    self.jobs_refreshProxy.right.role = JobsOCRefreshRoleForPosition(mode, JobsOCRefreshPositionRight);
    self.jobs_refreshProxy.right.component.role = self.jobs_refreshProxy.right.role;
    return self;
}

- (__kindof UIScrollView *)jobs_enableRefreshHaptics:(BOOL)enable {
    self.jobs_refreshProxy.usesCustomHapticsSetting = YES;
    self.jobs_refreshProxy.enablesHaptics = enable;
    return self;
}

- (__kindof UIScrollView *)jobs_setRefreshSound:(nullable NSString *)soundName {
    self.jobs_refreshProxy.soundName = soundName;
    return self;
}

- (__kindof UIScrollView *)jobs_byRefreshHeaderWithAction:(JobsOCRefreshActionBlock)action {
    return [self jobs_byRefreshHeaderWithConfig:nil action:action];
}

- (__kindof UIScrollView *)jobs_byRefreshFooterWithAction:(JobsOCRefreshActionBlock)action {
    return [self jobs_byRefreshFooterWithConfig:nil action:action];
}

- (__kindof UIScrollView *)jobs_byRefreshHeaderWithConfig:(JobsOCRefreshConfig *)config
                                                   action:(JobsOCRefreshActionBlock)action {
    JobsOCRefreshConfig *realConfig = config ?: JobsOCRefreshConfig.defaultHeaderConfig;
    JobsOCRefreshSlot *slot = [[JobsOCRefreshSlot alloc] initWithPosition:JobsOCRefreshPositionHeader
                                                                     role:JobsOCRefreshRoleRefresh
                                                                   config:realConfig
                                                                   action:action];
    [self.jobs_refreshProxy setSlot:slot position:JobsOCRefreshPositionHeader];
    [slot attachToScrollView:self];
    return self;
}

- (__kindof UIScrollView *)jobs_byRefreshFooterWithConfig:(JobsOCRefreshConfig *)config
                                                   action:(JobsOCRefreshActionBlock)action {
    JobsOCRefreshConfig *realConfig = config ?: JobsOCRefreshConfig.defaultFooterConfig;
    JobsOCRefreshSlot *slot = [[JobsOCRefreshSlot alloc] initWithPosition:JobsOCRefreshPositionFooter
                                                                     role:JobsOCRefreshRoleLoadMore
                                                                   config:realConfig
                                                                   action:action];
    [self.jobs_refreshProxy setSlot:slot position:JobsOCRefreshPositionFooter];
    [slot attachToScrollView:self];
    return self;
}

- (__kindof UIScrollView *)jobs_bySideRefreshAt:(JobsOCRefreshPosition)position
                                         config:(JobsOCRefreshConfig *)config
                                         action:(JobsOCRefreshActionBlock)action {
    NSParameterAssert(position == JobsOCRefreshPositionLeft || position == JobsOCRefreshPositionRight);
    JobsOCRefreshHorizontalMode mode = self.jobs_refreshProxy.horizontalMode;
    JobsOCRefreshConfig *realConfig = config ?: (position == JobsOCRefreshPositionLeft ?
                                                 [JobsOCRefreshConfig defaultLeftConfigWithMode:mode] :
                                                 [JobsOCRefreshConfig defaultRightConfigWithMode:mode]);
    JobsOCRefreshRole role = JobsOCRefreshRoleForPosition(mode, position);
    JobsOCRefreshSlot *slot = [[JobsOCRefreshSlot alloc] initWithPosition:position
                                                                     role:role
                                                                   config:realConfig
                                                                   action:action];
    [self.jobs_refreshProxy setSlot:slot position:position];
    [slot attachToScrollView:self];
    return self;
}

- (__kindof UIScrollView *)jobs_switchRefreshAt:(JobsOCRefreshPosition)position
                                        toState:(JobsOCRefreshState)state {
    JobsOCRefreshSlot *slot = [self.jobs_refreshProxy slotForPosition:position];
    if (!slot) return self;
    switch (state) {
        case JobsOCRefreshStateRefreshing: [slot beginRefreshing]; break;
        case JobsOCRefreshStateIdle: [slot reset]; break;
        case JobsOCRefreshStateFailed: [slot fail]; break;
        case JobsOCRefreshStateDisabled: [slot disable]; break;
        case JobsOCRefreshStateNoMoreData: [slot noticeNoMoreData]; break;
        case JobsOCRefreshStateRemoved: [self jobs_removeRefreshAt:position]; break;
        case JobsOCRefreshStatePulling:
        case JobsOCRefreshStateReady:
        case JobsOCRefreshStateEnding:
            [slot.component applyState:state progress:0];
            break;
    };return self;
}

- (__kindof UIScrollView *)jobs_removeRefreshAt:(JobsOCRefreshPosition)position {
    JobsOCRefreshSlot *slot = [self.jobs_refreshProxy slotForPosition:position];
    [slot detach];
    [self.jobs_refreshProxy setSlot:nil position:position];
    return self;
}

@end

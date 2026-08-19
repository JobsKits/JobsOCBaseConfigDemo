//
//  UIScrollView+JobsOCRefresher.m
//  JobsOCRefresher
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "UIScrollView+JobsOCRefresher.h"

JobsKey(JobsOCRefreshKVOContext)
JobsKey(JobsOCRefreshProxyKey)
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
-(jobsByScrollViewBlock _Nonnull)attachToScrollView;
- (jobsByVoidBlock _Nonnull)detach;
-(jobsByScrollViewBlock _Nonnull)layoutInScrollView;
-(jobsByScrollViewBlock _Nonnull)handleWithScrollView;
-(JobsRetIDByIDBlock _Nonnull)byScrollView;
- (jobsByVoidBlock _Nonnull)beginRefreshing;
- (jobsByVoidBlock _Nonnull)reset;
- (jobsByVoidBlock _Nonnull)fail;
- (jobsByVoidBlock _Nonnull)disable;
- (jobsByVoidBlock _Nonnull)noticeNoMoreData;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCRefreshSlot
-(JobsRetJobsOCRefreshSlotByBOOLBlock _Nonnull)byEnding;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCRefreshSlot
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
-(JobsRetJobsOCRefreshSlotByJobsOCRefreshPositionBlock _Nonnull)slotForPosition;
- (void)setSlot:(JobsOCRefreshSlot *)slot position:(JobsOCRefreshPosition)position;
- (jobsByVoidBlock _Nonnull)tick;
-(jobsByJobsOCRefreshPositionBlock _Nonnull)playFeedbackForPosition;
- (jobsByVoidBlock _Nonnull)playHapticFeedback;
-(jobsByStrBlock _Nonnull)playSoundNamed;
-(JobsRetURLByStrBlock _Nonnull)soundURLForName;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCRefreshProxy
-(JobsRetJobsOCRefreshProxyByBOOLBlock _Nonnull)byObserving;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCRefreshProxy
@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCRefreshSlot
@interface JobsOCRefreshSlot (JobsPropertyDSLSetterAutogen_fbe4b3658b)
-(void)setEnding:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCRefreshSlot

@implementation JobsOCRefreshSlot
-(JobsRetIDByIDBlock _Nonnull)byScrollView{
    @jobs_weakify(self)
    return ^id(UIScrollView *scrollView){
        @jobs_strongify(self)
        self.scrollView = scrollView;
        return self;
    };
}
- (instancetype)initWithPosition:(JobsOCRefreshPosition)position
                             role:(JobsOCRefreshRole)role
                           config:(JobsOCRefreshConfig *)config
                           action:(JobsOCRefreshActionBlock)action {
    if (self = super.init) {
        _position = position;
        _role = role;
        _trigger = config.triggerDistance > 0 ? config.triggerDistance : 60;
        _component = [[JobsOCRefreshComponent alloc] initWithPosition:position role:role config:config];
        _component.byHidden(!config.showsInfo);
        _action = action;
    };return self;
}

-(jobsByScrollViewBlock _Nonnull)attachToScrollView{
    @jobs_weakify(self)
    return ^(UIScrollView * scrollView){
        @jobs_strongify(self)
        if (!self) return;
        self.byScrollView(scrollView);
        if (self.component.superview != scrollView) {
            self.component.addOn(scrollView);
        }
        self.layoutInScrollView(scrollView);
    };
}

- (jobsByVoidBlock _Nonnull)detach {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.component.byRemoveFromSuperview();
        [self.component applyState:JobsOCRefreshStateRemoved progress:0];
    };
}

-(jobsByScrollViewBlock _Nonnull)layoutInScrollView{
    @jobs_weakify(self)
    return ^(UIScrollView * scrollView){
        @jobs_strongify(self)
        if (!self) return;
        CGFloat length = self.component.refreshLength();
        UIEdgeInsets baseInset = scrollView.contentInset;
        if (self.component.state == JobsOCRefreshStateRefreshing ||
            self.component.state == JobsOCRefreshStateEnding) {
            switch (self.position) {
                /// 处理 JobsOCRefreshPositionHeader 分支
                case JobsOCRefreshPositionHeader: baseInset.top = MAX(0, baseInset.top - length); break;
                /// 处理 JobsOCRefreshPositionFooter 分支
                case JobsOCRefreshPositionFooter: baseInset.bottom = MAX(0, baseInset.bottom - length); break;
                /// 处理 JobsOCRefreshPositionLeft 分支
                case JobsOCRefreshPositionLeft: baseInset.left = MAX(0, baseInset.left - length); break;
                /// 处理 JobsOCRefreshPositionRight 分支
                case JobsOCRefreshPositionRight: baseInset.right = MAX(0, baseInset.right - length); break;
            }
        }
        CGSize boundsSize = scrollView.bounds.size;
        switch (self.position) {
            /// 处理 JobsOCRefreshPositionHeader 分支
            case JobsOCRefreshPositionHeader:
                self.component.byFrame(CGRectMake(0, -length - baseInset.top, boundsSize.width, length));
                break;
            /// 处理 JobsOCRefreshPositionFooter 分支
            case JobsOCRefreshPositionFooter: {
                CGFloat contentH = MAX(scrollView.contentSize.height,
                                       boundsSize.height - scrollView.adjustedContentInset.top - scrollView.adjustedContentInset.bottom);
                self.component.byFrame(CGRectMake(0, contentH + baseInset.bottom, boundsSize.width, length));
                break;
            }
            /// 处理 JobsOCRefreshPositionLeft 分支
            case JobsOCRefreshPositionLeft:
                self.component.byFrame(CGRectMake(-length - baseInset.left, 0, length, boundsSize.height));
                break;
            /// 处理 JobsOCRefreshPositionRight 分支
            case JobsOCRefreshPositionRight: {
                CGFloat contentW = MAX(scrollView.contentSize.width,
                                       boundsSize.width - scrollView.adjustedContentInset.left - scrollView.adjustedContentInset.right);
                self.component.byFrame(CGRectMake(contentW + baseInset.right, 0, length, boundsSize.height));
                break;
            }
        }
    };
}

-(jobsByScrollViewBlock _Nonnull)handleWithScrollView{
    @jobs_weakify(self)
    return ^(UIScrollView * scrollView){
        @jobs_strongify(self)
        if (!self) return;
        if (self.ending ||
            self.component.state == JobsOCRefreshStateRemoved ||
            self.component.state == JobsOCRefreshStateDisabled ||
            self.component.state == JobsOCRefreshStateRefreshing ||
            self.component.state == JobsOCRefreshStateNoMoreData) return;
        self.layoutInScrollView(scrollView);
        UIEdgeInsets inset = scrollView.adjustedContentInset;
        CGPoint offset = scrollView.contentOffset;
        CGFloat distance = 0;
        switch (self.position) {
            /// 处理 JobsOCRefreshPositionHeader 分支
            case JobsOCRefreshPositionHeader:
                distance = -(offset.y + inset.top);
                break;
            /// 处理 JobsOCRefreshPositionFooter 分支
            case JobsOCRefreshPositionFooter: {
                CGFloat contentH = MAX(scrollView.contentSize.height,
                                       scrollView.bounds.size.height - inset.top - inset.bottom);
                distance = offset.y + scrollView.bounds.size.height - contentH - inset.bottom;
                break;
            }
            /// 处理 JobsOCRefreshPositionLeft 分支
            case JobsOCRefreshPositionLeft:
                distance = -(offset.x + inset.left);
                break;
            /// 处理 JobsOCRefreshPositionRight 分支
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
            self.beginRefreshing();
        } else if (self.component.state == JobsOCRefreshStatePulling) {
            [self.component applyState:JobsOCRefreshStateIdle progress:0];
        }
    };
}

- (jobsByVoidBlock _Nonnull)beginRefreshing {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIScrollView *scrollView = self.scrollView;
        if (!scrollView ||
            self.component.state == JobsOCRefreshStateRefreshing ||
            self.component.state == JobsOCRefreshStateDisabled ||
            self.component.state == JobsOCRefreshStateNoMoreData) return;
        ((JobsOCRefreshProxy *)Jobs_getAssociatedObjectByTarget(scrollView, JobsOCRefreshProxyKey)).playFeedbackForPosition(self.position);
        [self.component applyState:JobsOCRefreshStateRefreshing progress:1];
        CGFloat length = self.component.refreshLength();
        UIEdgeInsets oldAdjusted = scrollView.adjustedContentInset;
        UIEdgeInsets inset = scrollView.contentInset;
        CGPoint targetOffset = scrollView.contentOffset;
        switch (self.position) {
            /// 处理 JobsOCRefreshPositionHeader 分支
            case JobsOCRefreshPositionHeader:
                inset.top += length;
                targetOffset.y = -(oldAdjusted.top + length);
                break;
            /// 处理 JobsOCRefreshPositionFooter 分支
            case JobsOCRefreshPositionFooter: {
                inset.bottom += length;
                CGFloat contentH = MAX(scrollView.contentSize.height,
                                       scrollView.bounds.size.height - oldAdjusted.top - oldAdjusted.bottom);
                targetOffset.y = contentH + oldAdjusted.bottom + length - scrollView.bounds.size.height;
                break;
            }
            /// 处理 JobsOCRefreshPositionLeft 分支
            case JobsOCRefreshPositionLeft:
                inset.left += length;
                targetOffset.x = -(oldAdjusted.left + length);
                break;
            /// 处理 JobsOCRefreshPositionRight 分支
            case JobsOCRefreshPositionRight: {
                inset.right += length;
                CGFloat contentW = MAX(scrollView.contentSize.width,
                                       scrollView.bounds.size.width - oldAdjusted.left - oldAdjusted.right);
                targetOffset.x = contentW + oldAdjusted.right + length - scrollView.bounds.size.width;
                break;
            }
        }
        [UIView animateWithDuration:0.25 animations:^{
            scrollView.byContentInset(inset);
            [scrollView setContentOffset:targetOffset animated:NO];
        }];
        if (self.action) {
            self.action();
        } else {
            self.reset();
        }
    };
}

-(jobsByJobsOCRefreshStateBlock _Nonnull)endWithFinalState{
    @jobs_weakify(self)
    return ^(JobsOCRefreshState finalState){
        @jobs_strongify(self)
        if (!self) return;
        UIScrollView *scrollView = self.scrollView;
        if (!scrollView || self.component.state != JobsOCRefreshStateRefreshing) return;
        if (self.role == JobsOCRefreshRoleRefresh) {
            self.component.markRefreshedAt(NSDate.date);
        }
        UIEdgeInsets inset = scrollView.contentInset;
        CGFloat length = self.component.refreshLength();
        switch (self.position) {
            /// 处理 JobsOCRefreshPositionHeader 分支
            case JobsOCRefreshPositionHeader: inset.top -= length; break;
            /// 处理 JobsOCRefreshPositionFooter 分支
            case JobsOCRefreshPositionFooter: inset.bottom -= length; break;
            /// 处理 JobsOCRefreshPositionLeft 分支
            case JobsOCRefreshPositionLeft: inset.left -= length; break;
            /// 处理 JobsOCRefreshPositionRight 分支
            case JobsOCRefreshPositionRight: inset.right -= length; break;
        }
        self.byEnding(YES);
        [self.component applyState:JobsOCRefreshStateEnding progress:0];
        [UIView animateWithDuration:0.25 animations:^{
            scrollView.byContentInset(inset);
            self.layoutInScrollView(scrollView);
        } completion:^(__unused BOOL finished) {
            self.byEnding(NO);
            self.layoutInScrollView(scrollView);
            [self.component applyState:finalState progress:0];
        }];
    };
}

- (jobsByVoidBlock _Nonnull)reset {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.component.state == JobsOCRefreshStateRefreshing) {
            self.endWithFinalState(JobsOCRefreshStateIdle);
        } else {
            [self.component applyState:JobsOCRefreshStateIdle progress:0];
        }
    };
}

- (jobsByVoidBlock _Nonnull)fail {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.component.state == JobsOCRefreshStateRefreshing) {
            self.endWithFinalState(JobsOCRefreshStateFailed);
        } else {
            [self.component applyState:JobsOCRefreshStateFailed progress:0];
        }
    };
}

- (jobsByVoidBlock _Nonnull)disable {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.component.state == JobsOCRefreshStateRefreshing) {
            self.endWithFinalState(JobsOCRefreshStateDisabled);
        } else {
            [self.component applyState:JobsOCRefreshStateDisabled progress:0];
        }
    };
}

- (jobsByVoidBlock _Nonnull)noticeNoMoreData {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.role != JobsOCRefreshRoleLoadMore) return;
        [self.component applyState:JobsOCRefreshStateNoMoreData progress:0];
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCRefreshSlot
-(JobsRetJobsOCRefreshSlotByBOOLBlock _Nonnull)byEnding{
    @jobs_weakify(self)
    return ^__kindof JobsOCRefreshSlot * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setEnding:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCRefreshSlot
@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCRefreshProxy
@interface JobsOCRefreshProxy (JobsPropertyDSLSetterAutogen_fbe4b3658b)
-(void)setObserving:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCRefreshProxy

@implementation JobsOCRefreshProxy
- (instancetype)initWithScrollView:(UIScrollView *)scrollView {
    if (self = super.init) {
        _scrollView = scrollView;
        _horizontalMode = JobsOCRefreshHorizontalModeRefreshRightLoadLeft;
        [self addObservers]();
    };return self;
}

- (void)dealloc {
    [self removeObservers]();
}

- (jobsByVoidBlock _Nonnull)addObservers {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.observing || !self.scrollView) return;
        [self.scrollView addObserver:self
                          forKeyPath:@"contentOffset"
                             options:NSKeyValueObservingOptionNew
                             context:JobsOCRefreshKVOContext];
        [self.scrollView.panGestureRecognizer addObserver:self
                                               forKeyPath:@"state"
                                                  options:NSKeyValueObservingOptionNew
                                                  context:JobsOCRefreshKVOContext];
        self.byObserving(YES);
    };
}

- (jobsByVoidBlock _Nonnull)removeObservers {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.observing || !self.scrollView) return;
        [self.scrollView removeObserver:self forKeyPath:@"contentOffset" context:JobsOCRefreshKVOContext];
        [self.scrollView.panGestureRecognizer removeObserver:self forKeyPath:@"state" context:JobsOCRefreshKVOContext];
        self.byObserving(NO);
    };
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
    if (context == JobsOCRefreshKVOContext) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.tick();
        });
        return;
    }
    [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
}

-(JobsRetJobsOCRefreshSlotByJobsOCRefreshPositionBlock _Nonnull)slotForPosition{
    @jobs_weakify(self)
    return ^JobsOCRefreshSlot *(JobsOCRefreshPosition position){
        @jobs_strongify(self)
        if (!self) return nil;
        switch (position) {
            /// 处理 JobsOCRefreshPositionHeader 分支
            case JobsOCRefreshPositionHeader: return self.header;
            /// 处理 JobsOCRefreshPositionFooter 分支
            case JobsOCRefreshPositionFooter: return self.footer;
            /// 处理 JobsOCRefreshPositionLeft 分支
            case JobsOCRefreshPositionLeft: return self.left;
            /// 处理 JobsOCRefreshPositionRight 分支
            case JobsOCRefreshPositionRight: return self.right;
        }
    };
}

- (void)setSlot:(JobsOCRefreshSlot *)slot position:(JobsOCRefreshPosition)position {
    switch (position) {
        /// 处理 JobsOCRefreshPositionHeader 分支
        case JobsOCRefreshPositionHeader: self.header = slot; break;
        /// 处理 JobsOCRefreshPositionFooter 分支
        case JobsOCRefreshPositionFooter: self.footer = slot; break;
        /// 处理 JobsOCRefreshPositionLeft 分支
        case JobsOCRefreshPositionLeft: self.left = slot; break;
        /// 处理 JobsOCRefreshPositionRight 分支
        case JobsOCRefreshPositionRight: self.right = slot; break;
    }
}

- (jobsByVoidBlock _Nonnull)tick {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIScrollView *scrollView = self.scrollView;
        if (!scrollView) return;
        self.header.handleWithScrollView(scrollView);
        self.footer.handleWithScrollView(scrollView);
        self.left.handleWithScrollView(scrollView);
        self.right.handleWithScrollView(scrollView);
    };
}

-(jobsByJobsOCRefreshPositionBlock _Nonnull)playFeedbackForPosition{
    @jobs_weakify(self)
    return ^(JobsOCRefreshPosition position){
        @jobs_strongify(self)
        if (!self) return;
        JobsOCRefreshSlot *slot = self.slotForPosition(position);
        JobsOCRefreshConfig *config = slot.component.config;
        BOOL enablesHaptics = self.usesCustomHapticsSetting ? self.enablesHaptics : config.enablesHaptics;
        if (enablesHaptics) {
            self.playHapticFeedback();
        }
        NSString *soundName = config.soundName.length ? config.soundName : self.soundName;
        if (soundName.length) self.playSoundNamed(soundName);
    };
}

- (jobsByVoidBlock _Nonnull)playHapticFeedback {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (@available(iOS 10.0, *)) {
            UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
            generator.prepare;
            generator.byImpactOccurred();
        } else {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        }
    };
}

-(jobsByStrBlock _Nonnull)playSoundNamed{
    @jobs_weakify(self)
    return ^(NSString * soundName){
        @jobs_strongify(self)
        if (!self) return;
        NSURL *url = self.soundURLForName(soundName);
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
    };
}

-(JobsRetURLByStrBlock _Nonnull)soundURLForName{
    @jobs_weakify(self)
    return ^NSURL *(NSString * soundName){
        @jobs_strongify(self)
        if (!self) return nil;
        if (!soundName.length) return nil;
        if ([NSFileManager.defaultManager fileExistsAtPath:soundName]) {
            return [NSURL fileURLWithPath:soundName];
        }
        NSString *base = soundName.stringByDeletingPathExtension.length ? soundName.stringByDeletingPathExtension : soundName;
        NSString *ext = soundName.pathExtension.length ? soundName.pathExtension : @"wav";
        return [NSBundle.mainBundle URLForResource:base withExtension:ext];
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCRefreshProxy
-(JobsRetJobsOCRefreshProxyByBOOLBlock _Nonnull)byObserving{
    @jobs_weakify(self)
    return ^__kindof JobsOCRefreshProxy * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setObserving:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCRefreshProxy
@end

@implementation UIScrollView (JobsOCRefresher)
- (JobsRetJobsOCRefreshProxyByVoidBlock _Nonnull)jobs_refreshProxy {
    @jobs_weakify(self)
    return ^JobsOCRefreshProxy *{
        @jobs_strongify(self)
        if (!self) return nil;
        JobsOCRefreshProxy *proxy = Jobs_getAssociatedObject(JobsOCRefreshProxyKey);
        if (!proxy) {
            proxy = [[JobsOCRefreshProxy alloc] initWithScrollView:self];
            Jobs_setAssociatedRETAIN_NONATOMIC(JobsOCRefreshProxyKey, proxy)
        };return proxy;
    };
}

-(JobsRetUIScrollViewByJobsOCRefreshHorizontalModeBlock _Nonnull)jobs_setHorizontalRefreshMode{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *(JobsOCRefreshHorizontalMode mode){
        @jobs_strongify(self)
        if (!self) return nil;
        self.jobs_refreshProxy().horizontalMode = mode;
        self.jobs_refreshProxy().left.role = JobsOCRefreshRoleForPosition(mode, JobsOCRefreshPositionLeft);
        self.jobs_refreshProxy().left.component.role = self.jobs_refreshProxy().left.role;
        self.jobs_refreshProxy().right.role = JobsOCRefreshRoleForPosition(mode, JobsOCRefreshPositionRight);
        self.jobs_refreshProxy().right.component.role = self.jobs_refreshProxy().right.role;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)jobs_enableRefreshHaptics{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *(BOOL enable){
        @jobs_strongify(self)
        if (!self) return nil;
        self.jobs_refreshProxy().usesCustomHapticsSetting = YES;
        self.jobs_refreshProxy().enablesHaptics = enable;
        return self;
    };
}

-(JobsRetUIScrollViewByNSStringBlock _Nonnull)jobs_setRefreshSound{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *(NSString * soundName){
        @jobs_strongify(self)
        if (!self) return nil;
        self.jobs_refreshProxy().soundName = soundName;
        return self;
    };
}

-(JobsRetUIScrollViewByJobsOCRefreshActionBlockBlock _Nonnull)jobs_byRefreshHeaderWithAction{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *(JobsOCRefreshActionBlock action){
        @jobs_strongify(self)
        if (!self) return nil;
        return [self jobs_byRefreshHeaderWithConfig:nil action:action];
    };
}

-(JobsRetUIScrollViewByJobsOCRefreshActionBlockBlock _Nonnull)jobs_byRefreshFooterWithAction{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *(JobsOCRefreshActionBlock action){
        @jobs_strongify(self)
        if (!self) return nil;
        return [self jobs_byRefreshFooterWithConfig:nil action:action];
    };
}

- (__kindof UIScrollView *)jobs_byRefreshHeaderWithConfig:(JobsOCRefreshConfig *)config
                                                   action:(JobsOCRefreshActionBlock)action {
    JobsOCRefreshConfig *realConfig = config ?: JobsOCRefreshConfig.defaultHeaderConfig();
    JobsOCRefreshSlot *slot = [[JobsOCRefreshSlot alloc] initWithPosition:JobsOCRefreshPositionHeader
                                                                     role:JobsOCRefreshRoleRefresh
                                                                   config:realConfig
                                                                   action:action];
    [self.jobs_refreshProxy() setSlot:slot position:JobsOCRefreshPositionHeader];
    slot.attachToScrollView(self);
    return self;
}

- (__kindof UIScrollView *)jobs_byRefreshFooterWithConfig:(JobsOCRefreshConfig *)config
                                                   action:(JobsOCRefreshActionBlock)action {
    JobsOCRefreshConfig *realConfig = config ?: JobsOCRefreshConfig.defaultFooterConfig();
    JobsOCRefreshSlot *slot = [[JobsOCRefreshSlot alloc] initWithPosition:JobsOCRefreshPositionFooter
                                                                     role:JobsOCRefreshRoleLoadMore
                                                                   config:realConfig
                                                                   action:action];
    [self.jobs_refreshProxy() setSlot:slot position:JobsOCRefreshPositionFooter];
    slot.attachToScrollView(self);
    return self;
}

- (__kindof UIScrollView *)jobs_bySideRefreshAt:(JobsOCRefreshPosition)position
                                         config:(JobsOCRefreshConfig *)config
                                         action:(JobsOCRefreshActionBlock)action {
    NSParameterAssert(position == JobsOCRefreshPositionLeft || position == JobsOCRefreshPositionRight);
    JobsOCRefreshHorizontalMode mode = self.jobs_refreshProxy().horizontalMode;
    JobsOCRefreshConfig *realConfig = config ?: (position == JobsOCRefreshPositionLeft ?
                                                 JobsOCRefreshConfig.defaultLeftConfigWithMode(mode) :
                                                 JobsOCRefreshConfig.defaultRightConfigWithMode(mode));
    JobsOCRefreshRole role = JobsOCRefreshRoleForPosition(mode, position);
    JobsOCRefreshSlot *slot = [[JobsOCRefreshSlot alloc] initWithPosition:position
                                                                     role:role
                                                                   config:realConfig
                                                                   action:action];
    [self.jobs_refreshProxy() setSlot:slot position:position];
    slot.attachToScrollView(self);
    return self;
}

- (__kindof UIScrollView *)jobs_switchRefreshAt:(JobsOCRefreshPosition)position
                                        toState:(JobsOCRefreshState)state {
    JobsOCRefreshSlot *slot = (self.jobs_refreshProxy()).slotForPosition(position);
    if (!slot) return self;
    switch (state) {
        /// 处理 JobsOCRefreshStateRefreshing 分支
        case JobsOCRefreshStateRefreshing: slot.beginRefreshing(); break;
        /// 处理 JobsOCRefreshStateIdle 分支
        case JobsOCRefreshStateIdle: slot.reset(); break;
        /// 处理 JobsOCRefreshStateFailed 分支
        case JobsOCRefreshStateFailed: [slot fail]; break;
        /// 处理 JobsOCRefreshStateDisabled 分支
        case JobsOCRefreshStateDisabled: slot.disable(); break;
        /// 处理 JobsOCRefreshStateNoMoreData 分支
        case JobsOCRefreshStateNoMoreData: slot.noticeNoMoreData(); break;
        /// 处理 JobsOCRefreshStateRemoved 分支
        case JobsOCRefreshStateRemoved: self.jobs_removeRefreshAt(position); break;
        /// 处理 JobsOCRefreshStatePulling 分支
        case JobsOCRefreshStatePulling:
        /// 处理 JobsOCRefreshStateReady 分支
        case JobsOCRefreshStateReady:
        /// 处理 JobsOCRefreshStateEnding 分支
        case JobsOCRefreshStateEnding:
            [slot.component applyState:state progress:0];
            break;
    };return self;
}

- (__kindof UIScrollView *)jobs_replaceRefreshAnimator:(id<JobsRefreshAnimatorProtocol>)animator
                                            atPosition:(JobsOCRefreshPosition)position {
    JobsOCRefreshSlot *slot = (self.jobs_refreshProxy()).slotForPosition(position);
    if (!slot) return self;
    slot.component.replaceAnimator(animator);
    [slot.component setNeedsLayout];
    return self;
}

-(JobsRetUIScrollViewByJobsOCRefreshPositionBlock _Nonnull)jobs_removeRefreshAt{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *(JobsOCRefreshPosition position){
        @jobs_strongify(self)
        if (!self) return nil;
        JobsOCRefreshSlot *slot = (self.jobs_refreshProxy()).slotForPosition(position);
        slot.detach();
        [self.jobs_refreshProxy() setSlot:nil position:position];
        return self;
    };
}

@end

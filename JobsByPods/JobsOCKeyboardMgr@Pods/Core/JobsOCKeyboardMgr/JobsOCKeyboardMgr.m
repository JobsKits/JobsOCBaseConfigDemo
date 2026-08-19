//
//  JobsOCKeyboardMgr.m
//  JobsOCKeyboardMgr
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#import <JobsOCKeyboardMgr/JobsOCKeyboardMgr.h>

@interface JobsOCKeyboardMgr ()<UIGestureRecognizerDelegate>

Prop_strong(nullable, readwrite) __kindof JobsOCKeyboardConfig *currentConfig;
Prop_strong(nullable, readwrite) __kindof JobsOCKeyboardResult *latestResult;
Prop_assign(readwrite, getter=isStarted) BOOL started;
Prop_strong() NSMapTable <UIView *, NSValue *>*baseTransformMap;
Prop_strong(nullable) UITapGestureRecognizer *endEditingTapGR;
Prop_weak(nullable) __kindof UIView *endEditingTapHostView;
Prop_assign(readwrite) CGRect latestKeyboardFrameInScreen;
Prop_copy(nullable, readwrite) NSDictionary *latestKeyboardUserInfo;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCKeyboardMgr
@interface JobsOCKeyboardMgr (JobsPropertyDSLSetterAutogen_d79ec97175)
-(void)setCurrentConfig:(__kindof JobsOCKeyboardConfig * _Nullable)data;
-(void)setEndEditingTapGR:(UITapGestureRecognizer * _Nullable)data;
-(void)setEndEditingTapHostView:(__kindof UIView * _Nullable)data;
-(void)setLatestKeyboardFrameInScreen:(CGRect)data;
-(void)setLatestKeyboardUserInfo:(NSDictionary * _Nullable)data;
-(void)setLatestResult:(__kindof JobsOCKeyboardResult * _Nullable)data;
-(void)setStarted:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCKeyboardMgr

@implementation JobsOCKeyboardMgr
+(JobsRetIDByVoidBlock _Nonnull)shared{
    return ^id{
        static JobsOCKeyboardMgr *manager = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = JobsOCKeyboardMgr.new;
        });return manager;
    };
}

+(instancetype)sharedManager{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsOCKeyboardMgr.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager));
    return action ? action() : nil;
}

+(JobsRetIDByVoidBlock _Nonnull)jobsSharedManager{
    return ^id{
        return self.shared();
    };
}

-(instancetype)init{
    if (self = [super init]) {
        _baseTransformMap = NSMapTable.weakToStrongObjectsMapTable;
        _latestKeyboardFrameInScreen = CGRectNull;
    };return self;
}

-(void)dealloc{
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

-(JobsRetJobsOCKeyboardMgrByVoidBlock _Nonnull)start{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardMgr *_Nullable(void) {
        @jobs_strongify(self)
        self.jobs_startListening();
        return self;
    };
}

-(JobsRetJobsOCKeyboardMgrByVoidBlock _Nonnull)stop{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardMgr *_Nullable(void) {
        @jobs_strongify(self)
        self.jobs_stopListening();
        return self;
    };
}

-(JobsRetJobsOCKeyboardMgrByVoidBlock _Nonnull)restore{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardMgr *_Nullable(void) {
        @jobs_strongify(self)
        [self jobs_restoreConfig:self.currentConfig
                        duration:self.latestResult.animationDuration
                         options:self.latestResult.animationOptions];
        return self;
    };
}

-(JobsRetJobsOCKeyboardMgrByConfigBlock _Nonnull)byConfig{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardMgr *_Nullable(__kindof JobsOCKeyboardConfig *_Nullable data) {
        @jobs_strongify(self)
        self.jobs_updateConfig(data);
        return self;
    };
}

-(jobsByIDBlock _Nonnull)clearConfigByOwner{
    @jobs_weakify(self)
    return ^(id _Nullable owner){
        @jobs_strongify(self)
        if (!self) return;
        if (!owner || self.currentConfig.owner == owner) self.jobs_updateConfig(nil);
    };
}
#pragma mark —— Lifecycle
-(jobsByVoidBlock _Nonnull)jobs_startListening{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.started) return;
        self.byStarted(YES);
        [NSNotificationCenter.defaultCenter addObserver:self
                                               selector:@selector(jobs_keyboardWillChangeFrame:)
                                                   name:UIKeyboardWillChangeFrameNotification
                                                 object:nil];
        [NSNotificationCenter.defaultCenter addObserver:self
                                               selector:@selector(jobs_textDidBeginEditing:)
                                                   name:UITextFieldTextDidBeginEditingNotification
                                                 object:nil];
        [NSNotificationCenter.defaultCenter addObserver:self
                                               selector:@selector(jobs_textDidBeginEditing:)
                                                   name:UITextViewTextDidBeginEditingNotification
                                                 object:nil];
    };
}

-(jobsByVoidBlock _Nonnull)jobs_stopListening{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.started) return;
        self.byStarted(NO);
        self.jobs_teardownInputFlowForConfig(self.currentConfig);
        self.jobs_teardownEndEditingTapGesture();
        [NSNotificationCenter.defaultCenter removeObserver:self
                                                      name:UIKeyboardWillChangeFrameNotification
                                                    object:nil];
        [NSNotificationCenter.defaultCenter removeObserver:self
                                                      name:UITextFieldTextDidBeginEditingNotification
                                                    object:nil];
        [NSNotificationCenter.defaultCenter removeObserver:self
                                                      name:UITextViewTextDidBeginEditingNotification
                                                    object:nil];
    };
}

-(jobsByOCKeyboardConfigBlock _Nonnull)jobs_updateConfig{
    @jobs_weakify(self)
    return ^(__kindof JobsOCKeyboardConfig * config){
        @jobs_strongify(self)
        if (!self) return;
        JobsOCKeyboardConfig *oldConfig = self.currentConfig;
        if (oldConfig && oldConfig != config) {
            self.jobs_teardownInputFlowForConfig(oldConfig);
            self.jobs_teardownEndEditingTapGesture();
            if ([self jobs_shouldRestoreConfig:oldConfig beforeConfig:config]) {
                [self jobs_restoreConfig:oldConfig
                                duration:self.latestResult.animationDuration
                                 options:self.latestResult.animationOptions];
            }
        }
        self.byCurrentConfig(config);
        [self jobs_refreshTriggerViewForConfig:config preferredView:nil];
        self.jobs_captureBaseTransformsForConfig(config);
        self.jobs_setupInputFlowForConfig(config);
        self.jobs_setupEndEditingTapGestureForConfig(config);
        self.jobs_reapplyLatestKeyboardForConfig(config);
    };
}
#pragma mark —— Keyboard
-(void)jobs_keyboardWillChangeFrame:(NSNotification *)notification{
    jobsByNotificationBlock action = ((jobsByNotificationBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCKeyboardMgr.class, @selector(jobsJobs_keyboardWillChangeFrame)))(self, @selector(jobsJobs_keyboardWillChangeFrame));
    if (action) action(notification);
}

-(jobsByNotificationBlock _Nonnull)jobsJobs_keyboardWillChangeFrame{
    @jobs_weakify(self)
    return ^(NSNotification * notification){
        @jobs_strongify(self)
        if (!self) return;
        NSDictionary *userInfo = notification.userInfo ?: @{};
        NSValue *keyboardFrameValue = userInfo[UIKeyboardFrameEndUserInfoKey];
        self.byLatestKeyboardUserInfo(userInfo);
        self.byLatestKeyboardFrameInScreen(keyboardFrameValue ? keyboardFrameValue.CGRectValue : CGRectNull);
        JobsOCKeyboardConfig *config = self.currentConfig;
        if (!config.isValid()) return;
        [self jobs_refreshTriggerViewForConfig:config preferredView:nil];
        JobsOCKeyboardResult *result = [JobsOCKeyboardCalculator resultByConfig:config notification:notification];
        [self jobs_consumeResult:result config:config];
    };
}

-(void)jobs_textDidBeginEditing:(NSNotification *)notification{
    jobsByNotificationBlock action = ((jobsByNotificationBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCKeyboardMgr.class, @selector(jobsJobs_textDidBeginEditing)))(self, @selector(jobsJobs_textDidBeginEditing));
    if (action) action(notification);
}

-(jobsByNotificationBlock _Nonnull)jobsJobs_textDidBeginEditing{
    @jobs_weakify(self)
    return ^(NSNotification * notification){
        @jobs_strongify(self)
        if (!self) return;
        JobsOCKeyboardConfig *config = self.currentConfig;
        if (!config.isValid()) return;
        UIView *triggerView = [notification.object isKindOfClass:UIView.class] ? notification.object : nil;
        [self jobs_refreshTriggerViewForConfig:config preferredView:triggerView];
        self.jobs_reapplyLatestKeyboardForConfig(config);
    };
}

-(JobsRetNSArrayUIViewByJobsOCKeyboardConfigBlock _Nonnull)jobs_viewsByConfig{
    @jobs_weakify(self)
    return ^NSArray <__kindof UIView *>*(__kindof JobsOCKeyboardConfig * config){
        @jobs_strongify(self)
        if (!self) return nil;
        NSMutableArray <__kindof UIView *>*views = NSMutableArray.array;
        if (config.targetView) [views addObject:config.targetView];
        for (__kindof UIView *view in config.followViews()) {
            if (view && ![views containsObject:view]) [views addObject:view];
        };return views;
    };
}

-(BOOL)jobs_view:(__kindof UIView *)view belongsToTargetView:(__kindof UIView *)targetView{
    if (!view || !targetView) return NO;
    return view == targetView || [view isDescendantOfView:targetView];
}

-(JobsRetViewByViewBlock _Nonnull)jobs_firstResponderInView{
    @jobs_weakify(self)
    return ^__kindof UIView *(__kindof UIView * view){
        @jobs_strongify(self)
        if (!self) return nil;
        if (!view) return nil;
        if (view.isFirstResponder) return view;
        for (__kindof UIView *subview in view.subviews) {
            UIView *firstResponder = self.jobs_firstResponderInView(subview);
            if (firstResponder) return firstResponder;
        };return nil;
    };
}

-(void)jobs_refreshTriggerViewForConfig:(__kindof JobsOCKeyboardConfig *)config
                          preferredView:(__kindof UIView *)preferredView{
    if (!config.isValid()) return;
    UIView *targetView = config.targetView;
    UIView *triggerScopeView = config.triggerScopeView ?: targetView;
    UIView *triggerView = nil;
    if ([self jobs_view:preferredView belongsToTargetView:triggerScopeView]) {
        triggerView = preferredView;
    }
    if (!triggerView) {
        UIView *currentTriggerView = config.triggerView;
        if ([self jobs_view:currentTriggerView belongsToTargetView:triggerScopeView] &&
            currentTriggerView.isFirstResponder) {
            triggerView = currentTriggerView;
        }
    }
    if (!triggerView) triggerView = self.jobs_firstResponderInView(triggerScopeView);
    config.byTriggerView([self jobs_view:triggerView belongsToTargetView:triggerScopeView] ? triggerView : nil);
}

-(BOOL)jobs_config:(__kindof JobsOCKeyboardConfig *)left
sharesMovingViewsWithConfig:(__kindof JobsOCKeyboardConfig *)right{
    NSArray *leftViews = self.jobs_viewsByConfig(left);
    NSArray *rightViews = self.jobs_viewsByConfig(right);
    if (leftViews.count != rightViews.count) return NO;
    for (__kindof UIView *view in leftViews) {
        if (![rightViews containsObject:view]) return NO;
    };return YES;
}

-(BOOL)jobs_shouldRestoreConfig:(__kindof JobsOCKeyboardConfig *)oldConfig
                   beforeConfig:(__kindof JobsOCKeyboardConfig *)newConfig{
    if (!oldConfig || oldConfig == newConfig) return NO;
    if (!newConfig) return YES;
    return ![self jobs_config:oldConfig sharesMovingViewsWithConfig:newConfig];
}

-(jobsByOCKeyboardConfigBlock _Nonnull)jobs_reapplyLatestKeyboardForConfig{
    @jobs_weakify(self)
    return ^(__kindof JobsOCKeyboardConfig * config){
        @jobs_strongify(self)
        if (!self) return;
        if (!config.isValid() || CGRectIsNull(self.latestKeyboardFrameInScreen)) return;
        JobsOCKeyboardResult *result = [JobsOCKeyboardCalculator resultByConfig:config
                                                          keyboardFrameInScreen:self.latestKeyboardFrameInScreen
                                                                       userInfo:self.latestKeyboardUserInfo];
        if (!result.keyboardVisible && !self.latestResult.keyboardVisible) return;
        [self jobs_consumeResult:result config:config];
    };
}

-(void)jobs_consumeResult:(__kindof JobsOCKeyboardResult *)result
                   config:(__kindof JobsOCKeyboardConfig *)config{
    [self jobs_normalizeResultOffset:result config:config];
    self.byLatestResult(result);
    if (config.resultBlock) config.resultBlock(result);
    if (config.applyMode == JobsOCKeyboardApplyModeTransform) {
        [self jobs_applyResult:result config:config];
    }
}
#pragma mark —— InputFlow
-(jobsByOCKeyboardConfigBlock _Nonnull)jobs_setupInputFlowForConfig{
    @jobs_weakify(self)
    return ^(__kindof JobsOCKeyboardConfig * config){
        @jobs_strongify(self)
        if (!self) return;
        if (!config.shouldFlowByReturnKey) return;
        @jobs_weakify(self)
        NSArray <__kindof UITextField *>*inputFields = config.inputFields();
        for (UITextField *textField in inputFields) {
            textField
                .offJobsEvent(UIControlEventEditingDidEndOnExit)
                .onJobsEvent(UIControlEventEditingDidEndOnExit, ^(__kindof UIControl * _Nullable control) {
                    weak_self.jobs_inputFieldDidEndOnExit((UITextField *)control);
                });
        }
    };
}

-(jobsByOCKeyboardConfigBlock _Nonnull)jobs_teardownInputFlowForConfig{
    @jobs_weakify(self)
    return ^(__kindof JobsOCKeyboardConfig * config){
        @jobs_strongify(self)
        if (!self) return;
        for (UITextField *textField in config.inputFields()) {
            textField.offJobsEvent(UIControlEventEditingDidEndOnExit);
        }
    };
}

-(UITextField *)jobs_nextInputFieldAfterTextField:(__kindof UITextField *)textField
                                           config:(__kindof JobsOCKeyboardConfig *)config{
    NSArray <__kindof UITextField *>*inputFields = config.inputFields();
    NSUInteger index = [inputFields indexOfObject:textField];
    if (index == NSNotFound) return nil;
    for (NSUInteger i = index + 1; i < inputFields.count; i++) {
        UITextField *nextTextField = inputFields[i];
        if (nextTextField.jobs_isEnabled &&
            nextTextField.userInteractionEnabled &&
            !nextTextField.hidden &&
            nextTextField.alpha > 0.01f) {
            return nextTextField;
        }
    };return nil;
}

-(jobsByTextFieldBlock _Nonnull)jobs_inputFieldDidEndOnExit{
    @jobs_weakify(self)
    return ^(__kindof UITextField * textField){
        @jobs_strongify(self)
        if (!self) return;
        JobsOCKeyboardConfig *config = self.currentConfig;
        if (!config.shouldFlowByReturnKey) return;
        UITextField *nextTextField = [self jobs_nextInputFieldAfterTextField:textField config:config];
        if (nextTextField) {
            [nextTextField becomeFirstResponder];
        }else{
            textField.resignFirstResponder;
        }
    };
}

-(JobsRetUIViewByJobsOCKeyboardConfigBlock _Nonnull)jobs_endEditingHostViewByConfig{
    @jobs_weakify(self)
    return ^UIView *(__kindof JobsOCKeyboardConfig * config){
        @jobs_strongify(self)
        if (!self) return nil;
        if (config.containerView) return config.containerView;
        if (config.targetView) return config.targetView;
        return nil;
    };
}

-(jobsByOCKeyboardConfigBlock _Nonnull)jobs_setupEndEditingTapGestureForConfig{
    @jobs_weakify(self)
    return ^(__kindof JobsOCKeyboardConfig * config){
        @jobs_strongify(self)
        if (!self) return;
        self.jobs_teardownEndEditingTapGesture();
        if (!config.shouldResignOnTouchOutside) return;
        UIView *hostView = self.jobs_endEditingHostViewByConfig(config);
        if (!hostView) return;
        UITapGestureRecognizer *tapGR = [UITapGestureRecognizer.alloc initWithTarget:self
                                                                               action:@selector(jobs_endEditingByTapGesture:)];
        tapGR.byCancelsTouchesInView(NO);
        tapGR.byDelegate(self);
        [hostView addGestureRecognizer:tapGR];
        self.byEndEditingTapGR(tapGR);
        self.byEndEditingTapHostView(hostView);
    };
}

-(jobsByVoidBlock _Nonnull)jobs_teardownEndEditingTapGesture{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.endEditingTapGR && self.endEditingTapHostView) {
            [self.endEditingTapHostView removeGestureRecognizer:self.endEditingTapGR];
        }
        self.byEndEditingTapGR(nil);
        self.byEndEditingTapHostView(nil);
    };
}

-(void)jobs_endEditingByTapGesture:(UITapGestureRecognizer *)tapGR{
    jobsByTapGestureRecognizerBlock action = ((jobsByTapGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCKeyboardMgr.class, @selector(jobsJobs_endEditingByTapGesture)))(self, @selector(jobsJobs_endEditingByTapGesture));
    if (action) action(tapGR);
}

-(jobsByTapGestureRecognizerBlock _Nonnull)jobsJobs_endEditingByTapGesture{
    @jobs_weakify(self)
    return ^(UITapGestureRecognizer * tapGR){
        @jobs_strongify(self)
        if (!self) return;
        UIView *hostView = self.endEditingTapHostView;
        if (!hostView) hostView = self.currentConfig.containerView;
        if (!hostView) hostView = self.currentConfig.targetView;
        [hostView endEditing:YES];
    };
}
#pragma mark —— UIGestureRecognizerDelegate
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
      shouldReceiveTouch:(UITouch *)touch{
    JobsOCKeyboardConfig *config = self.currentConfig;
    if (!config.shouldResignOnTouchOutside) return NO;
    if ([touch.view isKindOfClass:UIControl.class]) return NO;
    for (UITextField *textField in config.inputFields()) {
        if ([touch.view isDescendantOfView:textField]) return NO;
    };return YES;
}
#pragma mark —— Transform

-(JobsRetUIViewByJobsOCKeyboardConfigBlock _Nonnull)jobs_containerViewByConfig{
    @jobs_weakify(self)
    return ^__kindof UIView *(__kindof JobsOCKeyboardConfig * config){
        @jobs_strongify(self)
        if (!self) return nil;
        if (config.containerView) return config.containerView;
        if (config.targetView.window) return config.targetView.window;
        return config.targetView.superview;
    };
}

-(BOOL)jobs_rect:(CGRect)left horizontallyIntersectsRect:(CGRect)right{
    return CGRectGetMaxX(left) > CGRectGetMinX(right) &&
           CGRectGetMinX(left) < CGRectGetMaxX(right);
}

-(JobsRetCGFloatByViewBlock _Nonnull)jobs_currentOffsetYForView{
    @jobs_weakify(self)
    return ^CGFloat(__kindof UIView * view){
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        if (!view) return 0;
        NSValue *baseValue = [self.baseTransformMap objectForKey:view];
        if (!baseValue) return 0;
        CGAffineTransform baseTransform = baseValue.CGAffineTransformValue;
        return MAX(0, baseTransform.ty - view.transform.ty);
    };
}

-(void)jobs_normalizeResultOffset:(__kindof JobsOCKeyboardResult *)result
                           config:(__kindof JobsOCKeyboardConfig *)config{
    if (!result.keyboardVisible || CGRectIsNull(result.obstructionFrameInContainer)) return;
    if (config.shouldCheckHorizontalOverlap &&
        ![self jobs_rect:result.triggerFrameInContainer
horizontallyIntersectsRect:result.obstructionFrameInContainer]) {
        result.byOffsetY(0);
        result.byShouldAdjust(NO);
        return;
    }
    CGFloat currentOffsetY = self.jobs_currentOffsetYForView(config.targetView);
    if (currentOffsetY <= 0) return;
    UIView *containerView = self.jobs_containerViewByConfig(config);
    CGFloat targetBottom = CGRectGetMaxY(result.triggerFrameInContainer) + MAX(0, config.extraSpacing);
    CGFloat signedOffset = targetBottom - CGRectGetMinY(result.obstructionFrameInContainer);
    CGFloat safeTop = containerView.safeAreaInsets.top + MAX(0, config.topSpacing);
    CGFloat maxLift = config.maxLiftDistance > 0
        ? config.maxLiftDistance
        : MAX(0, CGRectGetMinY(result.targetFrameInContainer) + currentOffsetY - safeTop);
    result.byOffsetY(MIN(MAX(0, currentOffsetY + signedOffset), maxLift));
    result.byShouldAdjust(result.offsetY > 0);
}

-(jobsByOCKeyboardConfigBlock _Nonnull)jobs_captureBaseTransformsForConfig{
    @jobs_weakify(self)
    return ^(__kindof JobsOCKeyboardConfig * config){
        @jobs_strongify(self)
        if (!self) return;
        for (__kindof UIView *view in self.jobs_viewsByConfig(config)) {
            if (![self.baseTransformMap objectForKey:view]) {
                [self.baseTransformMap setObject:[NSValue valueWithCGAffineTransform:view.transform]
                                          forKey:view];
            }
        }
    };
}

-(void)jobs_applyResult:(__kindof JobsOCKeyboardResult *)result
                 config:(__kindof JobsOCKeyboardConfig *)config{
    self.jobs_captureBaseTransformsForConfig(config);
    CGFloat offsetY = result.offsetY;
    NSTimeInterval duration = result.animationDuration > 0 ? result.animationDuration : 0.25f;
    UIViewAnimationOptions options = result.animationOptions;
    BOOL shouldClearBaseTransform = !result.keyboardVisible || !result.shouldAdjust;
    @jobs_weakify(self)
    [UIView animateWithDuration:duration
                          delay:0
                        options:options
                     animations:^{
        @jobs_strongify(self)
        for (__kindof UIView *view in self.jobs_viewsByConfig(config)) {
            [self jobs_applyOffset:offsetY toView:view];
        }
    } completion:^(BOOL finished) {
        @jobs_strongify(self)
        if (!shouldClearBaseTransform) return;
        for (__kindof UIView *view in self.jobs_viewsByConfig(config)) {
            [self.baseTransformMap removeObjectForKey:view];
        }
    }];
}

-(void)jobs_restoreConfig:(__kindof JobsOCKeyboardConfig *)config
                 duration:(NSTimeInterval)duration
                  options:(UIViewAnimationOptions)options{
    if (!config) return;
    NSTimeInterval animationDuration = duration > 0 ? duration : 0.25f;
    UIViewAnimationOptions animationOptions = options ?: UIViewAnimationOptionBeginFromCurrentState;
    @jobs_weakify(self)
    [UIView animateWithDuration:animationDuration
                          delay:0
                        options:animationOptions
                     animations:^{
        @jobs_strongify(self)
        for (__kindof UIView *view in self.jobs_viewsByConfig(config)) {
            [self jobs_applyOffset:0 toView:view];
        }
    } completion:^(BOOL finished) {
        @jobs_strongify(self)
        for (__kindof UIView *view in self.jobs_viewsByConfig(config)) {
            [self.baseTransformMap removeObjectForKey:view];
        }
    }];
}

-(void)jobs_applyOffset:(CGFloat)offsetY
                 toView:(__kindof UIView *)view{
    if (!view) return;
    NSValue *baseValue = [self.baseTransformMap objectForKey:view];
    if (!baseValue) {
        baseValue = [NSValue valueWithCGAffineTransform:view.transform];
        [self.baseTransformMap setObject:baseValue forKey:view];
    }
    CGAffineTransform baseTransform = baseValue.CGAffineTransformValue;
    view.byTransform(CGAffineTransformTranslate(baseTransform, 0, -offsetY));
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCKeyboardMgr
-(JobsRetJobsOCKeyboardMgrByBOOLBlock _Nonnull)byStarted{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardMgr * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setStarted:data];
        return self;
    };
}

-(JobsRetJobsOCKeyboardMgrByCGRectBlock _Nonnull)byLatestKeyboardFrameInScreen{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardMgr * _Nullable(CGRect data){
        @jobs_strongify(self)
        [self setLatestKeyboardFrameInScreen:data];
        return self;
    };
}

-(JobsRetJobsOCKeyboardMgrByConfigBlock _Nonnull)byCurrentConfig{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardMgr * _Nullable(__kindof JobsOCKeyboardConfig * _Nullable data){
        @jobs_strongify(self)
        [self setCurrentConfig:data];
        return self;
    };
}

-(JobsRetJobsOCKeyboardMgrByJobsOCKeyboardResultBlock _Nonnull)byLatestResult{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardMgr * _Nullable(__kindof JobsOCKeyboardResult * _Nullable data){
        @jobs_strongify(self)
        [self setLatestResult:data];
        return self;
    };
}

-(JobsRetJobsOCKeyboardMgrByNSDictionaryBlock _Nonnull)byLatestKeyboardUserInfo{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardMgr * _Nullable(NSDictionary * _Nullable data){
        @jobs_strongify(self)
        [self setLatestKeyboardUserInfo:data];
        return self;
    };
}

-(JobsRetJobsOCKeyboardMgrByUITapGestureRecognizerBlock _Nonnull)byEndEditingTapGR{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardMgr * _Nullable(UITapGestureRecognizer * _Nullable data){
        @jobs_strongify(self)
        [self setEndEditingTapGR:data];
        return self;
    };
}

-(JobsRetJobsOCKeyboardMgrByUIViewBlock _Nonnull)byEndEditingTapHostView{
    @jobs_weakify(self)
    return ^__kindof JobsOCKeyboardMgr * _Nullable(__kindof UIView * _Nullable data){
        @jobs_strongify(self)
        [self setEndEditingTapHostView:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCKeyboardMgr
@end

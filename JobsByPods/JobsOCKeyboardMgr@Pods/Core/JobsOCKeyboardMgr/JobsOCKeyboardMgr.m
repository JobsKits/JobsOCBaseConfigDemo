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

@implementation JobsOCKeyboardMgr

+(instancetype)shared{
    static JobsOCKeyboardMgr *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = JobsOCKeyboardMgr.new;
    });return manager;
}

+(instancetype)sharedManager{
    return self.shared;
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

-(JobsRetJobsOCKeyboardMgrByVoidBlock)start{
    __weak typeof(self) weakSelf = self;
    return ^__kindof JobsOCKeyboardMgr *_Nullable(void) {
        __strong typeof(weakSelf) self = weakSelf;
        [self jobs_startListening];
        return self;
    };
}

-(JobsRetJobsOCKeyboardMgrByVoidBlock)stop{
    __weak typeof(self) weakSelf = self;
    return ^__kindof JobsOCKeyboardMgr *_Nullable(void) {
        __strong typeof(weakSelf) self = weakSelf;
        [self jobs_stopListening];
        return self;
    };
}

-(JobsRetJobsOCKeyboardMgrByVoidBlock)restore{
    __weak typeof(self) weakSelf = self;
    return ^__kindof JobsOCKeyboardMgr *_Nullable(void) {
        __strong typeof(weakSelf) self = weakSelf;
        [self jobs_restoreConfig:self.currentConfig
                        duration:self.latestResult.animationDuration
                         options:self.latestResult.animationOptions];
        return self;
    };
}

-(JobsRetJobsOCKeyboardMgrByConfigBlock)byConfig{
    __weak typeof(self) weakSelf = self;
    return ^__kindof JobsOCKeyboardMgr *_Nullable(__kindof JobsOCKeyboardConfig *_Nullable data) {
        __strong typeof(weakSelf) self = weakSelf;
        [self jobs_updateConfig:data];
        return self;
    };
}

-(void)clearConfigByOwner:(id _Nullable)owner{
    if (!owner || self.currentConfig.owner == owner) [self jobs_updateConfig:nil];
}
#pragma mark —— Lifecycle
-(void)jobs_startListening{
    if (self.started) return;
    self.started = YES;
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
}

-(void)jobs_stopListening{
    if (!self.started) return;
    self.started = NO;
    [self jobs_teardownInputFlowForConfig:self.currentConfig];
    [self jobs_teardownEndEditingTapGesture];
    [NSNotificationCenter.defaultCenter removeObserver:self
                                                  name:UIKeyboardWillChangeFrameNotification
                                                object:nil];
    [NSNotificationCenter.defaultCenter removeObserver:self
                                                  name:UITextFieldTextDidBeginEditingNotification
                                                object:nil];
    [NSNotificationCenter.defaultCenter removeObserver:self
                                                  name:UITextViewTextDidBeginEditingNotification
                                                object:nil];
}

-(void)jobs_updateConfig:(__kindof JobsOCKeyboardConfig *)config{
    JobsOCKeyboardConfig *oldConfig = self.currentConfig;
    if (oldConfig && oldConfig != config) {
        [self jobs_teardownInputFlowForConfig:oldConfig];
        [self jobs_teardownEndEditingTapGesture];
        if ([self jobs_shouldRestoreConfig:oldConfig beforeConfig:config]) {
            [self jobs_restoreConfig:oldConfig
                            duration:self.latestResult.animationDuration
                             options:self.latestResult.animationOptions];
        }
    }
    self.currentConfig = config;
    [self jobs_refreshTriggerViewForConfig:config preferredView:nil];
    [self jobs_captureBaseTransformsForConfig:config];
    [self jobs_setupInputFlowForConfig:config];
    [self jobs_setupEndEditingTapGestureForConfig:config];
    [self jobs_reapplyLatestKeyboardForConfig:config];
}
#pragma mark —— Keyboard
-(void)jobs_keyboardWillChangeFrame:(NSNotification *)notification{
    NSDictionary *userInfo = notification.userInfo ?: @{};
    NSValue *keyboardFrameValue = userInfo[UIKeyboardFrameEndUserInfoKey];
    self.latestKeyboardUserInfo = userInfo;
    self.latestKeyboardFrameInScreen = keyboardFrameValue ? keyboardFrameValue.CGRectValue : CGRectNull;
    JobsOCKeyboardConfig *config = self.currentConfig;
    if (!config.isValid) return;
    [self jobs_refreshTriggerViewForConfig:config preferredView:nil];
    JobsOCKeyboardResult *result = [JobsOCKeyboardCalculator resultByConfig:config notification:notification];
    [self jobs_consumeResult:result config:config];
}

-(void)jobs_textDidBeginEditing:(NSNotification *)notification{
    JobsOCKeyboardConfig *config = self.currentConfig;
    if (!config.isValid) return;
    UIView *triggerView = [notification.object isKindOfClass:UIView.class] ? notification.object : nil;
    [self jobs_refreshTriggerViewForConfig:config preferredView:triggerView];
    [self jobs_reapplyLatestKeyboardForConfig:config];
}

-(NSArray <__kindof UIView *>*)jobs_viewsByConfig:(__kindof JobsOCKeyboardConfig *)config{
    NSMutableArray <__kindof UIView *>*views = NSMutableArray.array;
    if (config.targetView) [views addObject:config.targetView];
    for (__kindof UIView *view in config.followViews) {
        if (view && ![views containsObject:view]) [views addObject:view];
    };return views;
}

-(BOOL)jobs_view:(__kindof UIView *)view belongsToTargetView:(__kindof UIView *)targetView{
    if (!view || !targetView) return NO;
    return view == targetView || [view isDescendantOfView:targetView];
}

-(__kindof UIView *)jobs_firstResponderInView:(__kindof UIView *)view{
    if (!view) return nil;
    if (view.isFirstResponder) return view;
    for (__kindof UIView *subview in view.subviews) {
        UIView *firstResponder = [self jobs_firstResponderInView:subview];
        if (firstResponder) return firstResponder;
    };return nil;
}

-(void)jobs_refreshTriggerViewForConfig:(__kindof JobsOCKeyboardConfig *)config
                          preferredView:(__kindof UIView *)preferredView{
    if (!config.isValid) return;
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
    if (!triggerView) triggerView = [self jobs_firstResponderInView:triggerScopeView];
    config.triggerView = [self jobs_view:triggerView belongsToTargetView:triggerScopeView] ? triggerView : nil;
}

-(BOOL)jobs_config:(__kindof JobsOCKeyboardConfig *)left
sharesMovingViewsWithConfig:(__kindof JobsOCKeyboardConfig *)right{
    NSArray *leftViews = [self jobs_viewsByConfig:left];
    NSArray *rightViews = [self jobs_viewsByConfig:right];
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

-(void)jobs_reapplyLatestKeyboardForConfig:(__kindof JobsOCKeyboardConfig *)config{
    if (!config.isValid || CGRectIsNull(self.latestKeyboardFrameInScreen)) return;
    JobsOCKeyboardResult *result = [JobsOCKeyboardCalculator resultByConfig:config
                                                      keyboardFrameInScreen:self.latestKeyboardFrameInScreen
                                                                   userInfo:self.latestKeyboardUserInfo];
    if (!result.keyboardVisible && !self.latestResult.keyboardVisible) return;
    [self jobs_consumeResult:result config:config];
}

-(void)jobs_consumeResult:(__kindof JobsOCKeyboardResult *)result
                   config:(__kindof JobsOCKeyboardConfig *)config{
    [self jobs_normalizeResultOffset:result config:config];
    self.latestResult = result;
    if (config.resultBlock) config.resultBlock(result);
    if (config.applyMode == JobsOCKeyboardApplyModeTransform) {
        [self jobs_applyResult:result config:config];
    }
}
#pragma mark —— InputFlow
-(void)jobs_setupInputFlowForConfig:(__kindof JobsOCKeyboardConfig *)config{
    if (!config.shouldFlowByReturnKey) return;
    NSArray <__kindof UITextField *>*inputFields = config.inputFields;
    for (UITextField *textField in inputFields) {
        textField
            .byRemoveTarget(self,
                            @selector(jobs_inputFieldDidEndOnExit:),
                            UIControlEventEditingDidEndOnExit)
            .byAddTarget(self,
                         @selector(jobs_inputFieldDidEndOnExit:),
                         UIControlEventEditingDidEndOnExit);
    }
}

-(void)jobs_teardownInputFlowForConfig:(__kindof JobsOCKeyboardConfig *)config{
    for (UITextField *textField in config.inputFields) {
        textField.byRemoveTarget(self,
                                 @selector(jobs_inputFieldDidEndOnExit:),
                                 UIControlEventEditingDidEndOnExit);
    }
}

-(UITextField *)jobs_nextInputFieldAfterTextField:(__kindof UITextField *)textField
                                           config:(__kindof JobsOCKeyboardConfig *)config{
    NSArray <__kindof UITextField *>*inputFields = config.inputFields;
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

-(void)jobs_inputFieldDidEndOnExit:(__kindof UITextField *)textField{
    JobsOCKeyboardConfig *config = self.currentConfig;
    if (!config.shouldFlowByReturnKey) return;
    UITextField *nextTextField = [self jobs_nextInputFieldAfterTextField:textField config:config];
    if (nextTextField) {
        [nextTextField becomeFirstResponder];
    }else{
        [textField resignFirstResponder];
    }
}

-(UIView *)jobs_endEditingHostViewByConfig:(__kindof JobsOCKeyboardConfig *)config{
    if (config.containerView) return config.containerView;
    if (config.targetView) return config.targetView;
    return nil;
}

-(void)jobs_setupEndEditingTapGestureForConfig:(__kindof JobsOCKeyboardConfig *)config{
    [self jobs_teardownEndEditingTapGesture];
    if (!config.shouldResignOnTouchOutside) return;
    UIView *hostView = [self jobs_endEditingHostViewByConfig:config];
    if (!hostView) return;
    UITapGestureRecognizer *tapGR = [UITapGestureRecognizer.alloc initWithTarget:self
                                                                           action:@selector(jobs_endEditingByTapGesture:)];
    tapGR.cancelsTouchesInView = NO;
    tapGR.delegate = self;
    [hostView addGestureRecognizer:tapGR];
    self.endEditingTapGR = tapGR;
    self.endEditingTapHostView = hostView;
}

-(void)jobs_teardownEndEditingTapGesture{
    if (self.endEditingTapGR && self.endEditingTapHostView) {
        [self.endEditingTapHostView removeGestureRecognizer:self.endEditingTapGR];
    }
    self.endEditingTapGR = nil;
    self.endEditingTapHostView = nil;
}

-(void)jobs_endEditingByTapGesture:(UITapGestureRecognizer *)tapGR{
    UIView *hostView = self.endEditingTapHostView;
    if (!hostView) hostView = self.currentConfig.containerView;
    if (!hostView) hostView = self.currentConfig.targetView;
    [hostView endEditing:YES];
}
#pragma mark —— UIGestureRecognizerDelegate
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
      shouldReceiveTouch:(UITouch *)touch{
    JobsOCKeyboardConfig *config = self.currentConfig;
    if (!config.shouldResignOnTouchOutside) return NO;
    if ([touch.view isKindOfClass:UIControl.class]) return NO;
    for (UITextField *textField in config.inputFields) {
        if ([touch.view isDescendantOfView:textField]) return NO;
    };return YES;
}
#pragma mark —— Transform

-(__kindof UIView *)jobs_containerViewByConfig:(__kindof JobsOCKeyboardConfig *)config{
    if (config.containerView) return config.containerView;
    if (config.targetView.window) return config.targetView.window;
    return config.targetView.superview;
}

-(BOOL)jobs_rect:(CGRect)left horizontallyIntersectsRect:(CGRect)right{
    return CGRectGetMaxX(left) > CGRectGetMinX(right) &&
           CGRectGetMinX(left) < CGRectGetMaxX(right);
}

-(CGFloat)jobs_currentOffsetYForView:(__kindof UIView *)view{
    if (!view) return 0;
    NSValue *baseValue = [self.baseTransformMap objectForKey:view];
    if (!baseValue) return 0;
    CGAffineTransform baseTransform = baseValue.CGAffineTransformValue;
    return MAX(0, baseTransform.ty - view.transform.ty);
}

-(void)jobs_normalizeResultOffset:(__kindof JobsOCKeyboardResult *)result
                           config:(__kindof JobsOCKeyboardConfig *)config{
    if (!result.keyboardVisible || CGRectIsNull(result.obstructionFrameInContainer)) return;
    if (config.shouldCheckHorizontalOverlap &&
        ![self jobs_rect:result.triggerFrameInContainer
horizontallyIntersectsRect:result.obstructionFrameInContainer]) {
        result.offsetY = 0;
        result.shouldAdjust = NO;
        return;
    }
    CGFloat currentOffsetY = [self jobs_currentOffsetYForView:config.targetView];
    if (currentOffsetY <= 0) return;
    UIView *containerView = [self jobs_containerViewByConfig:config];
    CGFloat targetBottom = CGRectGetMaxY(result.triggerFrameInContainer) + MAX(0, config.extraSpacing);
    CGFloat signedOffset = targetBottom - CGRectGetMinY(result.obstructionFrameInContainer);
    CGFloat safeTop = containerView.safeAreaInsets.top + MAX(0, config.topSpacing);
    CGFloat maxLift = config.maxLiftDistance > 0
        ? config.maxLiftDistance
        : MAX(0, CGRectGetMinY(result.targetFrameInContainer) + currentOffsetY - safeTop);
    result.offsetY = MIN(MAX(0, currentOffsetY + signedOffset), maxLift);
    result.shouldAdjust = result.offsetY > 0;
}

-(void)jobs_captureBaseTransformsForConfig:(__kindof JobsOCKeyboardConfig *)config{
    for (__kindof UIView *view in [self jobs_viewsByConfig:config]) {
        if (![self.baseTransformMap objectForKey:view]) {
            [self.baseTransformMap setObject:[NSValue valueWithCGAffineTransform:view.transform]
                                      forKey:view];
        }
    }
}

-(void)jobs_applyResult:(__kindof JobsOCKeyboardResult *)result
                 config:(__kindof JobsOCKeyboardConfig *)config{
    [self jobs_captureBaseTransformsForConfig:config];
    CGFloat offsetY = result.offsetY;
    NSTimeInterval duration = result.animationDuration > 0 ? result.animationDuration : 0.25f;
    UIViewAnimationOptions options = result.animationOptions;
    BOOL shouldClearBaseTransform = !result.keyboardVisible || !result.shouldAdjust;
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:duration
                          delay:0
                        options:options
                     animations:^{
        __strong typeof(weakSelf) self = weakSelf;
        for (__kindof UIView *view in [self jobs_viewsByConfig:config]) {
            [self jobs_applyOffset:offsetY toView:view];
        }
    } completion:^(BOOL finished) {
        __strong typeof(weakSelf) self = weakSelf;
        if (!shouldClearBaseTransform) return;
        for (__kindof UIView *view in [self jobs_viewsByConfig:config]) {
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
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:animationDuration
                          delay:0
                        options:animationOptions
                     animations:^{
        __strong typeof(weakSelf) self = weakSelf;
        for (__kindof UIView *view in [self jobs_viewsByConfig:config]) {
            [self jobs_applyOffset:0 toView:view];
        }
    } completion:^(BOOL finished) {
        __strong typeof(weakSelf) self = weakSelf;
        for (__kindof UIView *view in [self jobs_viewsByConfig:config]) {
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
    view.transform = CGAffineTransformTranslate(baseTransform, 0, -offsetY);
}

@end

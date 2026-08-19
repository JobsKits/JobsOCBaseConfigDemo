//
//  JobsGestureLockVC.m
//  JobsGestureLock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsGestureLockVC.h"

#import "JobsGestureLockIndicator.h"
#import "JobsGestureLockResource.h"
#import "JobsGestureLockStorage.h"

@interface JobsGestureLockVC ()

Prop_assign()JobsGestureLockMode mode;
Prop_strong(readwrite)JobsGestureLockConfiguration *configuration;
Prop_copy(readwrite)NSString *storageKey;
Prop_strong()JobsGestureLockView *lockView;
Prop_strong()JobsGestureLockIndicator *indicatorView;
Prop_strong()UILabel *statusLabel;
Prop_strong()UILabel *nameLabel;
Prop_strong()UIImageView *avatarView;
Prop_strong()UIButton *otherAccountButton;
Prop_strong()UIButton *resetButton;
Prop_strong()UIButton *forgotButton;
Prop_copy()NSString *firstPattern;
Prop_assign()NSInteger remainingRetryCount;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsGestureLockVC
@interface JobsGestureLockVC (JobsPropertyDSLSetterAutogen_6d5c38fbee)
-(void)setFirstPattern:(NSString * _Nullable)data;
-(void)setRemainingRetryCount:(NSInteger)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsGestureLockVC

@implementation JobsGestureLockVC
- (instancetype)init {
    return [self initWithMode:JobsGestureLockModeValidate
                   storageKey:@"JobsGestureLockDefaultKey"
                configuration:nil];
}

- (instancetype)initWithMode:(JobsGestureLockMode)mode storageKey:(NSString *)storageKey {
    return [self initWithMode:mode storageKey:storageKey configuration:nil];
}

- (instancetype)initWithMode:(JobsGestureLockMode)mode
                  storageKey:(NSString *)storageKey
               configuration:(JobsGestureLockConfiguration *)configuration {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _mode = mode;
        _storageKey = storageKey.length > 0 ? storageKey.copy : @"JobsGestureLockDefaultKey";
        _configuration = configuration ?: JobsGestureLockConfiguration.defaultConfiguration();
        _remainingRetryCount = _configuration.maxRetryCount;
        self.modalPresentationStyle = UIModalPresentationFullScreen;
    };return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    NSAssert(NO, @"initWithCoder: is unavailable.");
    return [self initWithMode:JobsGestureLockModeValidate storageKey:@"JobsGestureLockDefaultKey" configuration:nil];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    NSAssert(NO, @"initWithNibName:bundle: is unavailable.");
    return [self initWithMode:JobsGestureLockModeValidate storageKey:@"JobsGestureLockDefaultKey" configuration:nil];
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsGestureLockVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.setupSubviews();
        self.applyMode();
    };
}

- (void)viewDidLayoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsGestureLockVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
        CGFloat width = CGRectGetWidth(self.view.bounds);
        CGFloat safeBottom = self.view.safeAreaInsets.bottom;
        CGFloat horizontalMargin = 15.0;
        CGFloat buttonSpacing = 5.0;
        CGFloat buttonWidth = (width - horizontalMargin * 2.0 - buttonSpacing * 2.0) / 3.0;
        CGFloat buttonHeight = 30.0;
        self.avatarView.byFrame(CGRectMake((width - 56.0) * 0.5, 30.0 + self.view.safeAreaInsets.top, 56.0, 56.0));
        self.nameLabel.byFrame(CGRectMake((width - 120.0) * 0.5, CGRectGetMaxY(self.avatarView.frame) + 8.0, 120.0, 20.0));
        self.indicatorView.byFrame(CGRectMake((width - 60.0) * 0.5, CGRectGetMaxY(self.nameLabel.frame) + 16.0, 60.0, 60.0));
        self.statusLabel.byFrame(CGRectMake((width - 220.0) * 0.5, CGRectGetMaxY(self.indicatorView.frame) + 18.0, 220.0, 24.0));
        CGFloat lockSide = width;
        CGFloat lockY = CGRectGetHeight(self.view.bounds) - lockSide - 60.0 - buttonHeight - safeBottom;
        self.lockView.byFrame(CGRectMake(0.0, MAX(CGRectGetMaxY(self.statusLabel.frame) + 20.0, lockY), lockSide, lockSide));
        CGFloat bottomY = CGRectGetHeight(self.view.bounds) - safeBottom - 20.0 - buttonHeight;
        self.otherAccountButton.byFrame(CGRectMake(horizontalMargin, bottomY, buttonWidth, buttonHeight));
        self.resetButton.byFrame(CGRectMake(CGRectGetMaxX(self.otherAccountButton.frame) + buttonSpacing, bottomY, buttonWidth, buttonHeight));
        self.forgotButton.byFrame(CGRectMake(CGRectGetMaxX(self.resetButton.frame) + buttonSpacing, bottomY, buttonWidth, buttonHeight));
    };
}

- (jobsByVoidBlock _Nonnull)setupSubviews {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        _avatarView = [[UIImageView alloc] initWithImage:JobsGestureLockResource.imageNamed(@"gesture_headIcon")];
        _avatarView.byContentMode(UIViewContentModeScaleAspectFit);
        [self.view addSubview:_avatarView];
        _nameLabel = jobsMakeLabel(^(UILabel *object){});
        _nameLabel.byTextAlignment(NSTextAlignmentCenter);
        _nameLabel.byTextColor([UIColor colorWithRed:0.95 green:0.55 blue:0.15 alpha:1.0]);
        _nameLabel.byFont([UIFont boldSystemFontOfSize:12.0]);
        _nameLabel.byText(@"账户".jobsTr());
        [self.view addSubview:_nameLabel];
        _indicatorView = [[JobsGestureLockIndicator alloc] initWithConfiguration:self.configuration];
        [self.view addSubview:_indicatorView];
        _statusLabel = jobsMakeLabel(^(UILabel *object){});
        _statusLabel.byTextAlignment(NSTextAlignmentCenter);
        _statusLabel.byTextColor(self.configuration.statusTextColor);
        _statusLabel.byFont(self.configuration.statusFont);
        [self.view addSubview:_statusLabel];
        _lockView = [[JobsGestureLockView alloc] initWithConfiguration:self.configuration];
        _lockView.byDelegate(self);
        [self.view addSubview:_lockView];
        _otherAccountButton = [self actionButtonWithTitle:@"其他账户" action:^(__kindof UIButton * _Nullable button) {
            weak_self.didTapOtherAccount(button);
        }];
        _resetButton = [self actionButtonWithTitle:@"重新绘制" action:^(__kindof UIButton * _Nullable button) {
            weak_self.didTapReset(button);
        }];
        _forgotButton = [self actionButtonWithTitle:@"忘记密码" action:^(__kindof UIButton * _Nullable button) {
            weak_self.didTapForgot(button);
        }];
    };
}

-(UIButton *)actionButtonWithTitle:(NSString *)title action:(jobsByBtnBlock)action {
    return jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        button
            .jobsResetBtnTitle(title)
            .onClickBy(action)
            .addOn(self.view);
    });
}

-(jobsByVoidBlock _Nonnull)applyMode {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        switch (self.mode) {
            /// 处理 JobsGestureLockModeCreate 分支
            case JobsGestureLockModeCreate:
                self.statusLabel.byText(self.configuration.createStatusText);
                self.indicatorView.byHidden(NO);
                self.resetButton.byHidden(YES);
                self.forgotButton.byHidden(YES);
                break;
            /// 处理 JobsGestureLockModeValidate 分支
            case JobsGestureLockModeValidate:
                self.statusLabel.byText(self.configuration.validateStatusText);
                self.indicatorView.byHidden(YES);
                self.resetButton.byHidden(YES);
                self.forgotButton.byHidden(NO);
                break;
        }
    };
}

-(void)gestureLockView:(JobsGestureLockView *)lockView didCompletePattern:(NSString *)pattern {
    switch (self.mode) {
        /// 处理 JobsGestureLockModeCreate 分支
        case JobsGestureLockModeCreate:
            self.handleCreatePattern(pattern);
            break;
        /// 处理 JobsGestureLockModeValidate 分支
        case JobsGestureLockModeValidate:
            self.handleValidatePattern(pattern);
            break;
    }
}

-(jobsByStrBlock _Nonnull)handleCreatePattern{
    @jobs_weakify(self)
    return ^(NSString * pattern){
        @jobs_strongify(self)
        if (!self) return;
        if (pattern.length < self.configuration.minimumPatternLength) {
            self.statusLabel.byText(self.configuration.tooShortStatusText);
            self.lockView.showValidationResult(JobsGestureLockValidationResultTooShort);
            self.shakeView(self.statusLabel);
            self.resetLockViewAfterDelay();
            return;
        }
        if (self.firstPattern.length == 0) {
            self.byFirstPattern(pattern);
            self.statusLabel.byText(self.configuration.confirmStatusText);
            self.resetButton.byHidden(NO);
            self.indicatorView.updateWithPattern(pattern);
            self.lockView.showValidationResult(JobsGestureLockValidationResultSuccess);
            self.resetLockViewAfterDelay();
            return;
        }
        if ([self.firstPattern isEqualToString:pattern]) {
            [JobsGestureLockStorage saveGesturePassword:pattern forKey:self.storageKey];
            if (self.completionHandler) {
                self.completionHandler(YES, pattern);
            }
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            self.statusLabel.byText(self.configuration.mismatchStatusText);
            self.lockView.showValidationResult(JobsGestureLockValidationResultFailure);
            self.shakeView(self.statusLabel);
            self.resetLockViewAfterDelay();
        }
    };
}

-(jobsByStrBlock _Nonnull)handleValidatePattern{
    @jobs_weakify(self)
    return ^(NSString * pattern){
        @jobs_strongify(self)
        if (!self) return;
        NSString *storedPattern = JobsGestureLockStorage.gesturePasswordForKey(self.storageKey);
        if (storedPattern.length > 0 && [storedPattern isEqualToString:pattern]) {
            self.byRemainingRetryCount(self.configuration.maxRetryCount);
            if (self.completionHandler) {
                self.completionHandler(YES, pattern);
            }
            [self dismissViewControllerAnimated:YES completion:nil];
            return;
        }
        self.remainingRetryCount -= 1;
        self.lockView.showValidationResult(JobsGestureLockValidationResultFailure);
        if (self.remainingRetryCount <= 0) {
            self.byRemainingRetryCount(self.configuration.maxRetryCount);
            self.presentInvalidatedAlert();
            return;
        }
        self.statusLabel.byText([NSString stringWithFormat:self.configuration.errorFormat, (long)self.remainingRetryCount]);
        self.shakeView(self.statusLabel);
        self.resetLockViewAfterDelay();
    };
}

-(jobsByVoidBlock _Nonnull)presentInvalidatedAlert {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"手势密码已失效".jobsTr()
                                                                                 message:@"请重新登录".jobsTr()
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        @jobs_weakify(self)
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"重新登录".jobsTr()
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
            @jobs_strongify(self)
            if (!self) {
                return;
            }
            if (self.completionHandler) {
                self.completionHandler(NO, nil);
            }
        }];
        [alertController addAction:action];
        [self presentViewController:alertController animated:YES completion:nil];
        self.resetLockViewAfterDelay();
    };
}

-(jobsByBtnBlock _Nonnull)didTapOtherAccount{
    @jobs_weakify(self)
    return ^(UIButton * sender){
        @jobs_strongify(self)
        if (!self) return;
        if (self.otherAccountHandler) {
            self.otherAccountHandler();
        }
    };
}

-(jobsByBtnBlock _Nonnull)didTapReset{
    @jobs_weakify(self)
    return ^(UIButton * sender){
        @jobs_strongify(self)
        if (!self) return;
        self.byFirstPattern(nil);
        self.resetButton.byHidden(YES);
        self.statusLabel.byText(self.configuration.createStatusText);
        self.indicatorView.updateWithPattern(nil);
        self.lockView.reset();
    };
}

-(jobsByBtnBlock _Nonnull)didTapForgot{
    @jobs_weakify(self)
    return ^(UIButton * sender){
        @jobs_strongify(self)
        if (!self) return;
        if (self.forgotPasswordHandler) {
            self.forgotPasswordHandler();
        }
    };
}

-(jobsByViewBlock _Nonnull)shakeView{
    @jobs_weakify(self)
    return ^(UIView * view){
        @jobs_strongify(self)
        if (!self) return;
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
        CGPoint center = view.layer.position;
        animation.byFromValue([NSValue valueWithCGPoint:CGPointMake(center.x - 10.0, center.y)]);
        animation.byToValue([NSValue valueWithCGPoint:CGPointMake(center.x + 10.0, center.y)]);
        animation.byAutoreverses(YES);
        animation.byDuration(0.08);
        animation.byRepeatCount(3);
        animation.byTimingFunction([CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]);
        [view.layer addAnimation:animation forKey:nil];
    };
}

- (jobsByVoidBlock _Nonnull)resetLockViewAfterDelay {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.35 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.lockView.reset();
        });
    };
}

+(JobsRetStrByStrBlock _Nonnull)gesturePasswordForKey{
    return ^NSString *(NSString * key){
        return JobsGestureLockStorage.gesturePasswordForKey(key);
    };
}

+(void)saveGesturePassword:(NSString *)password forKey:(NSString *)key {
    [JobsGestureLockStorage saveGesturePassword:password forKey:key];
}

+(jobsByStrBlock _Nonnull)deleteGesturePasswordForKey{
    return ^(NSString * key){
        JobsGestureLockStorage.deleteGesturePasswordForKey(key);
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsGestureLockVC
-(JobsRetJobsGestureLockVCByNSIntegerBlock _Nonnull)byRemainingRetryCount{
    @jobs_weakify(self)
    return ^__kindof JobsGestureLockVC * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setRemainingRetryCount:data];
        return self;
    };
}

-(JobsRetJobsGestureLockVCByNSStringBlock _Nonnull)byFirstPattern{
    @jobs_weakify(self)
    return ^__kindof JobsGestureLockVC * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setFirstPattern:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsGestureLockVC
@end

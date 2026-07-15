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
        _configuration = configuration ?: [JobsGestureLockConfiguration defaultConfiguration];
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
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self setupSubviews];
    [self applyMode];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGFloat width = CGRectGetWidth(self.view.bounds);
    CGFloat safeBottom = self.view.safeAreaInsets.bottom;
    CGFloat horizontalMargin = 15.0;
    CGFloat buttonSpacing = 5.0;
    CGFloat buttonWidth = (width - horizontalMargin * 2.0 - buttonSpacing * 2.0) / 3.0;
    CGFloat buttonHeight = 30.0;
    self.avatarView.frame = CGRectMake((width - 56.0) * 0.5, 30.0 + self.view.safeAreaInsets.top, 56.0, 56.0);
    self.nameLabel.frame = CGRectMake((width - 120.0) * 0.5, CGRectGetMaxY(self.avatarView.frame) + 8.0, 120.0, 20.0);
    self.indicatorView.frame = CGRectMake((width - 60.0) * 0.5, CGRectGetMaxY(self.nameLabel.frame) + 16.0, 60.0, 60.0);
    self.statusLabel.frame = CGRectMake((width - 220.0) * 0.5, CGRectGetMaxY(self.indicatorView.frame) + 18.0, 220.0, 24.0);
    CGFloat lockSide = width;
    CGFloat lockY = CGRectGetHeight(self.view.bounds) - lockSide - 60.0 - buttonHeight - safeBottom;
    self.lockView.frame = CGRectMake(0.0, MAX(CGRectGetMaxY(self.statusLabel.frame) + 20.0, lockY), lockSide, lockSide);
    CGFloat bottomY = CGRectGetHeight(self.view.bounds) - safeBottom - 20.0 - buttonHeight;
    self.otherAccountButton.frame = CGRectMake(horizontalMargin, bottomY, buttonWidth, buttonHeight);
    self.resetButton.frame = CGRectMake(CGRectGetMaxX(self.otherAccountButton.frame) + buttonSpacing, bottomY, buttonWidth, buttonHeight);
    self.forgotButton.frame = CGRectMake(CGRectGetMaxX(self.resetButton.frame) + buttonSpacing, bottomY, buttonWidth, buttonHeight);
}

- (void)setupSubviews {
    _avatarView = [[UIImageView alloc] initWithImage:[JobsGestureLockResource imageNamed:@"gesture_headIcon"]];
    _avatarView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_avatarView];
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.textColor = [UIColor colorWithRed:0.95 green:0.55 blue:0.15 alpha:1.0];
    _nameLabel.font = [UIFont boldSystemFontOfSize:12.0];
    _nameLabel.text = @"账户";
    [self.view addSubview:_nameLabel];
    _indicatorView = [[JobsGestureLockIndicator alloc] initWithConfiguration:self.configuration];
    [self.view addSubview:_indicatorView];
    _statusLabel = [[UILabel alloc] init];
    _statusLabel.textAlignment = NSTextAlignmentCenter;
    _statusLabel.textColor = self.configuration.statusTextColor;
    _statusLabel.font = self.configuration.statusFont;
    [self.view addSubview:_statusLabel];
    _lockView = [[JobsGestureLockView alloc] initWithConfiguration:self.configuration];
    _lockView.delegate = self;
    [self.view addSubview:_lockView];
    _otherAccountButton = [self actionButtonWithTitle:@"其他账户" selector:@selector(didTapOtherAccount:)];
    _resetButton = [self actionButtonWithTitle:@"重新绘制" selector:@selector(didTapReset:)];
    _forgotButton = [self actionButtonWithTitle:@"忘记密码" selector:@selector(didTapForgot:)];
}

-(UIButton *)actionButtonWithTitle:(NSString *)title selector:(SEL)selector {
    return (UIButton *)UIButton.alloc.init
        .byAddTarget(self, selector, UIControlEventTouchUpInside)
        .byViewBlock(^(__kindof UIView *view) {
            [(UIButton *)view setTitle:title forState:UIControlStateNormal];
        })
        .addOn(self.view);
}

-(void)applyMode {
    switch (self.mode) {
        case JobsGestureLockModeCreate:
            self.statusLabel.text = self.configuration.createStatusText;
            self.indicatorView.hidden = NO;
            self.resetButton.hidden = YES;
            self.forgotButton.hidden = YES;
            break;
        case JobsGestureLockModeValidate:
            self.statusLabel.text = self.configuration.validateStatusText;
            self.indicatorView.hidden = YES;
            self.resetButton.hidden = YES;
            self.forgotButton.hidden = NO;
            break;
    }
}

-(void)gestureLockView:(JobsGestureLockView *)lockView didCompletePattern:(NSString *)pattern {
    switch (self.mode) {
        case JobsGestureLockModeCreate:
            [self handleCreatePattern:pattern];
            break;
        case JobsGestureLockModeValidate:
            [self handleValidatePattern:pattern];
            break;
    }
}

-(void)handleCreatePattern:(NSString *)pattern {
    if (pattern.length < self.configuration.minimumPatternLength) {
        self.statusLabel.text = self.configuration.tooShortStatusText;
        [self.lockView showValidationResult:JobsGestureLockValidationResultTooShort];
        [self shakeView:self.statusLabel];
        [self resetLockViewAfterDelay];
        return;
    }
    if (self.firstPattern.length == 0) {
        self.firstPattern = pattern;
        self.statusLabel.text = self.configuration.confirmStatusText;
        self.resetButton.hidden = NO;
        [self.indicatorView updateWithPattern:pattern];
        [self.lockView showValidationResult:JobsGestureLockValidationResultSuccess];
        [self resetLockViewAfterDelay];
        return;
    }
    if ([self.firstPattern isEqualToString:pattern]) {
        [JobsGestureLockStorage saveGesturePassword:pattern forKey:self.storageKey];
        if (self.completionHandler) {
            self.completionHandler(YES, pattern);
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        self.statusLabel.text = self.configuration.mismatchStatusText;
        [self.lockView showValidationResult:JobsGestureLockValidationResultFailure];
        [self shakeView:self.statusLabel];
        [self resetLockViewAfterDelay];
    }
}

-(void)handleValidatePattern:(NSString *)pattern {
    NSString *storedPattern = [JobsGestureLockStorage gesturePasswordForKey:self.storageKey];
    if (storedPattern.length > 0 && [storedPattern isEqualToString:pattern]) {
        self.remainingRetryCount = self.configuration.maxRetryCount;
        if (self.completionHandler) {
            self.completionHandler(YES, pattern);
        }
        [self dismissViewControllerAnimated:YES completion:nil];
        return;
    }
    self.remainingRetryCount -= 1;
    [self.lockView showValidationResult:JobsGestureLockValidationResultFailure];
    if (self.remainingRetryCount <= 0) {
        self.remainingRetryCount = self.configuration.maxRetryCount;
        [self presentInvalidatedAlert];
        return;
    }
    self.statusLabel.text = [NSString stringWithFormat:self.configuration.errorFormat, (long)self.remainingRetryCount];
    [self shakeView:self.statusLabel];
    [self resetLockViewAfterDelay];
}

-(void)presentInvalidatedAlert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"手势密码已失效"
                                                                             message:@"请重新登录"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    __weak typeof(self) weakSelf = self;
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"重新登录"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * _Nonnull action) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (!strongSelf) {
            return;
        }
        if (strongSelf.completionHandler) {
            strongSelf.completionHandler(NO, nil);
        }
    }];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:nil];
    [self resetLockViewAfterDelay];
}

-(void)didTapOtherAccount:(UIButton *)sender {
    if (self.otherAccountHandler) {
        self.otherAccountHandler();
    }
}

-(void)didTapReset:(UIButton *)sender {
    self.firstPattern = nil;
    self.resetButton.hidden = YES;
    self.statusLabel.text = self.configuration.createStatusText;
    [self.indicatorView updateWithPattern:nil];
    [self.lockView reset];
}

-(void)didTapForgot:(UIButton *)sender {
    if (self.forgotPasswordHandler) {
        self.forgotPasswordHandler();
    }
}

-(void)shakeView:(UIView *)view {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    CGPoint center = view.layer.position;
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(center.x - 10.0, center.y)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(center.x + 10.0, center.y)];
    animation.autoreverses = YES;
    animation.duration = 0.08;
    animation.repeatCount = 3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [view.layer addAnimation:animation forKey:nil];
}

- (void)resetLockViewAfterDelay {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.35 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.lockView reset];
    });
}

+(NSString *)gesturePasswordForKey:(NSString *)key {
    return [JobsGestureLockStorage gesturePasswordForKey:key];
}

+(void)saveGesturePassword:(NSString *)password forKey:(NSString *)key {
    [JobsGestureLockStorage saveGesturePassword:password forKey:key];
}

+(void)deleteGesturePasswordForKey:(NSString *)key {
    [JobsGestureLockStorage deleteGesturePasswordForKey:key];
}

@end

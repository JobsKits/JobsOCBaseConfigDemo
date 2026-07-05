//
//  JobsOCSplashVC.m
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#import "JobsOCSplashVC.h"

static NSString * const JobsOCSplashCountdownTimeKey = @"com.BSports.countdownTimeKey";
static NSString * const JobsOCSplashIsCountdownTimeKey = @"com.BSports.isCountdownTimeKey";
static NSInteger const JobsOCSplashDefaultCountdownTime = 15 * 60;

@interface JobsOCSplashVC ()

Prop_strong()JobsOCSplashConfiguration *configuration;
Prop_strong()UIImageView *imageView;
Prop_strong()UIButton *countdownBtn;
Prop_strong(nullable)NSURLSessionTask *mediaTask;
Prop_strong(nullable)AVPlayer *player;
Prop_strong(nullable)AVPlayerLayer *playerLayer;
Prop_assign()BOOL hasFinished;
Prop_assign()BOOL isCountdownTime;
Prop_assign()NSInteger countdownTime;
Prop_assign(readonly)NSInteger effectiveCountdownSeconds;
Prop_strong(nullable, readonly)NSNumber *configuredRemainingSeconds;

@end

@implementation JobsOCSplashVC

-(instancetype)initWithConfiguration:(JobsOCSplashConfiguration *)configuration {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _configuration = [configuration copy];
    };return self;
}

-(BOOL)canBecomeFirstResponder {
    return YES;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(UIColor.blackColor);
    self.imageView.addOn(self.view);
    self.countdownBtn.addOn(self.view);
    [self remakeSkipButtonConstraints];
    [self renderContent];
    self.countdownBtn.startTimerBy(self.countdownTime);
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.imageView.frame = self.view.bounds;
    self.playerLayer.frame = self.view.bounds;
    [self refreshSkipButtonCornerRadius];
}

-(void)viewSafeAreaInsetsDidChange {
    [super viewSafeAreaInsetsDidChange];
    [self remakeSkipButtonConstraints];
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    [super motionEnded:motion withEvent:event];
    if (motion != UIEventSubtypeMotionShake) return;
    [self.configuration.shakeAction performWithSplashVC:self];
}

-(void)dealloc {
    self.countdownBtn.timerDestroy();
    [self.mediaTask cancel];
    [self.player pause];
}

-(UIImageView *)imageView {
    if (!_imageView) {
        _imageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView
                .byContentMode(self.configuration.contentMode)
                .byClipsToBounds(YES)
                .byUserInteractionEnabled(YES)
                .byAddGestureRecognizer([[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSplashContent)]);
        });
    };return _imageView;
}

-(UIButton *)countdownBtn {
    if (!_countdownBtn) {
        @jobs_weakify(self)
        _countdownBtn = jobsMakeButton(^(__kindof UIButton * _Nullable btn) {
            @jobs_strongify(self)
            btn
                .byTitle([self skipButtonTitleWithRemainingSeconds:self.configuredRemainingSeconds])
                .byTitleCor(JobsWhiteColor)
                .byTitleFont(UIFontWeightRegularSize(24))
                .byTimerType(JobsTimerTypeGCD)
                .byTimerStyle(TimerStyle_anticlockwise)
                .byStartTime(self.countdownTime)
                .byTimeInterval(1)
                .byClickWhenTimerCycle(YES)
                .onJobsEvent(UIControlEventTouchDown |
                                UIControlEventTouchDragInside |
                                UIControlEventTouchDragOutside |
                                UIControlEventTouchUpInside |
                                UIControlEventTouchUpOutside |
                                UIControlEventTouchCancel, ^(__kindof UIControl * _Nullable control) {
                    @jobs_strongify(self)
                    [self refreshSkipButtonCornerRadius];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self refreshSkipButtonCornerRadius];
                    });
                })
                .byOnTick(^(CGFloat time) {
                    @jobs_strongify(self)
                    NSInteger remainingSeconds = MAX(0, (NSInteger)ceil(time));
                    self.isCountdownTime = YES;
                    self.countdownTime = remainingSeconds;
                    btn.byTitle([self skipButtonTitleWithRemainingSeconds:@(remainingSeconds)]);
                    [self remakeSkipButtonConstraints];
                })
                .byOnFinish(^(__kindof JobsTimer *_Nullable timer) {
                    @jobs_strongify(self)
                    [self finish];
                })
                .onClickBy(^(__kindof UIButton * _Nullable x) {
                    @jobs_strongify(self)
                    [self finish];
                })
                .byBgColor(HEXCOLOR(0xAE8330))
                .byHidden(!self.configuration.skipButtonVisible);
            btn.adjustsImageWhenHighlighted = NO;
        });
    };return _countdownBtn;
}

-(CGFloat)skipButtonDynamicWidth {
    CGSize size = [self.countdownBtn sizeThatFits:CGSizeMake(160, 36)];
    return MAX(64, size.width + 24);
}

-(void)remakeSkipButtonConstraints {
    if (!self.countdownBtn.superview) return;
    [UIView performWithoutAnimation:^{
        if (self.configuration.usesCustomSkipButtonFrame) {
            CGRect frame = self.configuration.skipButtonFrame;
            self.countdownBtn.byRemake(^(MASConstraintMaker *make) {
                make.left.equalTo(self.view).offset(CGRectGetMinX(frame));
                make.top.equalTo(self.view).offset(CGRectGetMinY(frame));
                make.size.mas_equalTo(frame.size);
            });
        } else {
            UIEdgeInsets insets = self.configuration.skipButtonInsets;
            CGFloat width = [self skipButtonDynamicWidth];
            self.countdownBtn.byRemake(^(MASConstraintMaker *make) {
                make.right.equalTo(self.view).offset(-insets.right);
                if (@available(iOS 11.0, *)) {
                    make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(insets.top);
                } else {
                    make.top.equalTo(self.view).offset(insets.top);
                }
                make.size.mas_equalTo(CGSizeMake(width, 36));
            });
        }
        [self.view layoutIfNeeded];
        [self refreshSkipButtonCornerRadius];
    }];
}

-(void)refreshSkipButtonCornerRadius {
    CGFloat height = CGRectGetHeight(self.countdownBtn.bounds);
    if (height <= 0) return;
    self.countdownBtn
        .byCornerRadius(height / 2)
        .byClipsToBounds(YES);
}

-(void)finish {
    if (self.hasFinished) return;
    self.hasFinished = YES;
    self.isCountdownTime = NO;
    self.countdownTime = 0;
    self.countdownBtn.timerDestroy();
    [self.mediaTask cancel];
    [self.player pause];
    if (self.configuration.onSkip) self.configuration.onSkip(self);

    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:NO completion:nil];
    } else if (self.parentViewController) {
        [self willMoveToParentViewController:nil];
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    } else if (self.navigationController && self.navigationController.viewControllers.firstObject != self) {
        [self.navigationController popViewControllerAnimated:NO];
    } else {
        [self willMoveToParentViewController:nil];
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }
}

-(void)renderContent {
    switch (self.configuration.contentType) {
        case JobsOCSplashContentTypeLocalImage:
            self.imageView.image = [UIImage imageNamed:self.configuration.resourceName inBundle:self.configuration.bundle compatibleWithTraitCollection:nil];
            break;
        case JobsOCSplashContentTypeLocalGIF: {
            NSURL *url = [self resourceURLWithName:self.configuration.resourceName defaultExtension:@"gif" bundle:self.configuration.bundle];
            NSData *data = url ? [NSData dataWithContentsOfURL:url] : nil;
            self.imageView.image = data ? [JobsOCSplashGIFDecoder imageWithData:data] : nil;
        } break;
        case JobsOCSplashContentTypeRemoteImage:
            [self loadRemoteImage:self.configuration.remoteURL];
            break;
        case JobsOCSplashContentTypeLocalVideo: {
            NSURL *url = [self resourceURLWithName:self.configuration.resourceName defaultExtension:self.configuration.fileExtension bundle:self.configuration.bundle];
            if (url) [self playVideo:url];
        } break;
        case JobsOCSplashContentTypeRemoteVideo:
            [self loadRemoteVideo:self.configuration.remoteURL];
            break;
    }
}

-(void)loadRemoteImage:(NSURL *)url {
    if (!url) return;
    NSURL *cachedURL = [JobsOCSplashMediaCache.shared cachedFileURLForRemoteURL:url];
    if (cachedURL) {
        NSData *data = [NSData dataWithContentsOfURL:cachedURL];
        self.imageView.image = [self imageWithData:data URL:url];
        return;
    }
    __weak typeof(self) weakSelf = self;
    self.mediaTask = [JobsOCSplashMediaCache.shared download:url completion:^(NSURL *fileURL, NSError *error) {
        __strong typeof(weakSelf) self = weakSelf;
        if (!self || !fileURL || error) return;
        NSData *data = [NSData dataWithContentsOfURL:fileURL];
        self.imageView.image = [self imageWithData:data URL:url];
    }];
}

-(void)loadRemoteVideo:(NSURL *)url {
    if (!url) return;
    NSURL *cachedURL = [JobsOCSplashMediaCache.shared cachedFileURLForRemoteURL:url];
    if (cachedURL) {
        [self playVideo:cachedURL];
        return;
    }
    __weak typeof(self) weakSelf = self;
    self.mediaTask = [JobsOCSplashMediaCache.shared download:url completion:^(NSURL *fileURL, NSError *error) {
        __strong typeof(weakSelf) self = weakSelf;
        if (!self || !fileURL || error) return;
        [self playVideo:fileURL];
    }];
}

-(void)playVideo:(NSURL *)url {
    AVPlayer *player = [AVPlayer playerWithURL:url];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    playerLayer.videoGravity = self.configuration.videoGravity;
    playerLayer.frame = self.view.bounds;
    [self.view.layer insertSublayer:playerLayer above:self.imageView.layer];
    self.player = player;
    self.playerLayer = playerLayer;
    [player play];
}

-(UIImage *)imageWithData:(NSData *)data URL:(NSURL *)url {
    if ([url.pathExtension.lowercaseString isEqualToString:@"gif"]) {
        return [JobsOCSplashGIFDecoder imageWithData:data];
    };return [UIImage imageWithData:data];
}

-(NSURL *)resourceURLWithName:(NSString *)name defaultExtension:(NSString *)defaultExtension bundle:(NSBundle *)bundle {
    NSString *pathExtension = name.pathExtension;
    if (pathExtension.length) {
        return [bundle URLForResource:name.stringByDeletingPathExtension withExtension:pathExtension];
    };return [bundle URLForResource:name withExtension:defaultExtension];
}

-(BOOL)isCountdownTime {
    return [NSUserDefaults.standardUserDefaults boolForKey:JobsOCSplashIsCountdownTimeKey];
}

-(void)setIsCountdownTime:(BOOL)isCountdownTime {
    [NSUserDefaults.standardUserDefaults setBool:isCountdownTime forKey:JobsOCSplashIsCountdownTimeKey];
}

-(NSInteger)countdownTime {
    if (!self.isCountdownTime) return self.effectiveCountdownSeconds;
    NSInteger value = [NSUserDefaults.standardUserDefaults integerForKey:JobsOCSplashCountdownTimeKey];
    return value > 0 ? value : self.effectiveCountdownSeconds;
}

-(void)setCountdownTime:(NSInteger)countdownTime {
    [NSUserDefaults.standardUserDefaults setInteger:countdownTime forKey:JobsOCSplashCountdownTimeKey];
}

-(NSInteger)effectiveCountdownSeconds {
    return MAX(0, self.configuration.countdownSeconds ? self.configuration.countdownSeconds.integerValue : JobsOCSplashDefaultCountdownTime);
}

-(NSNumber *)configuredRemainingSeconds {
    return (!self.configuration.countdownSeconds && !self.isCountdownTime) ? nil : @(self.countdownTime);
}

-(NSString *)skipButtonTitleWithRemainingSeconds:(NSNumber *_Nullable)remainingSeconds {
    return [JobsOCSplashLocalization skipTitleWithLanguageCode:self.configuration.languageCode remainingSeconds:remainingSeconds];
}

-(void)tapSplashContent {
    [self.configuration.tapAction performWithSplashVC:self];
}

@end

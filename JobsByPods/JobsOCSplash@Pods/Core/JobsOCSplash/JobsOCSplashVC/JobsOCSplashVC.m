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
Prop_strong()UILabel *remoteVideoDownloadNoticeLabel;
Prop_strong()UIButton *countdownBtn;
Prop_strong(nullable)NSURLSessionTask *mediaTask;
Prop_strong(nullable)AVPlayer *player;
Prop_strong(nullable)AVPlayerLayer *playerLayer;
-(JobsRetJobsOCSplashVCByAVPlayerBlock _Nonnull)byPlayer;
Prop_copy(nullable)jobsByVoidBlock hostGestureRestoration;
-(void)restoreHostGesturesIfNeeded;
-(jobsByVoidBlock _Nonnull)jobsRestoreHostGesturesIfNeeded;
Prop_assign()BOOL hasFinished;
Prop_assign()BOOL isCountdownTime;
Prop_assign()NSInteger countdownTime;
Prop_assign(readonly)NSInteger effectiveCountdownSeconds;
Prop_strong(nullable, readonly)NSNumber *configuredRemainingSeconds;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCSplashVC
@interface JobsOCSplashVC (JobsPropertyDSLSetterAutogen_cca106426b)
-(void)setCountdownTime:(NSInteger)data;
-(void)setHasFinished:(BOOL)data;
-(void)setHostGestureRestoration:(jobsByVoidBlock)data;
-(void)setIsCountdownTime:(BOOL)data;
-(void)setPlayerLayer:(AVPlayerLayer * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCSplashVC

@implementation JobsOCSplashVC

-(JobsRetJobsOCSplashVCByAVPlayerBlock _Nonnull)byPlayer{
    @jobs_weakify(self)
    return ^__kindof JobsOCSplashVC *_Nullable(AVPlayer *_Nullable player){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setPlayer:player];
        return self;
    };
}
-(instancetype)initWithConfiguration:(JobsOCSplashConfiguration *)configuration {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _configuration = [configuration copy];
    };return self;
}

-(BOOL)canBecomeFirstResponder {
    return (((JobsRetBOOLByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSplashVC.class, @selector(jobsCanBecomeFirstResponder)))(self, @selector(jobsCanBecomeFirstResponder)))();
}

-(JobsRetBOOLByVoidBlock _Nonnull)jobsCanBecomeFirstResponder {
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return YES;
    };
}

-(void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSplashVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.imageView.addOn(self.view);
        self.remoteVideoDownloadNoticeLabel.addOn(self.view);
        self.countdownBtn.addOn(self.view);
        self.remakeSkipButtonConstraints();
        self.renderContent();
        self.countdownBtn.startTimerBy(self.countdownTime).byEnabled(YES);
    };
}

-(void)viewDidAppear:(BOOL)animated {
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSplashVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
        [self becomeFirstResponder];
    };
}

-(void)viewDidLayoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSplashVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
        self.imageView.byFrame(self.view.bounds);
        if (self.playerLayer) self.playerLayer.byFrame(self.view.bounds);
        self.refreshSkipButtonCornerRadius();
    };
}

-(void)viewSafeAreaInsetsDidChange {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSplashVC.class, @selector(jobsViewSafeAreaInsetsDidChange)))(self, @selector(jobsViewSafeAreaInsetsDidChange));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewSafeAreaInsetsDidChange{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewSafeAreaInsetsDidChange];
        self.remakeSkipButtonConstraints();
    };
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    [super motionEnded:motion withEvent:event];
    if (motion != UIEventSubtypeMotionShake) return;
    self.configuration.shakeAction.performWithSplashVC(self);
}

-(void)dealloc {
    [self restoreHostGesturesIfNeeded];
    if (_countdownBtn) _countdownBtn.timerDestroy();
    [_mediaTask cancel];
    [_player pause];
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

-(UILabel *)remoteVideoDownloadNoticeLabel {
    if (!_remoteVideoDownloadNoticeLabel) {
        _remoteVideoDownloadNoticeLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(JobsOCSplashLocalization.remoteVideoWiFiDownloadNoticeWithLanguageCode(self.configuration.languageCode))
                .byTextCor(JobsWhiteColor)
                .byFont(UIFontWeightMediumSize(12))
                .byTextAlignment(NSTextAlignmentRight)
                .byNumberOfLines(1)
                .byHidden(YES);
        });
    };return _remoteVideoDownloadNoticeLabel;
}

-(UIButton *)countdownBtn {
    if (!_countdownBtn) {
        @jobs_weakify(self)
        _countdownBtn = jobsMakeButton(^(__kindof UIButton * _Nullable btn) {
            @jobs_strongify(self)
            btn
                .byTitle(self.skipButtonTitleWithRemainingSeconds(self.configuredRemainingSeconds))
                .byTitleCor(JobsWhiteColor)
                .byTitleFont(UIFontWeightRegularSize(24))
                .byTimerType(JobsTimerTypeGCD)
                .byTimerStyle(TimerStyle_anticlockwise)
                .byStartTime(self.countdownTime)
                .byTimeInterval(1)
                .byClickWhenTimerCycle(YES)
                .onClickBy(^(__kindof UIButton * _Nullable button) {
                    weak_self.skipButtonDidTap();
                })
                .onJobsEvent(UIControlEventTouchDown |
                                UIControlEventTouchDragInside |
                                UIControlEventTouchDragOutside |
                                UIControlEventTouchUpInside |
                                UIControlEventTouchUpOutside |
                                UIControlEventTouchCancel, ^(__kindof UIControl * _Nullable control) {
                    @jobs_strongify(self)
                    self.refreshSkipButtonCornerRadius();
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.refreshSkipButtonCornerRadius();
                    });
                })
                .byOnTick(^(CGFloat time) {
                    @jobs_strongify(self)
                    NSInteger remainingSeconds = MAX(0, (NSInteger)ceil(time));
                    self.byIsCountdownTime(YES);
                    self.byCountdownTime(remainingSeconds);
                    btn.byTitle(self.skipButtonTitleWithRemainingSeconds(@(remainingSeconds)));
                    self.remakeSkipButtonConstraints();
                })
                .byOnFinish(^(__kindof JobsTimer *_Nullable timer) {
                    @jobs_strongify(self)
                    [self finish]();
                })
                .jobsResetBtnBgCor(HEXCOLOR(0xAE8330))
                .jobsResetBtnCornerRadiusValue(18)
                .byAdjustsImageWhenHighlighted(NO)
                .byClipsToBounds(YES)
                .byHidden(!self.configuration.skipButtonVisible);
        });
    };return _countdownBtn;
}

-(JobsRetCGFloatByVoidBlock _Nonnull)skipButtonDynamicWidth {
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        CGSize size = [self.countdownBtn sizeThatFits:CGSizeMake(160, 36)];
        return MAX(64, size.width + 24);
    };
}

-(jobsByVoidBlock _Nonnull)remakeSkipButtonConstraints {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
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
                CGFloat width = self.skipButtonDynamicWidth();
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
            self.remoteVideoDownloadNoticeLabel.byRemake(^(MASConstraintMaker *make) {
                make.right.equalTo(self.countdownBtn.mas_left).offset(-8);
                make.centerY.equalTo(self.countdownBtn);
                make.left.greaterThanOrEqualTo(self.view).offset(16);
                make.height.mas_equalTo(36);
            });
            [self.view layoutIfNeeded];
            self.refreshSkipButtonCornerRadius();
        }];
    };
}

-(jobsByVoidBlock _Nonnull)refreshSkipButtonCornerRadius {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGFloat height = CGRectGetHeight(self.countdownBtn.bounds);
        if (height <= 0) return;
        self.countdownBtn
            .jobsResetBtnCornerRadiusValue(height / 2)
            .byClipsToBounds(YES);
    };
}

-(jobsByVoidBlock _Nonnull)skipButtonDidTap {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self finish]();
    };
}

-(jobsByVoidBlock _Nonnull)finish {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.hasFinished) return;
        self.byHasFinished(YES);
        self.byIsCountdownTime(NO);
        self.byCountdownTime(0);
        self.countdownBtn.timerDestroy();
        self.mediaTask.cancel;
        self.player.pause;
        self.jobsRestoreHostGesturesIfNeeded();
        if (self.configuration.onSkip) self.configuration.onSkip(self);
        if (self.presentingViewController) {
            [self dismissViewControllerAnimated:NO completion:nil];
        } else {
            [self willMoveToParentViewController:nil];
            [self.view removeFromSuperview];
            [self removeFromParentViewController];
        }
    };
}

-(jobsByRACSchedulerRecursiveBlock _Nonnull)restoreHostGesturesOnFinish{
    @jobs_weakify(self)
    return ^(jobsByVoidBlock block){
        @jobs_strongify(self)
        if (!self) return;
        self.byHostGestureRestoration(block);
    };
}

-(void)restoreHostGesturesIfNeeded {
    jobsByVoidBlock block = _hostGestureRestoration;
    _hostGestureRestoration = nil;
    if (block) block();
}

-(jobsByVoidBlock _Nonnull)jobsRestoreHostGesturesIfNeeded {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self restoreHostGesturesIfNeeded];
    };
}

-(jobsByVoidBlock _Nonnull)renderContent {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        switch (self.configuration.contentType) {
            /// 处理 JobsOCSplashContentTypeLocalImage 分支
            case JobsOCSplashContentTypeLocalImage:
                self.imageView.byImage([UIImage imageNamed:self.configuration.resourceName inBundle:self.configuration.bundle compatibleWithTraitCollection:nil]);
                break;
            /// 处理 JobsOCSplashContentTypeLocalGIF 分支
            case JobsOCSplashContentTypeLocalGIF: {
                NSURL *url = [self resourceURLWithName:self.configuration.resourceName defaultExtension:@"gif" bundle:self.configuration.bundle];
                NSData *data = url ? [NSData dataWithContentsOfURL:url] : nil;
                self.imageView.byImage(data ? JobsOCSplashGIFDecoder.imageWithData(data) : nil);
            } break;
            /// 处理 JobsOCSplashContentTypeRemoteImage 分支
            case JobsOCSplashContentTypeRemoteImage:
                self.loadRemoteImage(self.configuration.remoteURL);
                break;
            /// 处理 JobsOCSplashContentTypeLocalVideo 分支
            case JobsOCSplashContentTypeLocalVideo: {
                NSURL *url = [self resourceURLWithName:self.configuration.resourceName defaultExtension:self.configuration.fileExtension bundle:self.configuration.bundle];
                if (url) self.playVideo(url);
            } break;
            /// 处理 JobsOCSplashContentTypeRemoteVideo 分支
            case JobsOCSplashContentTypeRemoteVideo:
                self.loadRemoteVideo(self.configuration.remoteURL);
                break;
        }
    };
}

-(jobsByURLBlock _Nonnull)loadRemoteImage{
    @jobs_weakify(self)
    return ^(NSURL * url){
        @jobs_strongify(self)
        if (!self) return;
        if (!url) return;
        NSURL *cachedURL = ((JobsOCSplashMediaCache *)JobsOCSplashMediaCache.shared()).cachedFileURLForRemoteURL(url);
        if (cachedURL) {
            NSData *data = [NSData dataWithContentsOfURL:cachedURL];
            self.imageView.byImage([self imageWithData:data URL:url]);
            return;
        }
        @jobs_weakify(self)
        self.mediaTask = [((JobsOCSplashMediaCache *)JobsOCSplashMediaCache.shared()) download:url completion:^(NSURL *fileURL, NSError *error) {
            @jobs_strongify(self)
            if (!self || !fileURL || error) return;
            NSData *data = [NSData dataWithContentsOfURL:fileURL];
            self.imageView.byImage([self imageWithData:data URL:url]);
        }];
    };
}

-(jobsByURLBlock _Nonnull)loadRemoteVideo{
    @jobs_weakify(self)
    return ^(NSURL * url){
        @jobs_strongify(self)
        if (!self) return;
        if (!url) return;
        NSURL *cachedURL = ((JobsOCSplashMediaCache *)JobsOCSplashMediaCache.shared()).cachedFileURLForRemoteURL(url);
        if (cachedURL) {
            self.remoteVideoDownloadNoticeLabel.byHidden(YES);
            self.playVideo(cachedURL);
            return;
        }
        NSURL *fallbackURL = [self resourceURLWithName:self.configuration.resourceName
                                      defaultExtension:self.configuration.fileExtension
                                                bundle:self.configuration.bundle];
        if (fallbackURL) self.playVideo(fallbackURL);
        self.remoteVideoDownloadNoticeLabel.byHidden(NO);
        @jobs_weakify(self)
        [((JobsOCSplashMediaCache *)JobsOCSplashMediaCache.shared()) preloadVideo:url completion:^(NSURL *fileURL) {
            @jobs_strongify(self)
            if (!self || self.hasFinished) return;
            self.remoteVideoDownloadNoticeLabel.byHidden(YES);
        }];
    };
}

-(jobsByURLBlock _Nonnull)playVideo{
    @jobs_weakify(self)
    return ^(NSURL * url){
        @jobs_strongify(self)
        if (!self) return;
        AVPlayer *player = [AVPlayer playerWithURL:url];
        AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
        playerLayer.byVideoGravity(self.configuration.videoGravity);
        playerLayer.byFrame(self.view.bounds);
        [self.view.layer insertSublayer:playerLayer above:self.imageView.layer];
        self.byPlayer(player);
        self.byPlayerLayer(playerLayer);
        [player play];
    };
}

-(UIImage *)imageWithData:(NSData *)data URL:(NSURL *)url {
    if ([url.pathExtension.lowercaseString isEqualToString:@"gif"]) {
        return JobsOCSplashGIFDecoder.imageWithData(data);
    };return [UIImage imageWithData:data];
}

-(NSURL *)resourceURLWithName:(NSString *)name defaultExtension:(NSString *)defaultExtension bundle:(NSBundle *)bundle {
    if (!name.length) return nil;
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

-(JobsRetStrByNumberBlock _Nonnull)skipButtonTitleWithRemainingSeconds{
    @jobs_weakify(self)
    return ^NSString *(NSNumber *_Nullable remainingSeconds){
        @jobs_strongify(self)
        if (!self) return nil;
        return [JobsOCSplashLocalization skipTitleWithLanguageCode:self.configuration.languageCode remainingSeconds:remainingSeconds];
    };
}

-(void)tapSplashContent {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSplashVC.class, @selector(jobsTapSplashContent)))(self, @selector(jobsTapSplashContent));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTapSplashContent{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.configuration.tapAction.performWithSplashVC(self);
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCSplashVC
-(JobsRetJobsOCSplashVCByAVPlayerLayerBlock _Nonnull)byPlayerLayer{
    @jobs_weakify(self)
    return ^__kindof JobsOCSplashVC * _Nullable(AVPlayerLayer * _Nullable data){
        @jobs_strongify(self)
        [self setPlayerLayer:data];
        return self;
    };
}

-(JobsRetJobsOCSplashVCByBOOLBlock _Nonnull)byIsCountdownTime{
    @jobs_weakify(self)
    return ^__kindof JobsOCSplashVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsCountdownTime:data];
        return self;
    };
}

-(JobsRetJobsOCSplashVCByBOOLBlock _Nonnull)byHasFinished{
    @jobs_weakify(self)
    return ^__kindof JobsOCSplashVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setHasFinished:data];
        return self;
    };
}

-(JobsRetJobsOCSplashVCByNSIntegerBlock _Nonnull)byCountdownTime{
    @jobs_weakify(self)
    return ^__kindof JobsOCSplashVC * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setCountdownTime:data];
        return self;
    };
}

-(JobsRetJobsOCSplashVCByjobsByVoidBlockBlock _Nonnull)byHostGestureRestoration{
    @jobs_weakify(self)
    return ^__kindof JobsOCSplashVC * _Nullable(jobsByVoidBlock data){
        @jobs_strongify(self)
        [self setHostGestureRestoration:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCSplashVC
@end

//
//  JobsOCVideoRecorderPreviewView.m
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#import "JobsOCVideoRecorderPreviewView.h"

@interface JobsOCVideoRecorderPreviewView ()

Prop_strong(nullable) AVPlayer *player;
-(JobsRetJobsOCVideoRecorderPreviewViewByAVPlayerBlock _Nonnull)byPlayer;
Prop_strong() AVPlayerLayer *playerLayer;
Prop_strong() UIButton *cancelBtn;
Prop_strong() UIButton *saveBtn;
Prop_strong() UIPanGestureRecognizer *panGesture;

@end

@implementation JobsOCVideoRecorderPreviewView
-(JobsRetJobsOCVideoRecorderPreviewViewByAVPlayerBlock _Nonnull)byPlayer{
    @jobs_weakify(self)
    return ^__kindof JobsOCVideoRecorderPreviewView *_Nullable(AVPlayer *_Nullable player){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setPlayer:player];
        return self;
    };
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.byBgColor(UIColor.blackColor);
        self.layer.byCornerRadius(JobsWidth(12));
        self.layer.byMasksToBounds(YES);
        self.layer.byBorderColor(UIColor.whiteColor.CGColor);
        self.layer.byBorderWidth(JobsWidth(1));
        [self.layer addSublayer:self.playerLayer];
        self.cancelBtn.byAlpha(1);
        self.saveBtn.byAlpha(1);
        [self addGestureRecognizer:self.panGesture];
    };return self;
}

-(void)dealloc{
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCVideoRecorderPreviewView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        self.playerLayer.byFrame(self.bounds);
    };
}

-(jobsByURLBlock _Nonnull)playWithURL{
    @jobs_weakify(self)
    return ^(NSURL * URL){
        @jobs_strongify(self)
        if (!self) return;
        self.jobsStop();
        AVPlayerItem *item = [AVPlayerItem playerItemWithURL:URL];
        self.byPlayer([AVPlayer playerWithPlayerItem:item]);
        self.playerLayer.byPlayer(self.player);
        [NSNotificationCenter.defaultCenter addObserver:self
                                               selector:@selector(playerDidPlayToEnd:)
                                                   name:AVPlayerItemDidPlayToEndTimeNotification
                                                 object:item];
        [self.player play];
    };
}

-(jobsByVoidBlock _Nonnull)jobsStop{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [NSNotificationCenter.defaultCenter removeObserver:self
                                                      name:AVPlayerItemDidPlayToEndTimeNotification
                                                    object:nil];
        self.player.pause;
        self.playerLayer.byPlayer(nil);
        self.byPlayer(nil);
    };
}

-(void)playerDidPlayToEnd:(NSNotification *)notification{
    jobsByNotificationBlock action = ((jobsByNotificationBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCVideoRecorderPreviewView.class, @selector(jobsPlayerDidPlayToEnd)))(self, @selector(jobsPlayerDidPlayToEnd));
    if (action) action(notification);
}

-(jobsByNotificationBlock _Nonnull)jobsPlayerDidPlayToEnd{
    @jobs_weakify(self)
    return ^(NSNotification * notification){
        @jobs_strongify(self)
        if (!self) return;
        [self.player seekToTime:kCMTimeZero];
        [self.player play];
    };
}

-(jobsByBtnBlock _Nonnull)cancelAction{
    @jobs_weakify(self)
    return ^(UIButton * sender){
        @jobs_strongify(self)
        if (!self) return;
        if (self.cancelBlock) self.cancelBlock(self);
    };
}

-(jobsByBtnBlock _Nonnull)saveAction{
    @jobs_weakify(self)
    return ^(UIButton * sender){
        @jobs_strongify(self)
        if (!self) return;
        if (self.saveBlock) self.saveBlock(self);
    };
}

-(void)panAction:(UIPanGestureRecognizer *)gesture{
    jobsByPanGestureRecognizerBlock action = ((jobsByPanGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCVideoRecorderPreviewView.class, @selector(jobsPanAction)))(self, @selector(jobsPanAction));
    if (action) action(gesture);
}

-(jobsByPanGestureRecognizerBlock _Nonnull)jobsPanAction{
    @jobs_weakify(self)
    return ^(UIPanGestureRecognizer * gesture){
        @jobs_strongify(self)
        if (!self) return;
        UIView *superview = self.superview;
        if (!superview) return;
        CGPoint translation = [gesture translationInView:superview];
        CGRect targetFrame = CGRectOffset(self.frame, translation.x, translation.y);
        UIEdgeInsets inset = superview.safeAreaInsets;
        CGFloat minX = inset.left + JobsWidth(8);
        CGFloat maxX = CGRectGetWidth(superview.bounds) - inset.right - CGRectGetWidth(targetFrame) - JobsWidth(8);
        CGFloat minY = inset.top + JobsWidth(8);
        CGFloat maxY = CGRectGetHeight(superview.bounds) - inset.bottom - CGRectGetHeight(targetFrame) - JobsWidth(8);
        CGFloat offsetX = translation.x;
        CGFloat offsetY = translation.y;
        if (CGRectGetMinX(targetFrame) < minX) offsetX += minX - CGRectGetMinX(targetFrame);
        if (CGRectGetMinX(targetFrame) > maxX) offsetX -= CGRectGetMinX(targetFrame) - maxX;
        if (CGRectGetMinY(targetFrame) < minY) offsetY += minY - CGRectGetMinY(targetFrame);
        if (CGRectGetMinY(targetFrame) > maxY) offsetY -= CGRectGetMinY(targetFrame) - maxY;
        self.byTransform(CGAffineTransformTranslate(self.transform, offsetX, offsetY));
        [gesture setTranslation:CGPointZero inView:superview];
    };
}

-(AVPlayerLayer *)playerLayer{
    if (!_playerLayer) {
        _playerLayer = AVPlayerLayer.layer;
        _playerLayer.byVideoGravity(AVLayerVideoGravityResizeAspectFill);
    };return _playerLayer;
}

-(UIButton *)cancelBtn{
    if (!_cancelBtn) {
        @jobs_weakify(self)
        _cancelBtn = jobsMakeButton(^(__kindof UIButton * _Nullable btn) {
            btn.jobsResetBtnTitle(@"❌")
               .jobsResetBtnTitleFont(UIFontWeightRegularSize(24))
               .jobsResetBtnTitleCor(UIColor.whiteColor)
               .onClickBy(^(__kindof UIButton * _Nullable button) {
                weak_self.cancelAction(button);
            })
            .byBgColor(UIColor.blackColor.colorWithAlphaComponentBy(0.35));
        });
        _cancelBtn.addOn(self).byAdd(^(MASConstraintMaker *make) {
            make.left.bottom.equalTo(self).inset(JobsWidth(6));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(42), JobsWidth(42)));
        });
    };return _cancelBtn;
}

-(UIButton *)saveBtn{
    if (!_saveBtn) {
        @jobs_weakify(self)
        _saveBtn = jobsMakeButton(^(__kindof UIButton * _Nullable btn) {
            btn.jobsResetBtnTitle(@"✅")
               .jobsResetBtnTitleFont(UIFontWeightRegularSize(24))
               .jobsResetBtnTitleCor(UIColor.whiteColor)
               .onClickBy(^(__kindof UIButton * _Nullable button) {
                weak_self.saveAction(button);
            })
            .byBgColor(UIColor.blackColor.colorWithAlphaComponentBy(0.35));
        });
        _saveBtn.addOn(self).byAdd(^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(self).inset(JobsWidth(6));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(42), JobsWidth(42)));
        });
    };return _saveBtn;
}

-(UIPanGestureRecognizer *)panGesture{
    if (!_panGesture) {
        _panGesture = jobsMakePanGesture(^(__kindof UIPanGestureRecognizer * _Nullable gesture) {
            [gesture addTarget:self action:@selector(panAction:)];
        });
    };return _panGesture;
}

@end

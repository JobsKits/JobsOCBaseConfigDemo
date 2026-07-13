//
//  JobsOCVideoRecorderPreviewView.m
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#import "JobsOCVideoRecorderPreviewView.h"

@interface JobsOCVideoRecorderPreviewView ()

Prop_strong(nullable) AVPlayer *player;
Prop_strong() AVPlayerLayer *playerLayer;
Prop_strong() UIButton *cancelBtn;
Prop_strong() UIButton *saveBtn;
Prop_strong() UIPanGestureRecognizer *panGesture;

@end

@implementation JobsOCVideoRecorderPreviewView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.byBgColor(UIColor.blackColor);
        self.layer.cornerRadius = JobsWidth(12);
        self.layer.masksToBounds = YES;
        self.layer.borderColor = UIColor.whiteColor.CGColor;
        self.layer.borderWidth = JobsWidth(1);
        [self.layer addSublayer:self.playerLayer];
        self.cancelBtn.alpha = 1;
        self.saveBtn.alpha = 1;
        [self addGestureRecognizer:self.panGesture];
    };return self;
}

-(void)dealloc{
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.playerLayer.frame = self.bounds;
}

-(void)playWithURL:(NSURL *)URL{
    [self stop];
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:URL];
    self.player = [AVPlayer playerWithPlayerItem:item];
    self.playerLayer.player = self.player;
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(playerDidPlayToEnd:)
                                               name:AVPlayerItemDidPlayToEndTimeNotification
                                             object:item];
    [self.player play];
}

-(void)stop{
    [NSNotificationCenter.defaultCenter removeObserver:self
                                                  name:AVPlayerItemDidPlayToEndTimeNotification
                                                object:nil];
    [self.player pause];
    self.playerLayer.player = nil;
    self.player = nil;
}

-(void)playerDidPlayToEnd:(NSNotification *)notification{
    [self.player seekToTime:kCMTimeZero];
    [self.player play];
}

-(void)cancelAction:(UIButton *)sender{
    if (self.cancelBlock) self.cancelBlock(self);
}

-(void)saveAction:(UIButton *)sender{
    if (self.saveBlock) self.saveBlock(self);
}

-(void)panAction:(UIPanGestureRecognizer *)gesture{
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
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
    [gesture setTranslation:CGPointZero inView:superview];
}

-(AVPlayerLayer *)playerLayer{
    if (!_playerLayer) {
        _playerLayer = AVPlayerLayer.layer;
        _playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    };return _playerLayer;
}

-(UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = jobsMakeButton(^(__kindof UIButton * _Nullable btn) {
            btn.jobsResetBtnTitle(@"❌")
               .jobsResetBtnTitleFont(UIFontWeightRegularSize(24))
               .jobsResetBtnTitleCor(UIColor.whiteColor)
               .byBgColor(UIColor.blackColor.colorWithAlphaComponentBy(0.35));
            btn.byAddTarget(self, @selector(cancelAction:), UIControlEventTouchUpInside);
        });
        _cancelBtn.addOn(self).byAdd(^(MASConstraintMaker *make) {
            make.left.bottom.equalTo(self).inset(JobsWidth(6));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(42), JobsWidth(42)));
        });
    };return _cancelBtn;
}

-(UIButton *)saveBtn{
    if (!_saveBtn) {
        _saveBtn = jobsMakeButton(^(__kindof UIButton * _Nullable btn) {
            btn.jobsResetBtnTitle(@"✅")
               .jobsResetBtnTitleFont(UIFontWeightRegularSize(24))
               .jobsResetBtnTitleCor(UIColor.whiteColor)
               .byBgColor(UIColor.blackColor.colorWithAlphaComponentBy(0.35));
            btn.byAddTarget(self, @selector(saveAction:), UIControlEventTouchUpInside);
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

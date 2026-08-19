//
//  ZFDouYinControlView.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ZFDouYinControlView.h"

@implementation ZFSliderView (JobsDSL)

-(JobsRetZFSliderViewByFloatBlock _Nonnull)byValue{
    @jobs_weakify(self)
    return ^__kindof ZFSliderView *_Nullable(float data){
        @jobs_strongify(self)
        self.value = data;
        return self;
    };
}

-(JobsRetZFSliderViewByFloatBlock _Nonnull)byBufferValue{
    @jobs_weakify(self)
    return ^__kindof ZFSliderView *_Nullable(float data){
        @jobs_strongify(self)
        self.bufferValue = data;
        return self;
    };
}

#define JobsZFSliderViewColorDSL(_name_, _property_) \
-(JobsRetZFSliderViewByCorBlock _Nonnull)by##_name_{ \
    @jobs_weakify(self) \
    return ^__kindof ZFSliderView *_Nullable(UIColor *_Nullable data){ \
        @jobs_strongify(self) \
        self._property_ = data; \
        return self; \
    }; \
}

JobsZFSliderViewColorDSL(MaximumTrackTintColor, maximumTrackTintColor)
JobsZFSliderViewColorDSL(MinimumTrackTintColor, minimumTrackTintColor)
JobsZFSliderViewColorDSL(BufferTrackTintColor, bufferTrackTintColor)

#undef JobsZFSliderViewColorDSL

-(JobsRetZFSliderViewByCGFloatBlock _Nonnull)bySliderHeight{
    @jobs_weakify(self)
    return ^__kindof ZFSliderView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.sliderHeight = data;
        return self;
    };
}

-(JobsRetZFSliderViewByBOOLBlock _Nonnull)byIsHideSliderBlock{
    @jobs_weakify(self)
    return ^__kindof ZFSliderView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.isHideSliderBlock = data;
        return self;
    };
}

@end

@interface ZFDouYinControlView ()

Prop_strong()UIButton *playBtn;
Prop_strong()ZFSliderView *sliderView;

@end

@implementation ZFDouYinControlView
@synthesize player = _player;
- (instancetype)init {
    if (self = [super init]) {
        self.playBtn.addOn(self);
        self.sliderView.addOn(self);
        self.resetControlView();
    };return self;
}

- (void)layoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ZFDouYinControlView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        CGFloat min_x = 0;
        CGFloat min_y = 0;
        CGFloat min_w = 0;
        CGFloat min_h = 0;
        CGFloat min_view_w = self.zf_width;
        CGFloat min_view_h = self.zf_height;
        min_w = 100;
        min_h = 100;
        self.playBtn
            .byFrame(CGRectMake(min_x, min_y, min_w, min_h))
            .byCenterPoint(self.center);
        min_x = 0;
        min_y = min_view_h - 80;
        min_w = min_view_w;
        min_h = 1;
        self.sliderView.byFrame(CGRectMake(min_x, min_y, min_w, min_h));
    };
}

- (jobsByVoidBlock _Nonnull)resetControlView {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.playBtn.byHidden(YES);
        self.sliderView
            .byValue(0)
            .byBufferValue(0);
    };
}
/// 加载状态改变
- (void)videoPlayer:(ZFPlayerController *)videoPlayer
   loadStateChanged:(ZFPlayerLoadState)state {
    if ((state == ZFPlayerLoadStateStalled ||
         state == ZFPlayerLoadStatePrepare) &&
        videoPlayer.currentPlayerManager.isPlaying) {
        [self.sliderView startAnimating];
    } else {
        [self.sliderView stopAnimating];
    }
}
/// 播放进度改变回调
- (void)videoPlayer:(ZFPlayerController *)videoPlayer
        currentTime:(NSTimeInterval)currentTime
          totalTime:(NSTimeInterval)totalTime {
    self.sliderView.byValue(videoPlayer.progress);
}

-(jobsByZFPlayerGestureControlBlock _Nonnull)gestureSingleTapped{
    @jobs_weakify(self)
    return ^(ZFPlayerGestureControl * gestureControl){
        @jobs_strongify(self)
        if (!self) return;
        if (self.player.currentPlayerManager.isPlaying) {
            self.player.currentPlayerManager.pause;
            self.playBtn.byHidden(NO);
            self.playBtn.byTransform(CGAffineTransformMakeScale(1.5f, 1.5f));
            @jobs_weakify(self)
            [UIView animateWithDuration:0.2f
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseIn
                             animations:^{
                @jobs_strongify(self)
                self.playBtn.byTransform(CGAffineTransformIdentity);
            } completion:nil];
        } else {
            [self.player.currentPlayerManager play];
            self.playBtn.byHidden(YES);
        }
    };
}

- (void)setPlayer:(ZFPlayerController *)player {
    _player = player;
}

-(jobsByStrBlock _Nonnull)showCoverViewWithUrl{
    @jobs_weakify(self)
    return ^(NSString * coverUrl){
        @jobs_strongify(self)
        if (!self) return;
        [self.player.currentPlayerManager.view.coverImageView setImageWithURLString:coverUrl
                                                                        placeholder:@"img_video_loading".img];
    };
}
#pragma mark —— lazyLoad
- (UIButton *)playBtn {
    if (!_playBtn) {
        _playBtn = jobsMakeBaseButton(^(__kindof UIButton * _Nullable button) {
            button
                .byImage(@"icon_play_pause".img)
                .byUserInteractionEnabled(NO);
        });
    };return _playBtn;
}

- (ZFSliderView *)sliderView {
    if (!_sliderView) {
        _sliderView = ZFSliderView.new
            .byMaximumTrackTintColor([UIColor colorWithRed:1 green:1 blue:1 alpha:0.2])
            .byMinimumTrackTintColor(UIColor.whiteColor)
            .byBufferTrackTintColor(UIColor.clearColor)
            .bySliderHeight(1)
            .byIsHideSliderBlock(NO);
    };return _sliderView;
}

@end

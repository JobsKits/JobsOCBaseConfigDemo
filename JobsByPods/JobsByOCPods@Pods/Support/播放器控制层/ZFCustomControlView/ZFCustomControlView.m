//
//  ZFCustomControlView.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ZFCustomControlView.h"
#import <JobsOCDSL/UIButton+DSL.h>
#import <JobsOCDSL/ZFPlayerController+DSL.h>

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN ZFSliderView
@interface ZFSliderView (JobsPropertyDSLSetterAutogen_8b72bfeda4)
-(void)setIsHideSliderBlock:(BOOL)data;
-(void)setIsdragging:(BOOL)data;
-(void)setZf_centerY:(CGFloat)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END ZFSliderView

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN ZFSpeedLoadingView
@interface ZFSpeedLoadingView (JobsLocalPropertyDSLAutogen_8b72bfeda4)
-(JobsRetZFSpeedLoadingViewByCGFloatBlock _Nonnull)byZf_centerX;
-(JobsRetZFSpeedLoadingViewByCGFloatBlock _Nonnull)byZf_centerY;
-(void)setZf_centerX:(CGFloat)data;
-(void)setZf_centerY:(CGFloat)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END ZFSpeedLoadingView

@implementation ZFSliderView (JobsCustomControlDSL)
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
#define JobsZFCustomSliderColorDSL(_name_, _property_) \
-(JobsRetZFSliderViewByCorBlock _Nonnull)by##_name_{ \
    @jobs_weakify(self) \
    return ^__kindof ZFSliderView *_Nullable(UIColor *_Nullable data){ \
        @jobs_strongify(self) \
        self._property_ = data; \
        return self; \
    }; \
}
JobsZFCustomSliderColorDSL(MaximumTrackTintColor, maximumTrackTintColor)
JobsZFCustomSliderColorDSL(MinimumTrackTintColor, minimumTrackTintColor)
JobsZFCustomSliderColorDSL(BufferTrackTintColor, bufferTrackTintColor)
#undef JobsZFCustomSliderColorDSL
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
-(JobsRetZFSliderViewByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof ZFSliderView *_Nullable(id<ZFSliderViewDelegate> _Nullable data){
        @jobs_strongify(self)
        self.delegate = data;
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN ZFSliderView
-(JobsRetZFSliderViewByBOOLBlock _Nonnull)byHideSliderBlock{
    @jobs_weakify(self)
    return ^__kindof ZFSliderView * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsHideSliderBlock:data];
        return self;
    };
}

-(JobsRetZFSliderViewByBOOLBlock _Nonnull)byIsdragging{
    @jobs_weakify(self)
    return ^__kindof ZFSliderView * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsdragging:data];
        return self;
    };
}

-(JobsRetZFSliderViewByCGFloatBlock _Nonnull)byZf_centerY{
    @jobs_weakify(self)
    return ^__kindof ZFSliderView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setZf_centerY:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END ZFSliderView
@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN ZFPlayerController
@interface ZFPlayerController (JobsPropertyDSLSetterAutogen_8b72bfeda4)
-(void)setAllowOrentitaionRotation:(BOOL)data;
-(void)setPlayerDisapperaPercent:(CGFloat)data;
-(void)setWWANAutoPlay:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END ZFPlayerController

@implementation ZFPlayerController (JobsCustomControlDSL)
-(JobsRetZFPlayerControllerByBOOLBlock _Nonnull)byStatusBarHidden{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.statusBarHidden = data;
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN ZFPlayerController
-(JobsRetZFPlayerByCGFloatBlock _Nonnull)byPlayerDisapperaPercent{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setPlayerDisapperaPercent:data];
        return self;
    };
}

-(JobsRetZFPlayerControllerByBOOLBlock _Nonnull)byAllowOrentitaionRotation{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setAllowOrentitaionRotation:data];
        return self;
    };
}

-(JobsRetZFPlayerControllerByBOOLBlock _Nonnull)byWWANAutoPlay{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setWWANAutoPlay:data];
        return self;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END ZFPlayerController
@end

@implementation NSObject (JobsZFPlayerMediaPlaybackDSL)
-(JobsRetZFPlayerMediaPlaybackByScalingModeBlock _Nonnull)byScalingMode{
    @jobs_weakify(self)
    return ^id<ZFPlayerMediaPlayback> _Nullable(ZFPlayerScalingMode data){
        @jobs_strongify(self)
        [self setValue:@(data) forKey:@"scalingMode"];
        return (id<ZFPlayerMediaPlayback>)self;
    };
}

-(JobsRetZFPlayerMediaPlaybackByBOOLBlock _Nonnull)byMuted{
    @jobs_weakify(self)
    return ^id<ZFPlayerMediaPlayback> _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setValue:@(data) forKey:@"muted"];
        return (id<ZFPlayerMediaPlayback>)self;
    };
}

-(JobsRetZFPlayerMediaPlaybackByFloatBlock _Nonnull)byVolume{
    @jobs_weakify(self)
    return ^id<ZFPlayerMediaPlayback> _Nullable(float data){
        @jobs_strongify(self)
        [self setValue:@(data) forKey:@"volume"];
        return (id<ZFPlayerMediaPlayback>)self;
    };
}
@end

#import <JobsMakes/JobsMakes.h>
#import <JobsOCDSL/JobsOCDSL.h>

@interface ZFCustomControlView ()
/// 底部工具栏
Prop_strong()UIView *bottomToolView;
/// 顶部工具栏
Prop_strong()UIView *topToolView;
/// 标题
Prop_strong()UILabel *titleLabel;
/// 播放或暂停按钮
Prop_strong()UIButton *playOrPauseBtn;
/// 播放的当前时间
Prop_strong()UILabel *currentTimeLabel;
/// 滑杆
Prop_strong()ZFSliderView *slider;
/// 视频总时间
Prop_strong()UILabel *totalTimeLabel;
/// 全屏按钮
Prop_strong()UIButton *fullScreenBtn;
Prop_assign()BOOL isShow;
Prop_assign()BOOL controlViewAppeared;
Prop_strong()dispatch_block_t afterBlock;
Prop_assign()NSTimeInterval sumTime;
/// 底部播放进度
Prop_strong()ZFSliderView *bottomPgrogress;
/// 加载loading
Prop_strong()ZFSpeedLoadingView *activity;
/// 封面图
Prop_strong()UIImageView *coverImageView;

-(JobsRetZFCustomControlViewByBOOLBlock _Nonnull)byIsShow;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN ZFCustomControlView
@interface ZFCustomControlView (JobsPropertyDSLSetterAutogen_8b72bfeda4)
-(void)setAfterBlock:(dispatch_block_t)data;
-(void)setControlViewAppeared:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END ZFCustomControlView

@implementation ZFCustomControlView
@synthesize player = _player;
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 添加子控件
        [self addSubview:self.topToolView];
        [self addSubview:self.bottomToolView];
        [self addSubview:self.playOrPauseBtn];
        [self.topToolView addSubview:self.titleLabel];
        [self.bottomToolView addSubview:self.currentTimeLabel];
        [self.bottomToolView addSubview:self.slider];
        [self.bottomToolView addSubview:self.totalTimeLabel];
        [self.bottomToolView addSubview:self.fullScreenBtn];
        [self addSubview:self.bottomPgrogress];
        [self addSubview:self.activity];
        self.autoFadeTimeInterval = 0.2;
        self.autoHiddenTimeInterval = 2.5;
        // 设置子控件的响应事件
        self.makeSubViewsAction();
        self.resetControlView();
        self.byClipsToBounds(YES);
    };return self;
}

- (jobsByVoidBlock _Nonnull)makeSubViewsAction {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        self.playOrPauseBtn.onClickBy(^(__kindof UIButton * _Nullable button) {
            weak_self.playPauseButtonClickAction(button);
        });
        self.fullScreenBtn.onClickBy(^(__kindof UIButton * _Nullable button) {
            weak_self.fullScreenButtonClickAction(button);
        });
    };
}
#pragma mark —— ZFSliderViewDelegate
-(jobsByFloatBlock _Nonnull)sliderTouchBegan{
    @jobs_weakify(self)
    return ^(float value){
        @jobs_strongify(self)
        if (!self) return;
        self.slider.byIsdragging(YES);
    };
}

-(jobsByFloatBlock _Nonnull)sliderTouchEnded{
    @jobs_weakify(self)
    return ^(float value){
        @jobs_strongify(self)
        if (!self) return;
        if (self.player.totalTime > 0) {
            @zf_weakify(self)
            [self.player seekToTime:self.player.totalTime*value
                  completionHandler:^(BOOL finished) {
                @zf_strongify(self)
                if (finished) {
                    self.slider.byIsdragging(NO);
                }
            }];
        } else {
            self.slider.byIsdragging(NO);
        }
    };
}

-(jobsByFloatBlock _Nonnull)sliderValueChanged{
    @jobs_weakify(self)
    return ^(float value){
        @jobs_strongify(self)
        if (!self) return;
        if (self.player.totalTime == 0) {
            self.slider.byValue(0);
            return;
        }
        self.slider.byIsdragging(YES);
        NSString *currentTimeString = [ZFUtilities convertTimeSecond:self.player.totalTime*value];
        self.currentTimeLabel.byText(currentTimeString);
    };
}

-(jobsByFloatBlock _Nonnull)sliderTapped{
    @jobs_weakify(self)
    return ^(float value){
        @jobs_strongify(self)
        if (!self) return;
        if (self.player.totalTime > 0) {
            self.slider.byIsdragging(YES);
            @zf_weakify(self)
            [self.player seekToTime:self.player.totalTime*value completionHandler:^(BOOL finished) {
                @zf_strongify(self)
                if (finished) {
                    self.slider.byIsdragging(NO);
                    [self.player.currentPlayerManager play];
                }
            }];
        } else {
            self.slider.byIsdragging(NO);
            self.slider.byValue(0);
        }
    };
}
#pragma mark —— action
-(jobsByBtnBlock _Nonnull)playPauseButtonClickAction{
    @jobs_weakify(self)
    return ^(UIButton * sender){
        @jobs_strongify(self)
        if (!self) return;
        self.playOrPause();
    };
}

-(jobsByBtnBlock _Nonnull)fullScreenButtonClickAction{
    @jobs_weakify(self)
    return ^(UIButton * sender){
        @jobs_strongify(self)
        if (!self) return;
        [self.player enterFullScreen:!self.player.isFullScreen animated:YES];
    };
}
/// 根据当前播放状态取反
- (jobsByVoidBlock _Nonnull)playOrPause {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.playOrPauseBtn.byToggleSelected();
        self.playOrPauseBtn.jobs_isSelected ? [self.player.currentPlayerManager play] : self.player.currentPlayerManager.pause;
    };
}

-(jobsByBOOLBlock _Nonnull)playBtnSelectedState{
    @jobs_weakify(self)
    return ^(BOOL selected){
        @jobs_strongify(self)
        if (!self) return;
        self.playOrPauseBtn.bySelected(selected);
    };
}
#pragma mark —— 添加子控件约束
- (void)layoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ZFCustomControlView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
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
        CGFloat min_view_w = self.bounds.size.width;
        CGFloat min_view_h = self.bounds.size.height;
        CGFloat min_margin = 9;
        self.coverImageView.byFrame(self.bounds);
        min_w = 80;
        min_h = 80;
        self.activity.byFrame(CGRectMake(min_x, min_y, min_w, min_h));
        self.activity.byZf_centerX(self.zf_centerX);
        self.activity.byZf_centerY(self.zf_centerY + 10);
        min_x = 0;
        min_y = 0;
        min_w = min_view_w;
        min_h = (iPhoneX && self.player.isFullScreen) ? 80 : 40;
        self.topToolView.byFrame(CGRectMake(min_x, min_y, min_w, min_h));
        min_x = self.player.isFullScreen ? 40: 15;
        min_y = 0;
        min_w = min_view_w - min_x - 15;
        min_h = 30;
        self.titleLabel.byFrame(CGRectMake(min_x, min_y, min_w, min_h));
        self.titleLabel.byZf_centerY(self.topToolView.zf_centerY);
        min_h = (iPhoneX && self.player.isFullScreen) ? 100 : 40;
        min_x = 0;
        min_y = min_view_h - min_h;
        min_w = min_view_w;
        self.bottomToolView.byFrame(CGRectMake(min_x, min_y, min_w, min_h));
        min_x = 0;
        min_y = 0;
        min_w = 44;
        min_h = min_w;
        self.playOrPauseBtn.byFrame(CGRectMake(min_x, min_y, min_w, min_h));
        self.playOrPauseBtn.byCenter(self.center.x, self.center.y);
        min_x = (iPhoneX && self.player.isFullScreen) ? 44: 15;
        min_w = 62;
        min_h = 28;
        min_y = (self.bottomToolView.zf_height - min_h)/2;
        self.currentTimeLabel.byFrame(CGRectMake(min_x, min_y, min_w, min_h));
        min_w = 28;
        min_h = min_w;
        min_x = self.bottomToolView.zf_width - min_w - ((iPhoneX && self.player.isFullScreen) ? 44: min_margin);
        min_y = 0;
        self.fullScreenBtn.byFrame(CGRectMake(min_x, min_y, min_w, min_h));
        self.fullScreenBtn.byZf_centerY(self.currentTimeLabel.zf_centerY);
        min_w = 62;
        min_h = 28;
        min_x = self.fullScreenBtn.zf_left - min_w - 4;
        min_y = 0;
        self.totalTimeLabel.byFrame(CGRectMake(min_x, min_y, min_w, min_h));
        self.totalTimeLabel.byZf_centerY(self.currentTimeLabel.zf_centerY);
        min_x = self.currentTimeLabel.zf_right + 4;
        min_y = 0;
        min_w = self.totalTimeLabel.zf_left - min_x - 4;
        min_h = 30;
        self.slider.byFrame(CGRectMake(min_x, min_y, min_w, min_h));
        self.slider.byZf_centerY(self.currentTimeLabel.zf_centerY);
        min_x = 0;
        min_y = min_view_h - 1;
        min_w = min_view_w;
        min_h = 1;
        self.bottomPgrogress.byFrame(CGRectMake(min_x, min_y, min_w, min_h));
        if (!self.isShow) {
            self.topToolView.byZf_y(-self.topToolView.zf_height);
            self.bottomToolView.byZf_y(self.zf_height);
            self.playOrPauseBtn.byAlpha(0);
        } else {
            self.topToolView.byZf_y(0);
            self.bottomToolView.byZf_y(self.zf_height - self.bottomToolView.zf_height);
            self.playOrPauseBtn.byAlpha(1);
        }
    };
}
#pragma mark —— private
/** 重置ControlView */
- (jobsByVoidBlock _Nonnull)resetControlView {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.bottomToolView.byAlpha(1);
        self.slider.byValue(0);
        self.slider.byBufferValue(0);
        self.currentTimeLabel.byText(@"00:00");
        self.totalTimeLabel.byText(@"00:00");
        self.byBgColor(JobsClearColor);
        self.playOrPauseBtn.bySelected(YES);
        self.titleLabel.byText(@"".jobsTr());
    };
}

- (jobsByVoidBlock _Nonnull)showControlView {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.topToolView.byAlpha(1);
        self.bottomToolView.byAlpha(1);
        self.byIsShow(YES);
        self.topToolView.byZf_y(0);
        self.bottomToolView.byZf_y(self.zf_height - self.bottomToolView.zf_height);
        self.playOrPauseBtn.byAlpha(1);
        self.player.byStatusBarHidden(NO);
    };
}

- (jobsByVoidBlock _Nonnull)hideControlView {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byIsShow(NO);
        self.topToolView.byZf_y(-self.topToolView.zf_height);
        self.bottomToolView.byZf_y(self.zf_height);
        self.player.byStatusBarHidden(NO);
        self.playOrPauseBtn.byAlpha(0);
        self.topToolView.byAlpha(0);
        self.bottomToolView.byAlpha(0);
    };
}

-(JobsRetZFCustomControlViewByBOOLBlock _Nonnull)byIsShow{
    @jobs_weakify(self)
    return ^__kindof ZFCustomControlView *_Nullable(BOOL value){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setIsShow:value];
        return self;
    };
}

- (jobsByVoidBlock _Nonnull)autoFadeOutControlView {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byControlViewAppeared(YES);
        self.cancelAutoFadeOutControlView();
        @zf_weakify(self)
        self.afterBlock = dispatch_block_create(0, ^{
            @zf_strongify(self)
            self.hideControlViewWithAnimated(YES);
        });
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.autoHiddenTimeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(),self.afterBlock);
    };
}
/// 取消延时隐藏controlView的方法
- (jobsByVoidBlock _Nonnull)cancelAutoFadeOutControlView {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.afterBlock) {
            dispatch_block_cancel(self.afterBlock);
            self.byAfterBlock(nil);
        }
    };
}
/// 隐藏控制层
-(jobsByBOOLBlock _Nonnull)hideControlViewWithAnimated{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        self.byControlViewAppeared(NO);
        [UIView animateWithDuration:animated ? self.autoFadeTimeInterval : 0
                         animations:^{
            self.hideControlView();
        } completion:^(BOOL finished) {
            self.bottomPgrogress.byHidden(NO);
        }];
    };
}
/// 显示控制层
-(jobsByBOOLBlock _Nonnull)showControlViewWithAnimated{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        self.byControlViewAppeared(YES);
        self.autoFadeOutControlView();
        [UIView animateWithDuration:animated ? self.autoFadeTimeInterval : 0
                         animations:^{
            self.showControlView();
        } completion:^(BOOL finished) {
            self.bottomPgrogress.byHidden(YES);
        }];
    };
}

- (BOOL)shouldResponseGestureWithPoint:(CGPoint)point
                       withGestureType:(ZFPlayerGestureType)type
                                 touch:(nonnull UITouch *)touch {
    CGRect sliderRect = [self.bottomToolView
                         convertRect:self.slider.frame
                         toView:self];
    return !CGRectContainsPoint(sliderRect, point);
}
/**
 设置标题、封面、全屏模式
 
 @param title 视频的标题
 @param coverUrl 视频的封面，占位图默认是灰色的
 @param fullScreenMode 全屏模式
 */
- (void)showTitle:(NSString *)title
   coverURLString:(NSString *)coverUrl
   fullScreenMode:(ZFFullScreenMode)fullScreenMode{
    UIImage *placeholder = [ZFUtilities imageWithColor:[UIColor colorWithRed:220/255.0
                                                                       green:220/255.0
                                                                        blue:220/255.0
                                                                       alpha:1]
                                                  size:self.coverImageView.bounds.size];
    self.resetControlView();
    [self layoutIfNeeded];
    [self setNeedsDisplay];
    self.titleLabel.byText(title);
    self.player.orientationObserver.byFullScreenMode(fullScreenMode);
    [self.player.currentPlayerManager.view.coverImageView setImageWithURLString:coverUrl
                                                                    placeholder:placeholder];
}
/// 调节播放进度slider和当前时间更新
- (void)sliderValueChanged:(CGFloat)value
         currentTimeString:(NSString *)timeString {
    self.slider.byValue(value);
    self.currentTimeLabel.byText(timeString);
    self.slider.byIsdragging(YES);
    [UIView animateWithDuration:0.3
                     animations:^{
        self.slider.sliderBtn.byTransform(CGAffineTransformMakeScale(1.2, 1.2));
    }];
}
/// 滑杆结束滑动
- (jobsByVoidBlock _Nonnull)sliderChangeEnded {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.slider.byIsdragging(NO);
        [UIView animateWithDuration:0.3
                         animations:^{
            self.slider.sliderBtn.byTransform(CGAffineTransformIdentity);
        }];
    };
}
#pragma mark —— ZFPlayerControlViewDelegate
/// 手势筛选，返回NO不响应该手势
- (BOOL)gestureTriggerCondition:(ZFPlayerGestureControl *)gestureControl
                    gestureType:(ZFPlayerGestureType)gestureType
              gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
                          touch:(nonnull UITouch *)touch {
    CGPoint point = [touch locationInView:self];
    if (self.player.isSmallFloatViewShow &&
        !self.player.isFullScreen && gestureType != ZFPlayerGestureTypeSingleTap) {
        return NO;
    };return [self shouldResponseGestureWithPoint:point
                                withGestureType:gestureType
                                          touch:touch];
}
/// 单击手势事件
-(jobsByZFPlayerGestureControlBlock _Nonnull)gestureSingleTapped{
    @jobs_weakify(self)
    return ^(ZFPlayerGestureControl * gestureControl){
        @jobs_strongify(self)
        if (!self) return;
        if (!self.player) return;
        if (self.player.isSmallFloatViewShow && !self.player.isFullScreen) {
            [self.player enterFullScreen:YES animated:YES];
        } else {
            if (self.controlViewAppeared) {
                self.hideControlViewWithAnimated(YES);
            } else {
                /// 显示之前先把控制层复位，先隐藏后显示
                self.hideControlViewWithAnimated(NO);
                self.showControlViewWithAnimated(YES);
            }
        }
    };
}
/// 双击手势事件
-(jobsByZFPlayerGestureControlBlock _Nonnull)gestureDoubleTapped{
    @jobs_weakify(self)
    return ^(ZFPlayerGestureControl * gestureControl){
        @jobs_strongify(self)
        if (!self) return;
        self.playOrPause();
    };
}
/// 捏合手势事件，这里改变了视频的填充模式
- (void)gesturePinched:(ZFPlayerGestureControl *)gestureControl
                 scale:(float)scale {
    if (scale > 1) {
        ((NSObject *)self.player.currentPlayerManager).byScalingMode(ZFPlayerScalingModeAspectFill);
    } else {
        ((NSObject *)self.player.currentPlayerManager).byScalingMode(ZFPlayerScalingModeAspectFit);
    }
}
/// 准备播放
- (void)videoPlayer:(ZFPlayerController *)videoPlayer
      prepareToPlay:(NSURL *)assetURL {
    (((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ZFCustomControlView.class, @selector(hideControlViewWithAnimated)))(self, @selector(hideControlViewWithAnimated)))(NO);
}
/// 播放状态改变
- (void)videoPlayer:(ZFPlayerController *)videoPlayer
   playStateChanged:(ZFPlayerPlaybackState)state {
    if (state == ZFPlayerPlayStatePlaying) {
        self.playBtnSelectedState(YES);
        /// 开始播放时候判断是否显示loading
        if (videoPlayer.currentPlayerManager.loadState == ZFPlayerLoadStateStalled) {
            [self.activity startAnimating];
        } else if ((videoPlayer.currentPlayerManager.loadState == ZFPlayerLoadStateStalled || videoPlayer.currentPlayerManager.loadState == ZFPlayerLoadStatePrepare)) {
            [self.activity startAnimating];
        }
    } else if (state == ZFPlayerPlayStatePaused) {
        self.playBtnSelectedState(NO);
        /// 暂停的时候隐藏loading
        [self.activity stopAnimating];
    } else if (state == ZFPlayerPlayStatePlayFailed) {
        [self.activity stopAnimating];
    }
}
/// 加载状态改变
- (void)videoPlayer:(ZFPlayerController *)videoPlayer
   loadStateChanged:(ZFPlayerLoadState)state {
    if (state == ZFPlayerLoadStatePrepare) {
        self.coverImageView.byHidden(NO);
    } else if (state == ZFPlayerLoadStatePlaythroughOK ||
               state == ZFPlayerLoadStatePlayable) {
        self.coverImageView.byHidden(YES);
        self.player.currentPlayerManager.view.byBgColor([UIColor blackColor]);
    }
    if (state == ZFPlayerLoadStateStalled && videoPlayer.currentPlayerManager.isPlaying) {
        [self.activity startAnimating];
    } else if ((state == ZFPlayerLoadStateStalled ||
                state == ZFPlayerLoadStatePrepare) && videoPlayer.currentPlayerManager.isPlaying) {
        [self.activity startAnimating];
    } else {
        [self.activity stopAnimating];
    }
}
/// 播放进度改变回调
- (void)videoPlayer:(ZFPlayerController *)videoPlayer
        currentTime:(NSTimeInterval)currentTime totalTime:(NSTimeInterval)totalTime {
    if (!self.slider.isdragging) {
        NSString *currentTimeString = [ZFUtilities convertTimeSecond:currentTime];
        self.currentTimeLabel.byText(currentTimeString);
        NSString *totalTimeString = [ZFUtilities convertTimeSecond:totalTime];
        self.totalTimeLabel.byText(totalTimeString);
        self.slider.byValue(videoPlayer.progress);
    }
    self.bottomPgrogress.byValue(videoPlayer.progress);
}
/// 缓冲改变回调
- (void)videoPlayer:(ZFPlayerController *)videoPlayer
         bufferTime:(NSTimeInterval)bufferTime {
    self.slider.byBufferValue(videoPlayer.bufferProgress);
    self.bottomPgrogress.byBufferValue(videoPlayer.bufferProgress);
}

- (void)videoPlayer:(ZFPlayerController *)videoPlayer
presentationSizeChanged:(CGSize)size {
}
/// 视频view即将旋转
- (void)videoPlayer:(ZFPlayerController *)videoPlayer
orientationWillChange:(ZFOrientationObserver *)observer {
    if (videoPlayer.isSmallFloatViewShow) {
        if (observer.isFullScreen) {
            self.byControlViewAppeared(NO);
            self.cancelAutoFadeOutControlView();
        }
    }
    if (self.controlViewAppeared) {
        self.showControlViewWithAnimated(NO);
    } else {
        self.hideControlViewWithAnimated(NO);
    }
}
/// 视频view已经旋转
- (void)videoPlayer:(ZFPlayerController *)videoPlayer
orientationDidChanged:(ZFOrientationObserver *)observer {
    if (self.controlViewAppeared) {
        self.showControlViewWithAnimated(NO);
    } else {
        self.hideControlViewWithAnimated(NO);
    }
    [self layoutIfNeeded];
    [self setNeedsDisplay];
}
/// 锁定旋转方向
- (void)lockedVideoPlayer:(ZFPlayerController *)videoPlayer
             lockedScreen:(BOOL)locked {
    (((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ZFCustomControlView.class, @selector(showControlViewWithAnimated)))(self, @selector(showControlViewWithAnimated)))(YES);
}
#pragma mark —— setter
- (void)setPlayer:(ZFPlayerController *)player {
    _player = player;
}
#pragma mark —— getter
- (UIView *)topToolView {
    if (!_topToolView) {
        UIImage *image = ZFPlayer_Image(@"ZFPlayer_top_shadow");
        _topToolView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byLayer(^(CALayer *layer) {
                layer.byContents((id)image.CGImage);
            });
        });
    };return _topToolView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextCor([UIColor whiteColor])
                .byFont([UIFont systemFontOfSize:JobsWidth(15.0)
                                          weight:UIFontWeightRegular]);
        });
    };return _titleLabel;
}

- (UIView *)bottomToolView {
    if (!_bottomToolView) {
        UIImage *image = ZFPlayer_Image(@"ZFPlayer_bottom_shadow");
        _bottomToolView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byLayer(^(CALayer *layer) {
                layer.byContents((id)image.CGImage);
            });
        });
    };return _bottomToolView;
}

- (UIButton *)playOrPauseBtn {
    if (!_playOrPauseBtn) {
        _playOrPauseBtn = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnImage(ZFPlayer_Image(@"new_allPlay_44x44_"))
                .selectedStateImageBy(ZFPlayer_Image(@"new_allPause_44x44_"));
        });
    };return _playOrPauseBtn;
}

- (UILabel *)currentTimeLabel {
    if (!_currentTimeLabel) {
        _currentTimeLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextCor([UIColor whiteColor])
                .byFont([UIFont systemFontOfSize:JobsWidth(14.0f)
                                          weight:UIFontWeightRegular])
                .byTextAlignment(NSTextAlignmentCenter);
        });
    };return _currentTimeLabel;
}

- (ZFSliderView *)slider {
    if (!_slider) {
        _slider = [[ZFSliderView alloc] init];
        _slider.byDelegate(self);
        _slider.maximumTrackTintColor = [UIColor colorWithRed:0.5
                                                        green:0.5
                                                         blue:0.5
                                                        alpha:0.8];
        _slider.bufferTrackTintColor  = [UIColor colorWithRed:1
                                                        green:1
                                                         blue:1
                                                        alpha:0.5];
        _slider.byMinimumTrackTintColor([UIColor whiteColor]);
        [_slider setThumbImage:ZFPlayer_Image(@"ZFPlayer_slider")
                      forState:UIControlStateNormal];
        _slider.bySliderHeight(2);
    };return _slider;
}

- (UILabel *)totalTimeLabel {
    if (!_totalTimeLabel) {
        _totalTimeLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextCor([UIColor whiteColor])
                .byFont([UIFont systemFontOfSize:JobsWidth(14.0f)])
                .byTextAlignment(NSTextAlignmentCenter);
        });
    };return _totalTimeLabel;
}

- (UIButton *)fullScreenBtn {
    if (!_fullScreenBtn) {
        _fullScreenBtn = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button.jobsResetBtnImage(ZFPlayer_Image(@"ZFPlayer_fullscreen"));
        });
    };return _fullScreenBtn;
}

- (UIImageView *)coverImageView {
    if (!_coverImageView) {
        _coverImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView
                .byUserInteractionEnabled(YES)
                .byContentMode(UIViewContentModeScaleAspectFit);
        });
    };return _coverImageView;
}

- (ZFSliderView *)bottomPgrogress {
    if (!_bottomPgrogress) {
        _bottomPgrogress = [[ZFSliderView alloc] init];
        _bottomPgrogress.byMaximumTrackTintColor([UIColor clearColor]);
        _bottomPgrogress.byMinimumTrackTintColor([UIColor whiteColor]);
        _bottomPgrogress.byBufferTrackTintColor([UIColor colorWithRed:1 green:1 blue:1 alpha:0.5]);
        _bottomPgrogress.bySliderHeight(1);
        _bottomPgrogress.byHideSliderBlock(NO);
    };return _bottomPgrogress;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN ZFCustomControlView
-(JobsRetZFCustomControlViewByBOOLBlock _Nonnull)byControlViewAppeared{
    @jobs_weakify(self)
    return ^__kindof ZFCustomControlView * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setControlViewAppeared:data];
        return self;
    };
}

-(JobsRetZFCustomControlViewBydispatch_block_tBlock _Nonnull)byAfterBlock{
    @jobs_weakify(self)
    return ^__kindof ZFCustomControlView * _Nullable(dispatch_block_t data){
        @jobs_strongify(self)
        [self setAfterBlock:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END ZFCustomControlView
@end

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN ZFSpeedLoadingView
@implementation ZFSpeedLoadingView (JobsLocalPropertyDSLAutogen_8b72bfeda4)
-(JobsRetZFSpeedLoadingViewByCGFloatBlock _Nonnull)byZf_centerX{
    @jobs_weakify(self)
    return ^__kindof ZFSpeedLoadingView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setZf_centerX:data];
        return self;
    };
}

-(JobsRetZFSpeedLoadingViewByCGFloatBlock _Nonnull)byZf_centerY{
    @jobs_weakify(self)
    return ^__kindof ZFSpeedLoadingView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setZf_centerY:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END ZFSpeedLoadingView

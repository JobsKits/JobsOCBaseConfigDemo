//
//  JobsLongPressLikeDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月14日，星期二.
//

#import "JobsLongPressLikeDemoVC.h"

@interface JobsLongPressLikeDemoVC ()

Prop_strong()UILabel *hintLab;
Prop_strong()UIButton *likeBtn;
Prop_strong()UIImpactFeedbackGenerator *hapticFeedback;

@end

@implementation JobsLongPressLikeDemoVC
-(void)dealloc {
    _likeBtn.byFuseBubbleStop();
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsLongPressLikeDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        if ([self.requestParams isKindOfClass:UIViewModel.class]) {
            self.byViewModel((UIViewModel *)self.requestParams);
            if (self.viewModel.pushOrPresent != ComingStyle_Unknown) {
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byText(@"长按点赞冒泡".jobsTr())
                    .byFont(UIFontWeightRegularSize(18))
                    .byTextCor(JobsLabelColor);
            })
            .byBgCor(HEXCOLOR(0xF5F7FA))
            .byNavBgCor(HEXCOLOR(0xF5F7FA));
    };
}

-(void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsLongPressLikeDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.makeNavByAlpha(1);
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.hintLab.byHidden(NO);
        self.likeBtn.byHidden(NO);
    };
}

-(void)viewWillDisappear:(BOOL)animated {
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsLongPressLikeDemoVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        self.likeBtn.byFuseBubbleStop();
        [self.likeBtn byFusePressScaleStop:NO
                                  duration:0
                                   damping:1
                                  velocity:0];
    };
}

#pragma mark —— Action
-(jobsByLongPressGestureRecognizerBlock _Nonnull)handleLongPress{
    @jobs_weakify(self)
    return ^(UILongPressGestureRecognizer * gesture){
        @jobs_strongify(self)
        if (!self) return;
        switch (gesture.state) {
            /// 处理 UIGestureRecognizerStateBegan 分支
            case UIGestureRecognizerStateBegan:
                self.beginLike();
                break;
            /// 处理 UIGestureRecognizerStateEnded 分支
            case UIGestureRecognizerStateEnded:
            /// 处理 UIGestureRecognizerStateCancelled 分支
            case UIGestureRecognizerStateCancelled:
            /// 处理 UIGestureRecognizerStateFailed 分支
            case UIGestureRecognizerStateFailed:
                self.endLike();
                break;
            /// 未匹配已知分支时执行兜底处理
            default:
                break;
        }
    };
}

-(jobsByBOOLBlock _Nonnull)updateLikeState{
    @jobs_weakify(self)
    return ^(BOOL isLiked){
        @jobs_strongify(self)
        if (!self) return;
        self.likeBtn
            .bySelected(isLiked)
            .byTintColor(isLiked ? UIColor.systemRedColor : HEXCOLOR(0x6B7280));
    };
}

-(jobsByVoidBlock _Nonnull)beginLike {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.updateLikeState(YES);
        [self.likeBtn byFusePressScaleStart:1.08
                                   duration:0.12];
        JobsFuseBubbleConfig *config = JobsFuseBubbleConfig.config()
            .byEmissionInterval(0.16)
            .byRiseDistance(JobsWidth(190))
            .byHorizontalDrift(JobsWidth(58))
            .byDuration(0.92)
            .byMaximumConcurrentCount(10);
        @jobs_weakify(self)
        self.hapticFeedback.prepare;
        [self.likeBtn byFuseBubbleStartInView:self.view
                                       config:config
                               bubbleProvider:^__kindof UIView *{
            return jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
                imageView
                    .byImage(@"hand.thumbsup.fill".sys_img)
                    .byContentMode(UIViewContentModeScaleAspectFit)
                    .byFrame(CGRectMake(0, 0, JobsWidth(34), JobsWidth(34)))
                    .byTintColor(UIColor.systemRedColor);
            });
        } onEmit:^{
            @jobs_strongify(self)
            [self.hapticFeedback impactOccurred];
            self.hapticFeedback.prepare;
            self.likeBtn.byFusePlaySound(@"Sound.wav");
        }];
    };
}

-(jobsByVoidBlock _Nonnull)endLike {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.likeBtn.byFuseBubbleStop();
        [self.likeBtn byFusePressScaleStop:YES
                                  duration:0.22
                                   damping:0.72
                                  velocity:0.8];
    };
}

#pragma mark —— LazyLoad
-(UILabel *)hintLab {
    if (!_hintLab) {
        @jobs_weakify(self)
        _hintLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"轻点下方大拇指切换点赞或取消；长按则持续冒泡，并伴随震动与声音反馈".jobsTr())
                .byTextCor(JobsSecondaryLabelColor)
                .byFont(UIFontWeightRegularSize(15))
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(0)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(44));
                    make.left.right.equalTo(self.view).inset(JobsWidth(28));
                });
        });
    };return _hintLab;
}

-(UIButton *)likeBtn {
    if (!_likeBtn) {
        @jobs_weakify(self)
        _likeBtn = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            UILongPressGestureRecognizer *gesture = (jobsMakeLongPressGesture(^(UILongPressGestureRecognizer * _Nullable gesture) {
                gesture
                    .byMinimumPressDuration(0.32)
                    .byAllowableMovement(JobsWidth(18));
            })).GestureActionBy(^(__kindof UIGestureRecognizer * _Nullable gesture) {
                @jobs_strongify(self)
                self.handleLongPress((UILongPressGestureRecognizer *)gesture);
            });
            button
                .jobsResetBtnImage(@"hand.thumbsup.fill".sys_img)
                .jobsResetBtnBgCor(HEXCOLOR(0xEEF0F3))
                .jobsResetBtnCornerRadiusValue(JobsWidth(48))
                .onClickBy(^(UIButton *button) {
                    @jobs_strongify(self)
                    self.updateLikeState(!button.jobs_isSelected);
                })
                .byTintColor(HEXCOLOR(0x6B7280))
                .byAddGestureRecognizer(gesture)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer.byMasksToBounds(NO);
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.hintLab.mas_bottom).offset(JobsWidth(70));
                    make.centerX.equalTo(self.view);
                    make.width.height.mas_equalTo(JobsWidth(96));
                });
        });
    };return _likeBtn;
}

-(UIImpactFeedbackGenerator *)hapticFeedback {
    if (!_hapticFeedback) {
        _hapticFeedback = [UIImpactFeedbackGenerator.alloc initWithStyle:UIImpactFeedbackStyleMedium];
    };return _hapticFeedback;
}

@end

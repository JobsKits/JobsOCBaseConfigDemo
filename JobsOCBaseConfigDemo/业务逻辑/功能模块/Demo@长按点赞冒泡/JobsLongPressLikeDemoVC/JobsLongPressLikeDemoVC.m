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
    [_likeBtn byFuseBubbleStop];
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView {
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if (self.viewModel.pushOrPresent != ComingStyle_Unknown) {
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data
                .byText(@"长按点赞冒泡".tr)
                .byFont(UIFontWeightRegularSize(18))
                .byTextCor(HEXCOLOR(0x263342));
        })
        .byBgCor(HEXCOLOR(0xF5F7FA))
        .byNavBgCor(HEXCOLOR(0xF5F7FA));
}

-(void)viewDidLoad {
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.view.byBgColor(HEXCOLOR(0xF5F7FA));
    self.hintLab.byHidden(NO);
    self.likeBtn.byHidden(NO);
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.likeBtn byFuseBubbleStop];
    [self.likeBtn byFusePressScaleStop:NO
                              duration:0
                               damping:1
                              velocity:0];
}

#pragma mark —— Action
-(void)handleLongPress:(UILongPressGestureRecognizer *)gesture {
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            [self beginLike];
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
            [self endLike];
            break;
        default:
            break;
    }
}

-(void)beginLike {
    self.likeBtn
        .bySelected(YES)
        .byTintColor(UIColor.systemRedColor);
    [self.likeBtn byFusePressScaleStart:1.08
                               duration:0.12];
    JobsFuseBubbleConfig *config = JobsFuseBubbleConfig.config
        .byEmissionInterval(0.16)
        .byRiseDistance(JobsWidth(190))
        .byHorizontalDrift(JobsWidth(58))
        .byDuration(0.92)
        .byMaximumConcurrentCount(10);
    @jobs_weakify(self)
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
    }];
    [self.hapticFeedback prepare];
}

-(void)endLike {
    [self.likeBtn byFuseBubbleStop];
    [self.likeBtn byFusePressScaleStop:YES
                              duration:0.22
                               damping:0.72
                              velocity:0.8];
}

#pragma mark —— LazyLoad
-(UILabel *)hintLab {
    if (!_hintLab) {
        @jobs_weakify(self)
        _hintLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"长按下方大拇指：图标立即变红，持续冒泡并伴随震动反馈".tr)
                .byTextCor(HEXCOLOR(0x6B7280))
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
            UILongPressGestureRecognizer *gesture = [jobsMakeLongPressGesture(^(UILongPressGestureRecognizer * _Nullable gesture) {
                gesture
                    .byMinimumPressDuration(0.32)
                    .byAllowableMovement(JobsWidth(18));
            }) GestureActionBy:^(__kindof UIGestureRecognizer * _Nullable gesture) {
                @jobs_strongify(self)
                [self handleLongPress:(UILongPressGestureRecognizer *)gesture];
            }];
            button
                .jobsResetBtnImage(@"hand.thumbsup.fill".sys_img)
                .jobsResetBtnBgCor(HEXCOLOR(0xEEF0F3))
                .byTintColor(HEXCOLOR(0x6B7280))
                .byAddGestureRecognizer(gesture)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(48))
                        .byMasksToBounds(NO);
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
        _hapticFeedback = [UIImpactFeedbackGenerator.alloc initWithStyle:UIImpactFeedbackStyleLight];
    };return _hapticFeedback;
}

@end

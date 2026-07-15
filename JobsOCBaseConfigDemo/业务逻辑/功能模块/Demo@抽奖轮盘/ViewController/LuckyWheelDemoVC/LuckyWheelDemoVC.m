//
//  LuckyWheelDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "LuckyWheelDemoVC.h"

@interface LuckyWheelDemoVC ()

Prop_strong()CAGradientLayer *backgroundGradientLayer;
Prop_strong()UIView *stageView;
Prop_strong()UILabel *stageTitleLab;
Prop_strong()UILabel *stageSubTitleLab;
Prop_strong()LuckyWheelView *wheelView;
Prop_strong()UIButton *spinToggleBtn;
Prop_strong()NSMutableArray<LuckyWheelSegment *> *segments;

- (UIImage *)luckyWheelResultToastImage;
- (void)showLuckyWheelResultToastBySegment:(LuckyWheelSegment *)segment;
- (void)updateSpinToggleBtnBySpinning:(BOOL)spinning;

@end

@implementation LuckyWheelDemoVC
- (void)dealloc{
    JobsNotificationCenter.remove(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byTextCor(HEXCOLOR(0x3D4A58));
            data.byText(@"抽奖转盘".tr);
            data.byFont(UIFontWeightRegularSize(18));
        })
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;/// self.gk_navBackgroundImage 和 self.bgImageView
        .byBgCor(HEXCOLOR(0xFFF7EA))
        .byNavBgCor(HEXCOLOR(0xFFF1E2));/// self.gk_navBackgroundColor 和 self.view.backgroundColor
        //    self.viewModel.navBgImage = @"导航栏左侧底图".img;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(HEXCOLOR(0xFFF7EA));
    self.backgroundGradientLayer.byHidden(NO);
    self.stageView.byVisible(YES);
    self.stageTitleLab.byVisible(YES);
    self.stageSubTitleLab.byVisible(YES);
    @jobs_weakify(self)
    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
        @jobs_strongify(self)
        data.add(UIBarButtonItem.initBy(self.spinToggleBtn));
    });
    self.makeNavByAlpha(1);
    self.wheelView.byVisible(YES);
    [self updateSpinToggleBtnBySpinning:self.wheelView.isSpinning];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.backgroundGradientLayer.byFrame(self.view.bounds);
    self.stageView.layer.byShadowPath(UIBezierPath.byBezierPathWithRoundedRect(self.stageView.bounds,
                                                                               JobsWidth(24)).CGPath);
}

-(void)updateSpinToggleBtnBySpinning:(BOOL)spinning{
    self.spinToggleBtn.bySelected(spinning);
    self.spinToggleBtn.jobsResetBtnTitle(spinning ? @"停止".tr : @"开始抽奖".tr);
}

- (void)showLuckyWheelResultToastBySegment:(LuckyWheelSegment *)segment {
    NSString *result = (segment.text ?: @"未知奖项").tr;
    [WHToast showImage:self.luckyWheelResultToastImage
               message:[NSString stringWithFormat:@"%@\n%@", @"抽奖结果：".tr, result]
              duration:1.5
         finishHandler:nil];
}

- (UIImage *)luckyWheelResultToastImage {
    CGSize size = CGSizeMake(JobsWidth(44), JobsWidth(44));
    UIGraphicsImageRendererFormat *format = UIGraphicsImageRendererFormat.defaultFormat;
    format.opaque = NO;
    UIGraphicsImageRenderer *renderer = [UIGraphicsImageRenderer.alloc initWithSize:size
                                                                             format:format];
    return [renderer imageWithActions:^(__unused UIGraphicsImageRendererContext * _Nonnull rendererContext) {
        NSString *emoji = @"🎉";
        UIFont *font = UIFontSystemFontOfSize(size.width * 0.78);
        NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
        paragraphStyle.alignment = NSTextAlignmentCenter;
        NSDictionary<NSAttributedStringKey, id> *attributes = @{
            NSFontAttributeName: font,
            NSParagraphStyleAttributeName: paragraphStyle
        };
        CGSize emojiSize = [emoji sizeWithAttributes:attributes];
        CGRect rect = CGRectMake((size.width - emojiSize.width) / 2.0,
                                 (size.height - emojiSize.height) / 2.0,
                                 emojiSize.width,
                                 emojiSize.height);
        [emoji drawInRect:rect
           withAttributes:attributes];
    }];
}
#pragma mark —— Lazyload
-(NSMutableArray<LuckyWheelSegment *> *)segments{
    if(!_segments){
        _segments = jobsMakeMutArr(^(__kindof NSMutableArray<NSObject *> * _Nullable arr) {
            arr.add([LuckyWheelSegment.alloc initWithText:@"一等奖".tr
                                                 textFont:UIFontWeightSemiboldSize(JobsWidth(13))
                                                textColor:HEXCOLOR(0x314255)
                                           attributedText:nil
                                          backgroundColor:HEXCOLOR(0xBFE5F2)
                                         placeholderImage:@"gift.fill".sys_img
                                           imageURLString:@"https://picsum.photos/30"])
            .add([LuckyWheelSegment.alloc initWithText:@"二等奖".tr
                                              textFont:UIFontWeightSemiboldSize(JobsWidth(13))
                                             textColor:HEXCOLOR(0x314255)
                                        attributedText:nil
                                       backgroundColor:HEXCOLOR(0xFFE2A9)
                                      placeholderImage:@"sparkles".sys_img
                                        imageURLString:@"https://picsum.photos/30"])
            .add([LuckyWheelSegment.alloc initWithText:@"三等奖".tr
                                              textFont:UIFontWeightSemiboldSize(JobsWidth(13))
                                             textColor:HEXCOLOR(0x314255)
                                        attributedText:nil
                                       backgroundColor:HEXCOLOR(0xCDEBDC)
                                      placeholderImage:@"seal.fill".sys_img
                                        imageURLString:@"https://picsum.photos/30"])
            .add([LuckyWheelSegment.alloc initWithText:@"谢谢参与".tr
                                              textFont:UIFontWeightSemiboldSize(JobsWidth(13))
                                             textColor:HEXCOLOR(0x314255)
                                        attributedText:nil
                                       backgroundColor:HEXCOLOR(0xF7C5D6)
                                      placeholderImage:@"hand.thumbsup.fill".sys_img
                                        imageURLString:@"https://picsum.photos/30"]);
        });
    };return _segments;
}

-(CAGradientLayer *)backgroundGradientLayer{
    if(!_backgroundGradientLayer){
        _backgroundGradientLayer = CAGradientLayer.layer;
        _backgroundGradientLayer.colors = @[
            (__bridge id)HEXCOLOR(0xFFF4E5).CGColor,
            (__bridge id)HEXCOLOR(0xF9E7C8).CGColor,
            (__bridge id)HEXCOLOR(0xFFE8D6).CGColor
        ];
        _backgroundGradientLayer.locations = @[@0, @0.48, @1];
        _backgroundGradientLayer.startPoint = CGPointMake(0.2, 0);
        _backgroundGradientLayer.endPoint = CGPointMake(0.9, 1);
        [self.view.layer insertSublayer:_backgroundGradientLayer atIndex:0];
    };return _backgroundGradientLayer;
}

-(UIView *)stageView{
    if(!_stageView){
        @jobs_weakify(self)
        _stageView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor([JobsWhiteColor colorWithAlphaComponent:0.88])
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.left.equalTo(self.view).offset(JobsWidth(22));
                    make.right.equalTo(self.view).offset(-JobsWidth(22));
                    [self make:make topOffset:JobsWidth(22)];
                    make.bottom.equalTo(self.view).offset(-(JobsBottomSafeAreaHeight() + JobsWidth(28)));
                });
            view.layer
                .byCornerRadius(JobsWidth(24))
                .byBorderWidth(JobsWidth(1))
                .byBorderColor([HEXCOLOR(0xFFFFFF) colorWithAlphaComponent:0.8].CGColor)
                .byShadowColor(HEXCOLOR(0xB47722).CGColor)
                .byShadowOpacity(0.16)
                .byShadowOffset(CGSizeMake(0, JobsWidth(12)))
                .byShadowRadius(JobsWidth(24));
        });
    };return _stageView;
}

-(UILabel *)stageTitleLab{
    if(!_stageTitleLab){
        @jobs_weakify(self)
        _stageTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"LUCKY WHEEL".tr)
                .byFont(UIFontWeightSemiboldSize(JobsWidth(15)))
                .byTextCor(HEXCOLOR(0xC37A19))
                .byTextAlignment(NSTextAlignmentCenter)
                .addOn(self.stageView)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.stageView).offset(JobsWidth(24));
                    make.left.equalTo(self.stageView).offset(JobsWidth(24));
                    make.right.equalTo(self.stageView).offset(-JobsWidth(24));
                    make.height.mas_equalTo(JobsWidth(22));
                });
        });
    };return _stageTitleLab;
}

-(UILabel *)stageSubTitleLab{
    if(!_stageSubTitleLab){
        @jobs_weakify(self)
        _stageSubTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"转动今日手气".tr)
                .byFont(UIFontWeightRegularSize(JobsWidth(13)))
                .byTextCor(HEXCOLOR(0x6B7280))
                .byTextAlignment(NSTextAlignmentCenter)
                .addOn(self.stageView)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.stageTitleLab.mas_bottom).offset(JobsWidth(4));
                    make.left.equalTo(self.stageView).offset(JobsWidth(24));
                    make.right.equalTo(self.stageView).offset(-JobsWidth(24));
                    make.height.mas_equalTo(JobsWidth(20));
                });
        });
    };return _stageSubTitleLab;
}

-(LuckyWheelView *)wheelView{
    if(!_wheelView){
        @jobs_weakify(self)
        _wheelView = jobsMakeLuckyWheelView(^(__kindof LuckyWheelView * _Nullable wheel) {
            @jobs_strongify(self)
            wheel.translatesAutoresizingMaskIntoConstraints = NO;
            wheel.bySegments(self.segments)
                .byPointerDirection(JobsDirectionUp)
                .bySpinDuration(3.0)
                .byCustomInitialVelocity(@25)
                .byPanRotationEnabled(YES)
                .bySegmentTap(^(LuckyWheelSegment * _Nonnull segment) {
                    @jobs_strongify(self)
                    [self showLuckyWheelResultToastBySegment:segment];
                })
                .bySegmentLongPress(^(LuckyWheelSegment * _Nonnull segment,
                                      UILongPressGestureRecognizer * _Nonnull gr) {
                 if (gr.state == UIGestureRecognizerStateBegan) {
                     [NSString stringWithFormat:@"长按奖项：%@", segment.text ?: @""].toast();
                 }
             }).byBgColor(JobsClearColor);
            [wheel onSpinningStateChanged:^(BOOL spinning) {
                @jobs_strongify(self)
                [self updateSpinToggleBtnBySpinning:spinning];
            }];
        })
        .addOn(self.stageView)
        .byAdd(^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.centerX.equalTo(self.stageView);
            make.centerY.equalTo(self.stageView).offset(JobsWidth(28));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(320), JobsWidth(320)));
        });
    };return _wheelView;
}

-(UIButton *)spinToggleBtn{
    if(!_spinToggleBtn){
        @jobs_weakify(self)
        _spinToggleBtn = BaseButton.jobsInit()
            .jobsResetBtnTitle(@"开始抽奖".tr)
            .selectedStateTitleBy(@"停止".tr)
            .jobsResetBtnTitleCor(HEXCOLOR(0x5F3B12))
            .selectedStateTitleColorBy(HEXCOLOR(0x5F3B12))
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(JobsWidth(15)))
            .bgColorBy(HEXCOLOR(0xFFFDF8))
            .jobsResetBtnCornerRadiusValue(JobsWidth(18))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                [self.wheelView toggleSpin];
                [self updateSpinToggleBtnBySpinning:self.wheelView.isSpinning];
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .bySize(CGSizeMake(JobsWidth(78), JobsWidth(36)));
    };return _spinToggleBtn;
}

@end

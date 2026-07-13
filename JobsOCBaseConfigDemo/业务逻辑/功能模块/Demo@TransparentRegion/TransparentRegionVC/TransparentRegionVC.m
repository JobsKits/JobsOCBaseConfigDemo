//
//  TransparentRegionVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TransparentRegionVC.h"

@interface TransparentRegionVC ()

@end

@implementation TransparentRegionVC

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
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
            data.byText(data.attributedTitle.string);
            data.byFont(UIFontWeightRegularSize(16));
        })
    
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        //    self.viewModel.bgImage = @"启动页SLOGAN".img;
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(JobsYellowColor);

    self.makeNavByAlpha(1);
    
    self.scrollView.byAlpha(1);

    self.label.byAlpha(1);

    [self addArc];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— 一些私有方法
-(void)addArc{
    CGFloat arcTop = self.jobsNavigationBarHeight + 20;
    jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
        layer
            .byPath(UIBezierPath
                    .byBezierPathWithRect(UIScreen.mainScreen.bounds)
                    .byAppendPath(UIBezierPath.byBezierPathWithOvalInRect(CGRectMake(100, arcTop, 200, 200)))// 中间镂空的矩形框
                    .byUsesEvenOddFillRule(YES).CGPath)
            .byFillRule(kCAFillRuleEvenOdd)
            .byFillColor(JobsWhiteColor.CGColor)
            .byOpacity(0.5)
            .addOn(self.view.layer);
    });
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize scrollView = _scrollView;
-(UIScrollView *)scrollView{
    if (!_scrollView) {
        @jobs_weakify(self)
        _scrollView = jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
            @jobs_strongify(self)
            scrollView
                .byContentSize(CGSizeMake(JobsMainScreen_WIDTH(), JobsMainScreen_HEIGHT() * 2))
                .byBgColor(JobsRedColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.left.right.bottom.equalTo(self.view);
                });
        });
    };return _scrollView;
}
@synthesize label = _label;
-(UILabel *)label{
    if (!_label) {
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(@"iOS-UIView设置阴影效果".tr)
                .byFrame(CGRectMake(100, 400, 200, 200))
                .byBgColor(JobsYellowColor)
                .byCornerRadius(9.0)
                .byLayer(^(CALayer *layer) {
                    layer
                        .byShadowColor(JobsBlueColor.CGColor) // 阴影颜色
                        .byShadowOpacity(0.8)
                 // 阴影透明度
                        .byShadowOffset(CGSizeMake(0, 0))     // 阴影偏移量
                        .byShadowRadius(9.0)
                        .byShadowPath(UIBezierPath.byBezierPathWithRoundedCorners(layer.bounds,
                                                                                 5,
                                                                                 CGSizeMake(0, 0)).CGPath);
                })
                .addOn(self.scrollView);
        });
    };return _label;
}

@end

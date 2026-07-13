//
//  JobsProgressVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsProgressVC.h"

@interface JobsProgressVC ()

Prop_strong()PHCycleView *progressView;

@end

@implementation JobsProgressVC

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
    
    self.progressView.byAlpha(1);

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
#pragma mark —— lazyLoad
-(PHCycleView *)progressView{
    if (!_progressView) {
        _progressView = [PHCycleView.alloc initWithFrame:CGRectMake(0, 0, 130, 130)];
        _progressView.center = self.view.center;
        _progressView.byBgColor([UIColor clearColor]);

        [_progressView setProgressColor:[UIColor blueColor]];
        _progressView.progressFont = UIFontSystemFontOfSize(30);
        _progressView.addOn(self.view);
        [_progressView updateProgress:50];
        [_progressView setLinePreAngle:15 lineSize:CGSizeMake(3, 10) color:[UIColor redColor]];
        _progressView.describeFont = UIFontSystemFontOfSize(12);
        _progressView.describeStr = @"历史最高分";
        _progressView.progressTextColor = [UIColor blackColor];
        _progressView.describeTextColor = [UIColor blackColor];
        /// 历史 blue = 255 超出 UIKit 归一化范围，最终夹取为 1。
        _progressView.outLayerColor = RGBA_COLOR(0, 0, 255, 0.3);
    };return _progressView;
}

@end

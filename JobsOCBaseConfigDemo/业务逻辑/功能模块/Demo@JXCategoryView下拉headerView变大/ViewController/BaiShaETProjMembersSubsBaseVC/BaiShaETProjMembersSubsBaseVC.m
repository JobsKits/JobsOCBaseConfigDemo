//
//  BaiShaETProjMembersSubsBaseVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "BaiShaETProjMembersSubsBaseVC.h"

@interface BaiShaETProjMembersSubsBaseVC ()

@end

@implementation BaiShaETProjMembersSubsBaseVC
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
            data
                .byTextCor(HEXCOLOR(0x3D4A58))
                .byText(@"".tr)
                .byFont(UIFontWeightRegularSize(16));
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
    self.makeNavByAlpha(1);
    self.topLineLab.byAlpha(1);
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
#pragma mark —— 一些公有方法
-(CGSize)getTopLineLabSize{
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(2));
}
#pragma mark —— lazyLoad
-(UILabel *)topLineLab{
    if (!_topLineLab) {
        @jobs_weakify(self)
        _topLineLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byBgColor(HEXCOLOR(0xF8DA87))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.size.mas_equalTo(CGSizeMake(self.getTopLineLabSize.width, self.getTopLineLabSize.height));
                    make.centerX.equalTo(self.view);
                    // make.top.equalTo(self.gk_navigationBar.jobsVisible ? self.gk_navigationBar.mas_bottom : self.view);
                    if (self.gk_navigationBar.jobsVisible) {
                        make.top.equalTo(self.gk_navigationBar.mas_bottom);
                    }else{
                        make.top.equalTo(self.view);
                    }
                });
        });
    };return _topLineLab;
}

@end

//
//  JobsSettingGestureVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsSettingGestureVC.h"

@interface JobsSettingGestureVC ()

Prop_strong()UILabel *topLineLab;

@end

@implementation JobsSettingGestureVC

- (instancetype)init{
    return [self initWithMode:JobsGestureLockModeCreate
                   storageKey:@"JobsGestureLockDefaultKey"];
}

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
        })
        //        self.viewModel.textModel.text = @"設置手勢密碼".tr;
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
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
    self.makeNavByAlpha(1);
    self.topLineLab.byAlpha(1);
    [self 重定义父类控件的距离];
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
#pragma mark —— 私有方法
-(jobsByCGFloatBlock _Nonnull)makeNavByAlpha{
    @jobs_weakify(self)
    return ^(CGFloat data){
        @jobs_strongify(self)
        /// JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape
        id<AppToolsProtocol> appToolsSelf = (id<AppToolsProtocol>)self;
        appToolsSelf.setGKNav(nil);
        appToolsSelf.setGKNavBackBtn(nil);
        if(self.leftBarButtonItems.count) self.byGKNavLeftBarButtonItems(self.leftBarButtonItems);
        if(self.rightBarButtonItems.count) self.byGKNavRightBarButtonItems(self.rightBarButtonItems);
        self.byGKNavigationBarBlock(^(__kindof GKCustomNavigationBar * _Nullable navigationBar) {
            navigationBar
                .byHidden(!data)
                .byAlpha(data);
        });
    };
}

-(void)重定义父类控件的距离{
    UIImageView *headIcon = self.valueForKey(@"avatarView");// 账户头像
    JobsGestureLockIndicator *gestureLockIndicator = self.valueForKey(@"indicatorView");
    UILabel *statusLabel = self.valueForKey(@"statusLabel");
    UILabel *nameLabel = self.valueForKey(@"nameLabel");// 账户名
    UIButton *otherAcountBtn = self.valueForKey(@"otherAccountButton");// 其他账户登录按钮
    UIButton *forgetPswBtn = self.valueForKey(@"forgotButton");// 忘记手势密码按钮
    
    nameLabel.jobsVisible = NO;
    headIcon.jobsVisible = NO;
    otherAcountBtn.jobsVisible = NO;
    forgetPswBtn.jobsVisible = NO;
    
    CGFloat offset = JobsNavigationBarAndStatusBarHeight(nil) + JobsWidth(2);
    
    headIcon.y += JobsWidth(offset);
    gestureLockIndicator.y += JobsWidth(offset);
    statusLabel.y += JobsWidth(offset);
    nameLabel.y += JobsWidth(offset);
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
                    make.size.mas_equalTo(CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(2)));
                    make.centerX.equalTo(self.view);
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                });
        });
    };return _topLineLab;
}

@end

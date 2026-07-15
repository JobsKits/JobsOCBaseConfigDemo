//
//  JobsCommentVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsCommentVC.h"

@interface JobsCommentVC ()

Prop_strong()UIButton *contactCustomerServiceBtn;// 联系客服按钮
Prop_strong()JobsPresentationCtrl *presentationController;

@end

@implementation JobsCommentVC
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
    self.makeNavByAlpha(1);
    self.contactCustomerServiceBtn.byAlpha(1);
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
-(void)makeJobsCommentCoreVC{    //触发
    UIViewController *presentingVC = self.jobsGetCurrentViewController ? : self;
    if (presentingVC.presentedViewController) return;
    JobsCommentCoreVC *jobsCommentCoreVC = JobsCommentCoreVC.new;
    CGFloat popUpHeight = JobsMainScreen_HEIGHT() / 2;
    jobsCommentCoreVC.popUpHeight = popUpHeight;
    jobsCommentCoreVC.pushOrPresent = ComingStyle_PRESENT;
    [jobsCommentCoreVC actionObjBlock:^(id data) {
        JobsLog(@"您点击了关注");
    }];
    self.presentationController = [JobsPresentationCtrl.alloc initWithPresentedViewController:jobsCommentCoreVC
                                                                     presentingViewController:presentingVC];
    jobsCommentCoreVC.transitioningDelegate = self.presentationController;
    [presentingVC presentViewController:jobsCommentCoreVC
                               animated:YES
                             completion:NULL];
}
#pragma mark —— lazyLoad
-(UIButton *)contactCustomerServiceBtn{
    if (!_contactCustomerServiceBtn) {
        @jobs_weakify(self)
        _contactCustomerServiceBtn = BaseButton.jobsInit()
            .bgColorBy(JobsClearColor.colorWithAlphaComponentBy(0))
            .jobsResetBtnImage(@"zaixiankefu_en".img)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                [self makeJobsCommentCoreVC];
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(JobsWidth(230), JobsWidth(50)));
                make.center.equalTo(self.view);
            });
    };return _contactCustomerServiceBtn;
}

@end

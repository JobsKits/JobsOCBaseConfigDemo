//
//  JobsExcelVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsExcelVC.h"

@interface JobsExcelVC ()
/// UI
Prop_strong()JobsExcelView *excelView;
/// Data

@end

@implementation JobsExcelVC
- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}

- (instancetype)init{
    if (self = [super init]) {
        JobsLog(@"");
    };return self;
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
                .byTextCor(JobsLabelColor)
                .byText(@"相关功能列表".tr)
                .byFont(UIFontWeightRegularSize(16));
        })
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        // self.viewModel.bgImage = @"启动页SLOGAN".img;
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(JobsSystemBackgroundColor);
    self.makeNavByAlpha(1);
    self.excelView.byAlpha(1);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.byGKNavigationBarBlock(^(__kindof GKCustomNavigationBar * _Nullable navigationBar) {
        navigationBar.byHidden(YES);
    });
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark —— LazyLoad
-(JobsExcelView *)excelView{
    if(!_excelView){
        @jobs_weakify(self)
        _excelView = jobsMakeExcelView(^(__kindof JobsExcelView * _Nullable view) {
            @jobs_strongify(self)
            view.addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.center.equalTo(self.view);
                    make.size.mas_equalTo(JobsExcelView.viewSizeByModel(nil));
                })
                .JobsRichViewByModel(jobsMakeExcelConfigureViewModel(^(JobsExcelConfigureViewModel * _Nullable data) {
                    data.XZExcelH = JobsExcelView.viewSizeByModel(nil).height;
                    data.XZExcelW = JobsExcelView.viewSizeByModel(nil).width;
                    data.itemW = JobsWidth(80);
                    data.topHeaderTitles = jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable arr) {
                        arr
                            .add(@"Order Time".tr)
                            .add(@"Order No.".tr)
                            .add(@"Transaction Type".tr)
                            .add(@"Amount".tr)
                            .add(@"Method".tr)
                            .add(@"Status".tr);
                    });
                    data.configureDataBy(nil);
                }))
                .byBgColor(JobsRedColor);
        });
    };return _excelView;
}

@end

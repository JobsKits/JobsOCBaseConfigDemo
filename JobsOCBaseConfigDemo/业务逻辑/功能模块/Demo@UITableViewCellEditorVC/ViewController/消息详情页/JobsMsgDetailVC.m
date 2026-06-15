//
//  JobsMsgDetailVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsMsgDetailVC.h"

@interface JobsMsgDetailVC ()
/// UI
Prop_strong()UILabel *titleLab;
Prop_strong()UILabel *subTitleLab;
Prop_strong()UIButton *drawBtn;
Prop_strong()UILabel *lineLab;
Prop_strong()BaseButton *deleteBtn;
/// Data
Prop_strong()JobsMsgDataModel *msgDataModel;

@end

@implementation JobsMsgDetailVC

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        self.msgDataModel = self.viewModel.data;
    }
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byTextCor(HEXCOLOR(0x3D4A58));
            data.byText(@"消息详情页".tr);
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
    
    @jobs_weakify(self)
    self.leftBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
        @jobs_strongify(self)
//        data.add(UIBarButtonItem.initBy(self.shareBtn));
    });
    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
        @jobs_strongify(self)
        data.add(UIBarButtonItem.initBy(self.deleteBtn));
    });
    self.makeNavByAlpha(1);
    
    
    self.titleLab.byAlpha(1);

    self.subTitleLab.byAlpha(1);

    self.drawBtn.byAlpha(1);

    self.lineLab.byAlpha(1);

    self.textView.byAlpha(1);

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    JobsLog(@"");
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    JobsLog(@"");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(self.msgDataModel.textModel.text)
                .byFont(UIFontWeightBoldSize(16))
                .byTextCor(HEXCOLOR(0x3D4A58))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(28));
                    make.left.equalTo(self.view).offset(JobsWidth(16));
                    make.width.mas_equalTo(JobsWidth(217));
                })
                .makeLabelByShowingType(UILabelShowingType_05);
        });
    };return _titleLab;
}

-(UILabel *)subTitleLab{
    if (!_subTitleLab) {
        @jobs_weakify(self)
        _subTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byFont(UIFontWeightRegularSize(12))
                .byText(self.msgDataModel.time)
                .byTextCor(HEXCOLOR(0xB0B0B0))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(12));
                    make.left.equalTo(self.titleLab);
                })
                .makeLabelByShowingType(UILabelShowingType_01);
        });
    };return _subTitleLab;
}

-(UIButton *)drawBtn{
    if (!_drawBtn) {
        @jobs_weakify(self)
        _drawBtn = UIButton.jobsInit()
            .jobsResetBtnTitle(self.msgDataModel.isDraw ?
                               JobsSpace.add(@"已领取".tr).add(JobsSpace) :
                               JobsSpace.add(@"领取".tr).add(JobsSpace))
            .jobsResetBtnTitleCor(HEXCOLOR(0xAE8330))
            .selectedStateTitleColorBy(HEXCOLOR(0x757575))
            .bgColorBy(HEXCOLOR(0xFFEABA))
            .jobsResetBtnTitleFont(UIFontWeightRegularSize(12))
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.size.mas_equalTo(CGSizeMake(JobsWidth(40), JobsWidth(20)));
                make.right.equalTo(self.view).offset(JobsWidth(-16));
                make.top.equalTo(self.view).offset(JobsWidth(28));
            });
    };return _drawBtn;
}

-(UILabel *)lineLab{
    if (!_lineLab) {
        @jobs_weakify(self)
        _lineLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byBgColor(HEXCOLOR(0xEAEBED))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(343), JobsWidth(2)));
                    make.centerX.equalTo(self.view);
                    make.top.equalTo(self.subTitleLab.mas_bottom).offset(JobsWidth(24));
                });
        });
    };return _lineLab;
}
@synthesize textView = _textView;
-(UITextView *)textView{
    if (!_textView) {
        @jobs_weakify(self)
        _textView = jobsMakeTextView(^(__kindof UITextView * _Nullable textView) {
            @jobs_strongify(self)
            textView
                .byText(self.msgDataModel.subTextModel.text)
                .byTextColor(HEXCOLOR(0xB0B0B0))
                .byFont(UIFontWeightRegularSize(14))
                .addOn(self.view)
                .byOn(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.centerX.equalTo(self.view);
                    make.top.equalTo(self.lineLab.mas_bottom).offset(JobsWidth(20));
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(343), JobsWidth(452)));
                });
        });
    };return _textView;
}

-(BaseButton *)deleteBtn{
    if (!_deleteBtn) {
        @jobs_weakify(self)
        _deleteBtn = BaseButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetImagePadding(1)
            .jobsResetBtnImage(@"APPLY NOW".img)
            .jobsResetBtnBgImage(@"APPLY NOW".img)
            .jobsResetBtnTitleCor(HEXCOLOR(0x3D4A58))
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .jobsResetBtnTitle(@"删除".tr)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                self.backBtnClickEvent(x);
                if (self.objBlock) self.objBlock(self.msgDataModel);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
    };return _deleteBtn;
}

@end


//
//  JobsMsgDetailVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsMsgDetailVC.h"

@interface JobsMsgDetailVC ()
/// UI
Prop_strong()UIView *headerCardView;
Prop_strong()UIView *contentCardView;
Prop_strong()UILabel *titleLab;
Prop_strong()UILabel *subTitleLab;
Prop_strong()UIButton *drawBtn;
Prop_strong()UILabel *lineLab;
Prop_strong()BaseButton *deleteBtn;
/// Data
Prop_strong()JobsMsgDataModel *msgDataModel;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsMsgDetailVC
@interface JobsMsgDetailVC (JobsPropertyDSLSetterAutogen_3b9c6f75dd)
-(void)setMsgDataModel:(JobsMsgDataModel * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsMsgDetailVC

@implementation JobsMsgDetailVC
- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMsgDetailVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
            self.byMsgDataModel(self.viewModel.data);
        }
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byTextCor(JobsLabelColor)
                    .byText(@"消息详情页".jobsTr())
                    .byFont(UIFontWeightBoldSize(17));
            })
            // 使用原则：底图有 + 底色有 = 优先使用底图数据
            // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
            // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
            .byBgCor(HEXCOLOR(0xF6F7FB))
            //    self.viewModel.bgImage = @"启动页SLOGAN".img;
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgImage(@"导航栏左侧底图".img);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMsgDetailVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
            [super viewDidLoad];
            @jobs_weakify(self)
            self.byLeftBarButtonItems(jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
                @jobs_strongify(self)
        //        data.add(UIBarButtonItem.initBy(self.shareBtn));
            }))
            .byRightBarButtonItems(jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
                @jobs_strongify(self)
                data.add(UIBarButtonItem.initBy(self.deleteBtn));
            }));
            self.makeNavByAlpha(1);
            self.headerCardView.byAlpha(1);
            self.titleLab.byAlpha(1);
            self.subTitleLab.byAlpha(1);
            self.drawBtn.byAlpha(1);
            self.lineLab.byAlpha(1);
            self.contentCardView.byAlpha(1);
            self.textView.byAlpha(1);
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMsgDetailVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
    };
}

-(void)viewWillLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMsgDetailVC.class, @selector(jobsViewWillLayoutSubviews)))(self, @selector(jobsViewWillLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewWillLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillLayoutSubviews];
        JobsLog(@"");
    };
}

-(void)viewDidLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMsgDetailVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
        JobsLog(@"");
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMsgDetailVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMsgDetailVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
    };
}

-(void)viewDidDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMsgDetailVC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidDisappear:animated];
    };
}
#pragma mark —— lazyLoad
-(UIView *)headerCardView{
    if (!_headerCardView) {
        @jobs_weakify(self)
        _headerCardView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(12));
                    make.left.equalTo(self.view).offset(JobsWidth(16));
                    make.right.equalTo(self.view).offset(JobsWidth(-16));
                    make.height.mas_equalTo(JobsWidth(132));
                });
            view.layer
                .byCornerRadius(JobsWidth(8))
                .byShadowColor(RGBA_COLOR(39, 50, 68, 0.10).CGColor)
                .byShadowOpacity(1)
                .byShadowOffset(CGSizeMake(0, JobsWidth(4)))
                .byShadowRadius(JobsWidth(10));
        });
    };return _headerCardView;
}

-(UIView *)contentCardView{
    if (!_contentCardView) {
        @jobs_weakify(self)
        _contentCardView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.headerCardView.mas_bottom).offset(JobsWidth(12));
                    make.left.equalTo(self.headerCardView);
                    make.right.equalTo(self.headerCardView);
                    make.bottom.equalTo(self.view).offset(-(JobsBottomSafeAreaHeight() + JobsWidth(24)));
                });
            view.layer
                .byCornerRadius(JobsWidth(8))
                .byShadowColor(RGBA_COLOR(39, 50, 68, 0.08).CGColor)
                .byShadowOpacity(1)
                .byShadowOffset(CGSizeMake(0, JobsWidth(4)))
                .byShadowRadius(JobsWidth(10));
        });
    };return _contentCardView;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(self.msgDataModel.textModel.text)
                .byFont(UIFontWeightBoldSize(18))
                .byTextCor(JobsLabelColor)
                .byNumberOfLines(2)
                .addOn(self.headerCardView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.headerCardView).offset(JobsWidth(18));
                    make.left.equalTo(self.headerCardView).offset(JobsWidth(16));
                    make.right.lessThanOrEqualTo(self.drawBtn.mas_left).offset(JobsWidth(-12));
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
                .byText(self.msgDataModel.timeText)
                .byTextCor(JobsSecondaryLabelColor)
                .addOn(self.headerCardView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(10));
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
                               JobsSpace.add(@"已领取".jobsTr()).add(JobsSpace) :
                               JobsSpace.add(@"领取".jobsTr()).add(JobsSpace))
            .jobsResetBtnTitleCor(self.msgDataModel.isDraw ? JobsSecondaryLabelColor : HEXCOLOR(0xAE8330))
            .selectedStateTitleColorBy(HEXCOLOR(0x8F98A6))
            .bgColorBy(self.msgDataModel.isDraw ? HEXCOLOR(0xF1F4F8) : HEXCOLOR(0xFFF4DD))
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(12))
            .addOn(self.headerCardView)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.size.mas_equalTo(CGSizeMake(JobsWidth(64), JobsWidth(26)));
                make.right.equalTo(self.headerCardView).offset(JobsWidth(-16));
                make.top.equalTo(self.headerCardView).offset(JobsWidth(18));
            });
        _drawBtn.layer.byCornerRadius(JobsWidth(13)).byMasksToBounds(YES);
    };return _drawBtn;
}

-(UILabel *)lineLab{
    if (!_lineLab) {
        @jobs_weakify(self)
        _lineLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .addOn(self.headerCardView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.headerCardView).offset(JobsWidth(16));
                    make.right.equalTo(self.headerCardView).offset(JobsWidth(-16));
                    make.bottom.equalTo(self.headerCardView).offset(JobsWidth(-16));
                    make.height.mas_equalTo(JobsWidth(1));
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
                .byTextColor(HEXCOLOR(0x5C6675))
                .byFont(UIFontWeightRegularSize(15))
                .byEditable(NO)
                .bySelectable(NO)
                .byTextContainerInset(UIEdgeInsetsZero)
                .byScrollEnabled(YES)
                .byBgColor(JobsClearColor)
                .addOn(self.contentCardView)
                .byOn(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.edges.equalTo(self.contentCardView).insets(UIEdgeInsetsMake(JobsWidth(16), JobsWidth(14), JobsWidth(16), JobsWidth(14)));
                });
            textView.textContainer.byLineFragmentPadding(0);
        });
    };return _textView;
}

-(BaseButton *)deleteBtn{
    if (!_deleteBtn) {
        @jobs_weakify(self)
        _deleteBtn = BaseButton.jobsInit()
            .bgColorBy(RGBA_COLOR(255, 255, 255, 0.92))
            .jobsResetBtnTitleCor(HEXCOLOR(0xEB677F))
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(13))
            .jobsResetBtnTitle(@"删除".jobsTr())
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                self.backBtnClickEvent(x);
                if (self.objBlock) self.objBlock(self.msgDataModel);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
        _deleteBtn.byFrame(CGRectMake(0, 0, JobsWidth(56), JobsWidth(40)));
        _deleteBtn.layer
            .byCornerRadius(JobsWidth(20))
            .byShadowColor(RGBA_COLOR(39, 50, 68, 0.12).CGColor)
            .byShadowOpacity(1)
            .byShadowOffset(CGSizeMake(0, JobsWidth(3)))
            .byShadowRadius(JobsWidth(8));
    };return _deleteBtn;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsMsgDetailVC
-(JobsRetJobsMsgDetailVCByJobsMsgDataModelBlock _Nonnull)byMsgDataModel{
    @jobs_weakify(self)
    return ^__kindof JobsMsgDetailVC * _Nullable(JobsMsgDataModel * _Nullable data){
        @jobs_strongify(self)
        [self setMsgDataModel:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsMsgDetailVC
@end

//
//  JobsVerticalMenuMainVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsVerticalMenuMainVC.h"

static CGFloat JobsVerticalMenuMainCellOffsetX(void) {
    return JobsWidth(16);
}

static UIColor *JobsVerticalMenuMainBgCor(void) {
    return JobsSystemBackgroundColor;
}

static UIColor *JobsVerticalMenuMainCardBorderCor(void) {
    return JobsSeparatorColor;
}

@interface JobsVerticalMenuMainVC ()
/// Data
Prop_strong()NSMutableArray <NSMutableArray <__kindof UITableViewCell *>*>*tbvSectionRowCellMutArr;
Prop_strong()NSMutableArray <NSMutableArray <__kindof UIViewModel *>*>*dataMutArr;

@end

@implementation JobsVerticalMenuMainVC
- (void)dealloc{
    JobsNotificationCenter.remove(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsVerticalMenuMainVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
            if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byTextCor(JobsLabelColor)
                    .byText(@"竖形菜单选择功能".jobsTr())
                    .byFont(UIFontWeightSemiboldSize(18));
            })
            // 使用原则：底图有 + 底色有 = 优先使用底图数据
            // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
            // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;/// self.gk_navBackgroundImage 和 self.bgImageView
            .byBgCor(JobsVerticalMenuMainBgCor())
            .byNavBgCor(JobsSystemBackgroundColor);/// self.gk_navBackgroundColor 和 self.view.backgroundColor
            //    self.viewModel.navBgImage = @"导航栏左侧底图".img;
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsVerticalMenuMainVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
            [super viewDidLoad];
            self.view.byBgColor(JobsSystemBackgroundColor);
            self.makeNavByAlpha(1);
        //    [self.bgImageView removeFromSuperview];
            self.tableView.byShow(self);
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsVerticalMenuMainVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
            [super viewWillAppear:animated];
        //    self.updateStatusBarCor(JobsOrangeColor);/// 在具体子类实现，不要写在父类
    };
}

-(void)viewWillLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsVerticalMenuMainVC.class, @selector(jobsViewWillLayoutSubviews)))(self, @selector(jobsViewWillLayoutSubviews));
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsVerticalMenuMainVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsVerticalMenuMainVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsVerticalMenuMainVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
            [super viewWillDisappear:animated];
        //    self.restoreStatusBarCor(nil);
    };
}

-(void)viewDidDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsVerticalMenuMainVC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
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

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
}
#pragma mark —— private
-(JobsRetJobsBaseTableViewCellByVoidBlock _Nonnull)jobs_makeMenuCell{
    @jobs_weakify(self)
    return ^JobsBaseTableViewCell *{
        @jobs_strongify(self)
        if (!self) return nil;
        JobsBaseTableViewCell *cell = JobsBaseTableViewCell.cellStyleValue1ByTableView(self.tableView);
        cell.byOffsetXForEach(JobsVerticalMenuMainCellOffsetX());
        cell.byOffsetYForEach(JobsWidth(0));
        return cell;
    };
}

-(JobsRetViewModelByDecorationModelBlock _Nonnull)jobs_menuModelByDecorationModel{
    @jobs_weakify(self)
    return ^UIViewModel *(JobsDecorationModel * model){
        @jobs_strongify(self)
        if (!self) return nil;
        UIViewModel *viewModel = self.makeDatas(model);
        NSString *subTitle = isNull(model.subTitle) ? @"点击查看".jobsTr() : model.subTitle.jobsTr();
        viewModel
            .byBgCor(JobsSecondarySystemBackgroundColor)
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byAttributedTitle(nil)
                    .byText(model.title.jobsTr())
                    .byFont(UIFontWeightMediumSize(15))
                    .byTextCor(JobsLabelColor);
            })
            .bySubTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byAttributedTitle(nil)
                    .byText(subTitle)
                    .byFont(UIFontWeightMediumSize(13))
                    .byTextCor(JobsSecondaryLabelColor);
            });
        return viewModel;
    };
}

#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataMutArr[indexPath.section][indexPath.row].cls) {
        self.comingToPushVCByRequestParams(self.dataMutArr[indexPath.section][indexPath.row].cls.new,
                                           self.dataMutArr[indexPath.section][indexPath.row]);
    }else @"尚未接入此功能".jobsTr().toast();
}
/// 编辑模式下，点击取消左边已选中的cell的按钮
- (void)tableView:(UITableView *)tableView
didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    JobsRetNSIntegerByUITableViewBlock action = ((JobsRetNSIntegerByUITableViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsVerticalMenuMainVC.class, @selector(jobsNumberOfSectionsInTableView)))(self, @selector(jobsNumberOfSectionsInTableView));
    return action ? action(tableView) : (NSInteger){0};
}

-(JobsRetNSIntegerByUITableViewBlock _Nonnull)jobsNumberOfSectionsInTableView{
    @jobs_weakify(self)
    return ^NSInteger(UITableView * tableView){
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        return self.dataMutArr.count;
    };
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(58);
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr[section].count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.tbvSectionRowCellMutArr[indexPath.section][indexPath.row]
        .JobsRichViewByModel2((self.dataMutArr[indexPath.section][indexPath.row]));;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? JobsWidth(40) : JobsWidth(34);
}

- (CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section{
    return section == self.dataMutArr.count - 1 ? JobsWidth(18) : JobsWidth(12);
}

- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section{
    NSString *title = section == 0 ? @"推荐架构".jobsTr() : @"兼容架构".jobsTr();
    return jobsMakeView(^(__kindof UIView * _Nullable view) {
        view.byBgColor(JobsVerticalMenuMainBgCor());
        jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(title)
                .byFont(UIFontWeightSemiboldSize(13))
                .byTextCor(HEXCOLOR(0x8A6A3E))
                .byTextAlignment(NSTextAlignmentLeft)
                .byNumberOfLines(1)
                .byBgColor(UIColor.clearColor)
                .addOn(view);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(view).offset(JobsVerticalMenuMainCellOffsetX() + JobsWidth(2));
                make.right.equalTo(view).offset(-JobsVerticalMenuMainCellOffsetX());
                make.bottom.equalTo(view).offset(-JobsWidth(6));
            }];
        });
    });
}
- (nullable __kindof UIView *)tableView:(UITableView *)tableView
                 viewForFooterInSection:(NSInteger)section{
    return jobsMakeView(^(__kindof UIView * _Nullable view) {
        view.byBgColor(JobsVerticalMenuMainBgCor());
    });
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.byOffsetXForEach(JobsVerticalMenuMainCellOffsetX());
    cell.byOffsetYForEach(JobsWidth(0));
    cell
        .byContentView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsSecondarySystemBackgroundColor);
        })
        .byTextLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextCor(JobsLabelColor)
                .byFont(UIFontWeightMediumSize(15))
                .byNumberOfLines(1)
                .byLineBreakMode(NSLineBreakByTruncatingTail);
        })
        .byDetailTextLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextCor(HEXCOLOR(0xB0782B))
                .byFont(UIFontWeightMediumSize(13))
                .byTextAlignment(NSTextAlignmentRight)
                .byNumberOfLines(1)
                .byLineBreakMode(NSLineBreakByTruncatingTail);
        })
        .bySelectionStyle(UITableViewCellSelectionStyleDefault)
        .bySelectedBackgroundView(jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(HEXCOLOR(0xFFF4E5));
        }))
        .byBgColor(UIColor.clearColor);
    ((JobsBaseTableViewCell *)cell).byImg(@"向右的箭头（大）".img);
//    @jobs_weakify(self)
    cell.customAccessoryView(^(id data) {
//        @jobs_strongify(self)
        JobsBaseTableViewCell *cell = (JobsBaseTableViewCell *)data;
        JobsLog(@"MMM - %ld",cell.index);
    });
    cell.accessoryView.resetWidth(10);
    [cell roundedCornerFirstAndLastCellByTableView:tableView
                                         indexPath:indexPath
                                       layerConfig:jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable model) {
        model.byRoundingCornersRadii(CGSizeMake(JobsWidth(12.0), JobsWidth(12.0)))
             .byBorderWidth(0.6)
             .byLayerBorderCor(JobsVerticalMenuMainCardBorderCor());
    })];
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView
                .byRegisterTableViewClass(nil)
                .bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .bySeparatorColor(UIColor.clearColor)
                .bySeparatorInset(UIEdgeInsetsMake(0, JobsVerticalMenuMainCellOffsetX(), 0, JobsVerticalMenuMainCellOffsetX()))

                .byMJRefreshHeader([MJRefreshNormalHeader headerWithRefreshingBlock:^{
                    @jobs_strongify(self)
                    NSObject.feedbackGenerator(nil);/// 震动反馈
                    self->_tableView.endRefreshing(YES);
                }].byMJRefreshHeaderConfigModel(self.jobsMjHeaderDefaultConfig()))
                .byMJRefreshFooter([MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                    @jobs_strongify(self)
                    NSObject.feedbackGenerator(nil);/// 震动反馈
                    self->_tableView.endRefreshing(YES);
                }].byMJRefreshFooterConfigModel(self.jobsMjFooterDefaultConfig()))
                .byShowsVerticalScrollIndicator(NO)
                .byScrollEnabled(YES)
                .byContentInset(UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight() + JobsWidth(18), 0))

                .byBgColor(JobsVerticalMenuMainBgCor())
                .addOn(self.view);
            [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.left.right.bottom.equalTo(self.view);
                [self make:make topOffset:0];
            }];
            if(@available(iOS 11.0, *)) {
                tableView.byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever);
            }else{
                SuppressWdeprecatedDeclarationsWarning(self.automaticallyAdjustsScrollViewInsets = NO);
            }
        });
    };return _tableView;
}

-(NSMutableArray<NSMutableArray<__kindof UITableViewCell *> *> *)tbvSectionRowCellMutArr{
    if(!_tbvSectionRowCellMutArr){
        @jobs_weakify(self)
        _tbvSectionRowCellMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            data.add(jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UITableViewCell *>* _Nullable data1) {
                @jobs_strongify(self)
                data1.add(self.jobs_makeMenuCell())
                .add(self.jobs_makeMenuCell());
            }))
            .add(jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UITableViewCell *>*_Nullable data1) {
                @jobs_strongify(self)
                data1.add(self.jobs_makeMenuCell());
            }));
        });
    };return _tbvSectionRowCellMutArr;
}

-(NSMutableArray<NSMutableArray<__kindof UIViewModel *> *> *)dataMutArr{
    if (!_dataMutArr) {
        @jobs_weakify(self)
        _dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data1) {
                @jobs_strongify(self)
                data1.add(self.jobs_menuModelByDecorationModel(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                    model.byTitle(@"UIViewController 架构".jobsTr())
                         .bySubTitle(@"推荐".jobsTr())
                         .byCls(JobsVerticalMenuVC_1.class);
                })))
                .add(self.jobs_menuModelByDecorationModel(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                    model.byTitle(@"UICollectionView 架构".jobsTr())
                         .bySubTitle(@"灵活".jobsTr())
                         .byCls(JobsVerticalMenuVC_2.class);
                })));
            }))
            .add(jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data1) {
                @jobs_strongify(self)
                data1.add(self.jobs_menuModelByDecorationModel(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                    model.byTitle(@"JobsVerticalMenuVC_0".jobsTr())
                         .bySubTitle(@"兼容".jobsTr())
                         .byCls(JobsVerticalMenuVC_0.class);
                })));
            }));
        });
    };return _dataMutArr;
}

@end

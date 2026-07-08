//
//  ExcelVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ExcelVC.h"

@interface ExcelVC ()
/// Data
Prop_strong()NSMutableArray <NSMutableArray <__kindof UITableViewCell *>*>*tbvSectionRowCellMutArr;
Prop_strong()NSMutableArray <NSMutableArray <__kindof UIViewModel *>*>*dataMutArr;

@end

@implementation ExcelVC

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
            data.byTextCor(HEXCOLOR(0x1F2937));
            data.byText(@"Excel".tr);
            data.byFont(UIFontWeightSemiboldSize(18));
        })
    
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;/// self.gk_navBackgroundImage 和 self.bgImageView
        .byBgCor(HEXCOLOR(0xF6F8FB))
        .byNavBgCor(HEXCOLOR(0xF6F8FB));/// self.gk_navBackgroundColor 和 self.view.backgroundColor
        //    self.viewModel.navBgImage = @"导航栏左侧底图".img;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(HEXCOLOR(0xF6F8FB));

    self.makeNavByAlpha(1);
//    [self.bgImageView removeFromSuperview];
    self.tableView.byShow(self);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.updateStatusBarCor(JobsOrangeColor);/// 在具体子类实现，不要写在父类
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
//    self.restoreStatusBarCor(nil);
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
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
    }else @"尚未接入此功能".tr.toast();
}
/// 编辑模式下，点击取消左边已选中的cell的按钮
- (void)tableView:(UITableView *)tableView
didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataMutArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(60);
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr[section].count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsBaseTableViewCell *cell = (JobsBaseTableViewCell *)self.tbvSectionRowCellMutArr[indexPath.section][indexPath.row];
    UIColor *statusCor = [self jobs_excelStatusColorByIndexPath:indexPath];
    cell.byBgColor(JobsWhiteColor);
    return cell
        .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
        .byIndexPath(indexPath)
        .byContentViewBgCor(JobsWhiteColor)
        .bySeparatorInset(UIEdgeInsetsMake(0, JobsWidth(16), 0, JobsWidth(16)))
        .jobsRichElementsTableViewCellBy(self.dataMutArr[indexPath.section][indexPath.row])
        .byTextLabel(^(__kindof UILabel * _Nullable label) {
            NSString *text = label.attributedText.string.length ? label.attributedText.string : label.text;
            label.byText(text ? : @"")
                 .byTextCor(HEXCOLOR(0x172033))
                 .byFont(UIFontWeightMediumSize(16));
        })
        .byDetailTextLabel(^(__kindof UILabel * _Nullable label) {
            NSString *text = label.attributedText.string.length ? label.attributedText.string : label.text;
            label.byText(text ? : @"")
                 .byTextCor(statusCor)
                 .byFont(UIFontWeightMediumSize(14));
        })
        .JobsBlock1(^(id _Nullable data) {;
                     
        });
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? JobsWidth(16) : JobsWidth(18);
}

- (CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section{
    return section == self.dataMutArr.count - 1 ? JobsBottomSafeAreaHeight() + JobsWidth(12) : JobsWidth(6);
}
/// 这里涉及到复用机制，return出去的是UITableViewHeaderFooterView的派生类
/// tableView.registerHeaderFooterViewClass(BaseTableViewHeaderFooterView.class,@"");
- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section{
    if (self.viewModel.usesTableViewHeaderView) {
        @jobs_weakify(self)
        /// 什么不配置就是悬浮
        /// JobsHeaderFooterViewStyleNone 还是悬浮
        /// JobsHeaderViewStyle 不是悬浮
        return BaseTableViewHeaderFooterView.initByReuseIdentifier(tableView,@"")
            .byStyle(JobsHeaderViewStyle)/// 悬浮开关
            .bySection(section)/// 悬浮配置
            .JobsRichViewByModel2(nil)
            .JobsBlock1(^(id _Nullable data) {;
                
            });
    };return nil;
}
/// 这里涉及到复用机制，return出去的是UITableViewHeaderFooterView的派生类
/// tableView.registerHeaderFooterViewClass(BaseTableViewHeaderFooterView.class,@"");
- (nullable __kindof UIView *)tableView:(UITableView *)tableView
                 viewForFooterInSection:(NSInteger)section{
    if(self.viewModel.usesTableViewFooterView){
        @jobs_weakify(self)
        /// 什么不配置就是悬浮
        /// JobsHeaderFooterViewStyleNone 还是悬浮
        /// JobsHeaderViewStyle 不是悬浮
        BaseTableViewHeaderFooterView *tbvFooterView = BaseTableViewHeaderFooterView.initByReuseIdentifier(tableView,@"")
            .byStyle(JobsHeaderViewStyle)/// 悬浮开关
            .bySection(section)/// 悬浮配置
            .JobsRichViewByModel2(nil)
            .JobsBlock1(^(id _Nullable data) {;
                
            });
        tbvFooterView.byBgColor(HEXCOLOR(0xF6F8FB));
        tbvFooterView.backgroundView.byBgColor(HEXCOLOR(0xF6F8FB));
        /// tbvFooterView.backgroundColor 和  tbvFooterView.contentView.backgroundColor 均是无效操作❌
        /// 只有 tbvFooterView.backgroundView.backgroundColor 是有效操作✅
        tbvFooterView.contentView.byBgColor(HEXCOLOR(0xF6F8FB));
        return tbvFooterView;
    };return nil;
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    /// 隐藏最后一个单元格的分界线
    [tableView hideSeparatorLineAtLast:indexPath cell:cell];
    /// 自定义 UITableViewCell 的箭头
    cell.img = @"向右的箭头（小）".img;
//    @jobs_weakify(self)
    [cell customAccessoryView:^(id data) {
//        @jobs_strongify(self)
        JobsBaseTableViewCell *cell = (JobsBaseTableViewCell *)data;
        JobsLog(@"MMM - %ld",cell.index);
    }];
    cell.accessoryView.resetWidth(8);
    /// 以 section 为单位，对首尾 cell 做圆角处理
    [cell roundedCornerFirstAndLastCellByTableView:tableView
                                         indexPath:indexPath
                                       layerConfig:jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable model) {
        model.byRoundingCornersRadii(CGSizeMake(JobsWidth(14.0), JobsWidth(14.0)))
             .byBorderWidth(0.6)
             .byLayerBorderCor(HEXCOLOR(0xE8EDF3));
    })];
}

-(UIColor *)jobs_excelStatusColorByIndexPath:(NSIndexPath *)indexPath{
    UIViewModel *model = self.dataMutArr[indexPath.section][indexPath.row];
    NSString *subTitle = model.subTextModel.attributedTitle.string;
    if (!subTitle.length) subTitle = model.subTextModel.text;
    return [subTitle containsString:@"崩溃"] ? HEXCOLOR(0xC05621) : HEXCOLOR(0x0F766E);
}

#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByInsetGrouped(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView
                .byRegisterTableViewClass(@"")
                .byMJRefreshHeader([MJRefreshNormalHeader headerWithRefreshingBlock:^{
                    @jobs_strongify(self)
                    NSObject.feedbackGenerator(nil);// 震动反馈
                    self->_tableView.endRefreshing(YES);
                }].byMJRefreshHeaderConfigModel(self.mjHeaderDefaultConfig))
                .byMJRefreshFooter([MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                    @jobs_strongify(self)
                    NSObject.feedbackGenerator(nil);// 震动反馈
                    self->_tableView.endRefreshing(YES);
                }].byMJRefreshFooterConfigModel(self.mjFooterDefaultConfig))
                .bySectionHeaderTopPadding(0)
                .bySeparatorColor(HEXCOLOR(0xE8EDF3))
                .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .byShowsVerticalScrollIndicator(NO)
                .byContentInset(UIEdgeInsetsMake(JobsWidth(4), 0, JobsBottomSafeAreaHeight(), 0))
                .byScrollEnabled(YES)
                .byBgColor(HEXCOLOR(0xF6F8FB))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.left.right.bottom.equalTo(self.view);
                    [self make:make topOffset:0];
                });
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
        _tbvSectionRowCellMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <NSMutableArray<__kindof UITableViewCell *> *>* _Nullable data) {
            data.add(jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UITableViewCell *>* _Nullable rowCellMutArr) {
                @jobs_strongify(self)
                rowCellMutArr.add(JobsBaseTableViewCell.cellStyleValue1ByTableView(self.tableView))
                .add(JobsBaseTableViewCell.cellStyleValue1ByTableView(self.tableView))
                .add(JobsBaseTableViewCell.cellStyleValue1ByTableView(self.tableView))
                .add(JobsBaseTableViewCell.cellStyleValue1ByTableView(self.tableView));
            }));
            data.add(jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable rowCellMutArr) {
                @jobs_strongify(self)
                rowCellMutArr.add(JobsBaseTableViewCell.cellStyleValue1ByTableView(self.tableView));
            }));
        });
    };return _tbvSectionRowCellMutArr;
}

-(NSMutableArray<NSMutableArray<__kindof UIViewModel *>*>*)dataMutArr{
    if (!_dataMutArr) {
        @jobs_weakify(self)
        _dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <NSMutableArray<__kindof UIViewModel *> *>*_Nullable data) {
            @jobs_strongify(self)
            data.add(jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIViewModel *>* _Nullable data1) {
                @jobs_strongify(self)
                data1.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                    model.byTitle(@"ZMJClassData".tr)
                         .bySubTitle(@"正常".tr)
                         .byCls(ZMJClassDataVC.class);
                })))
                .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                    model.byTitle(@"ZMJTimeable".tr)
                         .bySubTitle(@"正常".tr)
                         .byCls(ZMJTimeableVC.class);
                })))
                .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                    model.byTitle(@"ZMJSchedule".tr)
                         .bySubTitle(@"正常".tr)
                         .byCls(ZMJScheduleVC.class);
                })))
                .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                    model.byTitle(@"ZMJGanttList".tr)
                         .bySubTitle(@"有崩溃，需要修复".tr)
                         .byCls(ZMJGanttListVC.class);
                })));
            }));
            data.add(jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIViewModel *>* _Nullable data1) {
                @jobs_strongify(self)
                data1.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                    model.byTitle(@"JobsExcel".tr)
                         .bySubTitle(@"JobsExcel".tr)
                         .byCls(JobsExcelVC.class);
                })));
            }));
        });
    };return _dataMutArr;
}

@end

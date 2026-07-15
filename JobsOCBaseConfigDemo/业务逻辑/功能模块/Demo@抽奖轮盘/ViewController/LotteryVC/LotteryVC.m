//
//  LotteryVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "LotteryVC.h"

@interface LotteryVC ()
/// Data
Prop_strong()NSMutableArray <__kindof UITableViewCell *>*tbvSectionRowCellMutArr;
Prop_strong()NSMutableArray <__kindof UIViewModel *>*dataMutArr;

@end

@implementation LotteryVC
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
            data.byTextCor(HEXCOLOR(0x3D4A58));
            data.byText(@"幸运轮盘".tr);
            data.byFont(UIFontWeightRegularSize(18));
        })
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;/// self.gk_navBackgroundImage 和 self.bgImageView
        .byBgCor(HEXCOLOR(0xFFF7EA))
        .byNavBgCor(HEXCOLOR(0xFFF1E2));/// self.gk_navBackgroundColor 和 self.view.backgroundColor
        //    self.viewModel.navBgImage = @"导航栏左侧底图".img;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(HEXCOLOR(0xFFF7EA));
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
    if (self.dataMutArr[indexPath.section].cls) {
        self.comingToPushVCByRequestParams(self.dataMutArr[indexPath.section].cls.new,
                                           self.dataMutArr[indexPath.section]);
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
    return JobsWidth(64);
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.tbvSectionRowCellMutArr[indexPath.section]
        .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
        .byIndexPath(indexPath)
        .jobsRichElementsTableViewCellBy(self.dataMutArr[indexPath.section])
            .JobsBlock1(^(id _Nullable data) {;
            });
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    return section ? JobsWidth(6) : JobsWidth(18);
}

- (CGFloat)tableView:(UITableView *)tableView
heightForFooterInSectionByModel:(NSInteger)section{
    return JobsWidth(0.01);
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
        tbvFooterView.byBgColor(HEXCOLOR(0xEAEBED));
        tbvFooterView.backgroundView.byBgColor(HEXCOLOR(0xEAEBED));
        /// tbvFooterView.backgroundColor 和  tbvFooterView.contentView.backgroundColor 均是无效操作❌
        /// 只有 tbvFooterView.backgroundView.backgroundColor 是有效操作✅
        tbvFooterView.contentView.byBgColor(HEXCOLOR(0xEAEBED));
        return tbvFooterView;
    };return nil;
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView hideSeparatorLineAtLast:indexPath cell:cell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = JobsClearColor;
    cell.contentView.byBgColor(JobsWhiteColor);
    cell.contentView.layer.cornerRadius = JobsWidth(14);
    cell.contentView.layer.masksToBounds = YES;
    cell.contentView.layer.borderWidth = JobsWidth(0.5);
    cell.contentView.layer.borderColor = HEXCOLOR(0xF0DEC2).CGColor;
    cell.textLabel.numberOfLines = 1;
    cell.detailTextLabel.numberOfLines = 1;
    cell.img = @"向右的箭头（小）".img;
    cell.arrows_size = CGSizeMake(JobsWidth(8), JobsWidth(18.3));
//    @jobs_weakify(self)
    [cell customAccessoryView:^(id data) {
//        @jobs_strongify(self)
        JobsBaseTableViewCell *cell = (JobsBaseTableViewCell *)data;
        JobsLog(@"MMM - %ld",cell.index);
    }];
    /// 以 section 为单位，仅对每个 section 的最后一行 cell 做圆角处理（cell 之间没有分割线）
//    [cell roundedCornerLastCellByTableView:tableView
//                                 indexPath:indexPath
//                               layerConfig:jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable model) {
//        model.roundingCornersRadii = CGSizeMake(JobsWidth(10.0), JobsWidth(10.0));
//        model.borderWidth = 1;
//        model.layerBorderCor = JobsGrayColor;
//    })];
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        /// 一般用 initWithStylePlain。initWithStyleGrouped会自己预留一块空间
        @jobs_weakify(self)
        _tableView = self.view.addSubview(jobsMakeTableViewByGrouped(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView.bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .bySeparatorColor(JobsClearColor)
                .registerHeaderFooterViewClass(MSCommentTableHeaderFooterView.class,nil)
                .byContentInset(UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight() + JobsWidth(12), 0))
                .byTableHeaderView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                }))
                .byTableFooterView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                }))
                .emptyDataByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
                    data.byTitle(@"NO MESSAGES FOUND".tr)
                        .byTitleCor(JobsWhiteColor)
                        .byTitleFont(bayonRegular(JobsWidth(30)))
                        .byNormalImage(@"小狮子".img);
                }))
                .byShowsVerticalScrollIndicator(NO)
                .byScrollEnabled(YES)
                .byBgColor(JobsClearColor);
            tableView.clipsToBounds = NO;
            if(@available(iOS 11.0, *)) {
                tableView.byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever);
            }else{
                SuppressWdeprecatedDeclarationsWarning(self.automaticallyAdjustsScrollViewInsets = NO);
            }
        }))
        .addOn(self.view)
        .byAdd(^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.left.equalTo(self.view).offset(JobsWidth(24));
            make.right.equalTo(self.view).offset(-JobsWidth(24));
            make.bottom.equalTo(self.view);
            [self make:make topOffset:10];
        });
    };return _tableView;
}

-(NSMutableArray<__kindof UITableViewCell *> *)tbvSectionRowCellMutArr{
    if(!_tbvSectionRowCellMutArr){
        @jobs_weakify(self)
        _tbvSectionRowCellMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UITableViewCell *>* _Nullable data) {
            @jobs_strongify(self)
            data.add(JobsBaseTableViewCell.cellStyleValue1ByTableView(self.tableView))
            .add(JobsBaseTableViewCell.cellStyleValue1ByTableView(self.tableView));
        });
    };return _tbvSectionRowCellMutArr;
}

-(NSMutableArray<__kindof UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            UIViewModel *squareModel = self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"方形转盘抽奖".tr)
                     .bySubTitle(@"九宫格灯光高亮抽奖".tr)
                     .byCls(LuckyDiskDemoVC.class);
            }));
            squareModel
                .byImage(@"square.grid.3x3.fill".sys_img)
                .byBgCor(JobsWhiteColor);
            squareModel.textModel.byAttributedTitle([self lotteryAttributedString:@"方形转盘抽奖".tr
                                                                              font:UIFontWeightMediumSize(JobsWidth(16))
                                                                             color:HEXCOLOR(0x2F3A47)]);
            squareModel.subTextModel.byAttributedTitle([self lotteryAttributedString:@"九宫格灯光高亮抽奖".tr
                                                                                 font:UIFontWeightRegularSize(JobsWidth(13))
                                                                                color:HEXCOLOR(0x9A6A2E)]);
            data.add(squareModel);
            UIViewModel *wheelModel = self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"圆形抽奖轮盘".tr)
                     .bySubTitle(@"惯性旋转和指针命中".tr)
                     .byCls(LuckyWheelDemoVC.class);
            }));
            wheelModel
                .byImage(@"circle.grid.2x2.fill".sys_img)
                .byBgCor(JobsWhiteColor);
            wheelModel.textModel.byAttributedTitle([self lotteryAttributedString:@"圆形抽奖轮盘".tr
                                                                             font:UIFontWeightMediumSize(JobsWidth(16))
                                                                            color:HEXCOLOR(0x2F3A47)]);
            wheelModel.subTextModel.byAttributedTitle([self lotteryAttributedString:@"惯性旋转和指针命中".tr
                                                                                font:UIFontWeightRegularSize(JobsWidth(13))
                                                                               color:HEXCOLOR(0x9A6A2E)]);
            data.add(wheelModel);
        });
    };return _dataMutArr;
}

-(NSAttributedString *)lotteryAttributedString:(NSString *)text
                                          font:(UIFont *)font
                                         color:(UIColor *)color{
    return [NSAttributedString.alloc initWithString:text ?: @""
                                         attributes:@{
        NSFontAttributeName: font ?: UIFontWeightRegularSize(JobsWidth(14)),
        NSForegroundColorAttributeName: color ?: HEXCOLOR(0x2F3A47)
    }];
}

@end

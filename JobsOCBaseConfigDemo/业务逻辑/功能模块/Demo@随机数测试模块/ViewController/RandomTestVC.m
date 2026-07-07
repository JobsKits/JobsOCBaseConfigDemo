//
//  RandomTestVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "RandomTestVC.h"

static NSString * const RandomTestCellReuseIdentifier = @"RandomTestCellReuseIdentifier";

@interface RandomTestVC ()<UITableViewDelegate,UITableViewDataSource>
/// UI
Prop_strong()UITableView *tableView;
Prop_strong()BaseButton *refreshBtn;
/// Data
Prop_strong()NSMutableArray <UIViewModel *>*dataMutArr;

-(void)setupRightItems;
-(void)reloadRandomResultData;
-(UIViewModel *)randomResultModelWithTitle:(NSString *)title
                                     range:(NSString *)range
                                     value:(int)value;
-(NSString *)randomResultTextByRange:(NSString *)range
                                value:(int)value;
-(NSString *)randomTitleByViewModel:(UIViewModel *)viewModel;
-(NSString *)randomSubTitleByViewModel:(UIViewModel *)viewModel;

@end

@implementation RandomTestVC

@synthesize tableView = _tableView;
@synthesize refreshBtn = _refreshBtn;
@synthesize dataMutArr = _dataMutArr;

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
        //        self.viewModel.textModel.text = @"随机数测试模块点击屏幕进行测试".tr;
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
    self.view.byBgColor(RGBA_COLOR(255, 238, 221, 1));
    [self setupRightItems];
    self.makeNavByAlpha(1);
    [self reloadRandomResultData];
    self.tableView.byAlpha(1);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— 复写父类方法
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches
              withEvent:event];
    [self reloadRandomResultData];
}

#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(78);
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:RandomTestCellReuseIdentifier];
    if (!cell) {
        cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleSubtitle
                                    reuseIdentifier:RandomTestCellReuseIdentifier];
    }
    UIViewModel *model = self.dataMutArr[indexPath.row];
    return cell
        .byTextLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText([self randomTitleByViewModel:model])
                .byFont(UIFontWeightMediumSize(JobsWidth(15)))
                .byTextCor(HEXCOLOR(0x2F3A47))
                .byNumberOfLines(1);
        })
        .byDetailTextLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText([self randomSubTitleByViewModel:model])
                .byFont(UIFontWeightRegularSize(JobsWidth(12)))
                .byTextCor(HEXCOLOR(0x6E7783))
                .byNumberOfLines(2);
        })
        .byAccessoryType(UITableViewCellAccessoryNone)
        .bySelectionStyle(UITableViewCellSelectionStyleDefault)
        .byBgColor(JobsWhiteColor);
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    [self reloadRandomResultData];
}

- (CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

#pragma mark —— Data
-(void)reloadRandomResultData{
    self.dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray<UIViewModel *> * _Nullable data) {
        data
            .add([self randomResultModelWithTitle:@"JobsBaseRandomNoContainBorderValue(20)"
                                            range:@"0 <= n < 20"
                                            value:JobsBaseRandomNoContainBorderValue(20)])
            .add([self randomResultModelWithTitle:@"JobsBaseRandomContainBorderValue(30)"
                                            range:@"0 <= n <= 30"
                                            value:JobsBaseRandomContainBorderValue(30)])
            .add([self randomResultModelWithTitle:@"JobsBaseRandomOffsetValueWithNoContainBorderValue(4, 9)"
                                            range:@"4 <= n < 9"
                                            value:JobsBaseRandomOffsetValueWithNoContainBorderValue(4, 9)])
            .add([self randomResultModelWithTitle:@"JobsBaseRandomOffsetValueWithContainBorderValue(4, 9)"
                                            range:@"4 <= n <= 9"
                                            value:JobsBaseRandomOffsetValueWithContainBorderValue(4, 9)])
            .add([self randomResultModelWithTitle:@"JobsRandomNumber(2, 9)"
                                            range:@"2 <= n <= 9"
                                            value:JobsRandomNumber(2, 9)])
            .add([self randomResultModelWithTitle:@"JobsRandomXY(3, 7)"
                                            range:@"3 <= n <= 7"
                                            value:JobsRandomXY(3, 7)])
            .add([self randomResultModelWithTitle:@"JobsRandom0_100()"
                                            range:@"0 <= n < 100"
                                            value:JobsRandom0_100()])
            .add([self randomResultModelWithTitle:@"JobsRandom0__100()"
                                            range:@"0 <= n <= 100"
                                            value:JobsRandom0__100()])
            .add([self randomResultModelWithTitle:@"JobsRandom100_200()"
                                            range:@"100 <= n < 200"
                                            value:JobsRandom100_200()])
            .add([self randomResultModelWithTitle:@"JobsRandom100__200()"
                                            range:@"100 <= n <= 200"
                                            value:JobsRandom100__200()]);
    });
    [self.tableView reloadData];
}

-(UIViewModel *)randomResultModelWithTitle:(NSString *)title
                                     range:(NSString *)range
                                     value:(int)value{
    return jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
        data.textModel.byText(title.tr);
        data.subTextModel.byText([self randomResultTextByRange:range
                                                         value:value]);
    });
}

-(NSString *)randomResultTextByRange:(NSString *)range
                                value:(int)value{
    return [NSString stringWithFormat:@"%@   %@：%d",range.tr,@"结果".tr,value];
}

-(NSString *)randomTitleByViewModel:(UIViewModel *)viewModel{
    return viewModel.textModel.attributedTitle.string ?: viewModel.textModel.text ?: @"";
}

-(NSString *)randomSubTitleByViewModel:(UIViewModel *)viewModel{
    return viewModel.subTextModel.attributedTitle.string ?: viewModel.subTextModel.text ?: @"";
}

#pragma mark —— LazyLoad
-(void)setupRightItems{
    self.rightBarButtonItems = jobsMakeMutArr(^(__kindof NSMutableArray<UIBarButtonItem *> * _Nullable data) {
        data.add(self.refreshBtn.bySize(CGSizeMake(JobsWidth(58), JobsWidth(32))).barBtnItem);
    });
}

-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByInsetGrouped(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView
                .byDataSource(self)
                .byDelegate(self)
                .byRowHeight(JobsWidth(78))
                .byEstimatedRowHeight(JobsWidth(78))
                .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .byTableFooterView(UIView.new)
                .byShowsVerticalScrollIndicator(NO)
                .byBgColor(JobsClearColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                    make.left.right.bottom.equalTo(self.view);
                });
            if (@available(iOS 11.0, *)) {
                tableView.byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever);
            }else{
                SuppressWdeprecatedDeclarationsWarning(self.automaticallyAdjustsScrollViewInsets = NO);
            }
        });
    };return _tableView;
}

-(BaseButton *)refreshBtn{
    if (!_refreshBtn) {
        @jobs_weakify(self)
        _refreshBtn = BaseButton
            .initByStyle1(@"刷新".tr,
                          UIFontWeightMediumSize(14),
                          HEXCOLOR(0x2F3A46))
            .bgColorBy(JobsClearColor)
            .cornerRadiusValueBy(0)
            .jobsResetBtnLayerBorderWidth(0)
            .onClickBy(^(UIButton *x) {
                @jobs_strongify(self)
                [self reloadRandomResultData];
            })
            .makeBtnTitleByShowingType(UILabelShowingType_03);
    };return _refreshBtn;
}

@end

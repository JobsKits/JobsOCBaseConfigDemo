//
//  TestLabelVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TestLabelVC.h"
#import "TestLabelDetailVC.h"
#import "TestLabelDemoModel.h"

static NSString * const TestLabelListCellReuseIdentifier = @"TestLabelListCellReuseIdentifier";

@interface TestLabelVC ()<UITableViewDelegate,UITableViewDataSource>

Prop_strong()UITableView *tableView;
Prop_copy()NSArray <NSArray <TestLabelDemoModel *>*>*dataArr;
Prop_copy()NSArray <NSString *>*sectionTitleArr;

@end

@implementation TestLabelVC
@synthesize tableView = _tableView;
@synthesize dataArr = _dataArr;
@synthesize sectionTitleArr = _sectionTitleArr;

- (void)dealloc{
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
            data.byText(@"Label 表现列表".tr);
            data.byFont(UIFontWeightRegularSize(16));
        })
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(RGBA_COLOR(255, 238, 221, 1));
    self.makeNavByAlpha(1);
    self.tableView.byAlpha(1);
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return [self dataArrBySection:section].count;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(74);
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TestLabelListCellReuseIdentifier];
    if (!cell) {
        cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleSubtitle
                                    reuseIdentifier:TestLabelListCellReuseIdentifier];
        cell.backgroundColor = JobsWhiteColor;
    }
    TestLabelDemoModel *model = [self dataArrBySection:indexPath.section][indexPath.row];
    return cell
        .byTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(model.title)
                .byFont(UIFontWeightMediumSize(JobsWidth(15)))
                .byTextCor(HEXCOLOR(0x2F3A47))
                .byNumberOfLines(1);
        })
        .byDetailTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(model.subTitle)
                .byFont(UIFontWeightRegularSize(JobsWidth(12)))
                .byTextCor(HEXCOLOR(0x6E7783))
                .byNumberOfLines(2);
        })
        .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
        .bySelectionStyle(UITableViewCellSelectionStyleDefault);
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TestLabelDemoModel *model = [self dataArrBySection:indexPath.section][indexPath.row];
    [self forceComingToPushVC:TestLabelDetailVC.new
                requestParams:model];
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    return JobsWidth(34);
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section{
    if (section >= self.sectionTitleArr.count) return @"";
    return self.sectionTitleArr[section];
}

- (CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
#pragma mark —— Data
-(NSArray<TestLabelDemoModel *> *)dataArrBySection:(NSInteger)section{
    if (section >= self.dataArr.count) return @[];
    return self.dataArr[section];
}

-(TestLabelDemoModel *)demoModelWithTitle:(NSString *)title
                                 subTitle:(NSString *)subTitle
                           detailSubTitle:(NSString *)detailSubTitle
                              showingType:(UILabelShowingType)showingType
                              controlType:(TestLabelDemoControlType)controlType
                                 richText:(BOOL)richText
                            manualNewline:(BOOL)manualNewline{
    TestLabelDemoModel *model = [TestLabelDemoModel modelWithTitle:title
                                                          subTitle:subTitle
                                                       showingType:showingType
                                                       controlType:controlType
                                                          richText:richText
                                                     manualNewline:manualNewline];
    NSString *controlTitle = controlType == TestLabelDemoControlTypeButtonTitle ? @"UIButton.titleLabel".tr : @"BaseLabel".tr;
    model.detailTitle = controlTitle.add(JobsNewline).add(title);
    model.detailSubTitle = detailSubTitle;
    return model;
}

-(TestLabelDemoModel *)scrollLabelDemoModel{
    TestLabelDemoModel *model = [self demoModelWithTitle:@"超长文本滚动".tr
                                                subTitle:@"超出后滚动".tr
                                          detailSubTitle:@"UILabel 分类能力".tr.add(JobsNewline).add(@"文本宽度超过 Label 后，startScrollingIfNeededWithInterval 自动横向滚动".tr)
                                             showingType:UILabelShowingType_01
                                             controlType:TestLabelDemoControlTypeLabel
                                                richText:NO
                                           manualNewline:NO];
    model.scrollLabelDemo = YES;
    return model;
}
#pragma mark —— LazyLoad
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByInsetGrouped(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView
                .byDataSource(self)
                .byDelegate(self)
                .byRowHeight(JobsWidth(74))
                .byEstimatedRowHeight(JobsWidth(74))
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

-(NSArray<NSArray<TestLabelDemoModel *> *> *)dataArr{
    if (!_dataArr) {
        _dataArr = @[
            @[
                [self demoModelWithTitle:@"固定宽高省略".tr
                                 subTitle:@"超出省略".tr
                           detailSubTitle:@"定宽定高定字体".tr.add(JobsNewline).add(@"超出内容以省略号收口".tr)
                              showingType:UILabelShowingType_01
                              controlType:TestLabelDemoControlTypeLabel
                                 richText:NO
                            manualNewline:NO],
                [self demoModelWithTitle:@"AutoScroll 单行滚动".tr
                                 subTitle:@"横向滚动".tr
                           detailSubTitle:@"定宽定高".tr.add(JobsNewline).add(@"超出内容由 AutoScroll 横向滚动展示".tr)
                              showingType:UILabelShowingType_02
                              controlType:TestLabelDemoControlTypeLabel
                                 richText:NO
                            manualNewline:NO],
                self.scrollLabelDemoModel,
                [self demoModelWithTitle:@"宽度自适应".tr
                                 subTitle:@"定高不定宽".tr
                           detailSubTitle:@"定高不定宽".tr.add(JobsNewline).add(@"按文字真实宽度撑开".tr)
                              showingType:UILabelShowingType_03
                              controlType:TestLabelDemoControlTypeLabel
                                 richText:NO
                            manualNewline:NO],
                [self demoModelWithTitle:@"缩小字号全展示".tr
                                 subTitle:@"自动缩小字号".tr
                           detailSubTitle:@"定宽定高".tr.add(JobsNewline).add(@"通过缩小字号尽量展示完整内容".tr)
                              showingType:UILabelShowingType_04
                              controlType:TestLabelDemoControlTypeLabel
                                 richText:NO
                            manualNewline:NO],
                [self demoModelWithTitle:@"普通文本自动换行".tr
                                 subTitle:@"自动换行".tr
                           detailSubTitle:@"定宽不定高".tr.add(JobsNewline).add(@"普通文本按宽度自动换行".tr)
                              showingType:UILabelShowingType_05
                              controlType:TestLabelDemoControlTypeLabel
                                 richText:NO
                            manualNewline:NO],
                [self demoModelWithTitle:@"普通文本手动换行".tr
                                 subTitle:@"手动换行符".tr
                           detailSubTitle:@"文本内置换行符".tr.add(JobsNewline).add(@"固定宽度下展示多行".tr)
                              showingType:UILabelShowingType_05
                              controlType:TestLabelDemoControlTypeLabel
                                 richText:NO
                            manualNewline:YES],
                [self demoModelWithTitle:@"富文本手动换行".tr
                                 subTitle:@"富文本分段".tr
                           detailSubTitle:@"富文本分段配置字体、颜色和背景".tr.add(JobsNewline).add(@"按换行符展示多行".tr)
                              showingType:UILabelShowingType_05
                              controlType:TestLabelDemoControlTypeLabel
                                 richText:YES
                            manualNewline:YES]
            ],
            @[
                [self demoModelWithTitle:@"固定宽高省略".tr
                                 subTitle:@"超出省略".tr
                           detailSubTitle:@"按钮标题定宽定高".tr.add(JobsNewline).add(@"超出内容按 Label 规则省略".tr)
                              showingType:UILabelShowingType_01
                              controlType:TestLabelDemoControlTypeButtonTitle
                                 richText:NO
                            manualNewline:NO],
                [self demoModelWithTitle:@"AutoScroll 单行滚动".tr
                                 subTitle:@"横向滚动".tr
                           detailSubTitle:@"按钮标题区域固定".tr.add(JobsNewline).add(@"超出内容横向滚动展示".tr)
                              showingType:UILabelShowingType_02
                              controlType:TestLabelDemoControlTypeButtonTitle
                                 richText:NO
                            manualNewline:NO],
                [self demoModelWithTitle:@"宽度自适应".tr
                                 subTitle:@"按内容撑开".tr
                           detailSubTitle:@"按钮标题按内容宽度自适应".tr.add(JobsNewline).add(@"保持单行显示".tr)
                              showingType:UILabelShowingType_03
                              controlType:TestLabelDemoControlTypeButtonTitle
                                 richText:NO
                            manualNewline:NO],
                [self demoModelWithTitle:@"缩小字号全展示".tr
                                 subTitle:@"自动缩小字号".tr
                           detailSubTitle:@"按钮标题固定宽高".tr.add(JobsNewline).add(@"通过缩小字号尽量展示完整内容".tr)
                              showingType:UILabelShowingType_04
                              controlType:TestLabelDemoControlTypeButtonTitle
                                 richText:NO
                            manualNewline:NO],
                [self demoModelWithTitle:@"普通文本自动换行".tr
                                 subTitle:@"自动换行".tr
                           detailSubTitle:@"按钮 titleLabel 开启多行".tr.add(JobsNewline).add(@"普通文本按宽度自动换行".tr)
                              showingType:UILabelShowingType_05
                              controlType:TestLabelDemoControlTypeButtonTitle
                                 richText:NO
                            manualNewline:NO],
                [self demoModelWithTitle:@"普通文本手动换行".tr
                                 subTitle:@"手动换行符".tr
                           detailSubTitle:@"按钮标题内置换行符".tr.add(JobsNewline).add(@"固定宽度下展示多行".tr)
                              showingType:UILabelShowingType_05
                              controlType:TestLabelDemoControlTypeButtonTitle
                                 richText:NO
                            manualNewline:YES],
                [self demoModelWithTitle:@"富文本手动换行".tr
                                 subTitle:@"富文本分段".tr
                           detailSubTitle:@"按钮富文本标题分段配置样式".tr.add(JobsNewline).add(@"按换行符展示多行".tr)
                              showingType:UILabelShowingType_05
                              controlType:TestLabelDemoControlTypeButtonTitle
                                 richText:YES
                            manualNewline:YES]
            ]
        ];
    };return _dataArr;
}

-(NSArray<NSString *> *)sectionTitleArr{
    if (!_sectionTitleArr) {
        _sectionTitleArr = @[
            @"BaseLabel".tr,
            @"UIButton.titleLabel".tr
        ];
    };return _sectionTitleArr;
}

@end

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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TestLabelVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                    .byText(@"Label 表现列表".jobsTr())
                    .byFont(UIFontWeightRegularSize(16));
            })
            .byBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgImage(@"导航栏左侧底图".img);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TestLabelVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
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
        self.tableView.byAlpha(1);
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    JobsRetNSIntegerByUITableViewBlock action = ((JobsRetNSIntegerByUITableViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TestLabelVC.class, @selector(jobsNumberOfSectionsInTableView)))(self, @selector(jobsNumberOfSectionsInTableView));
    return action ? action(tableView) : (NSInteger){0};
}

-(JobsRetNSIntegerByUITableViewBlock _Nonnull)jobsNumberOfSectionsInTableView{
    @jobs_weakify(self)
    return ^NSInteger(UITableView * tableView){
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        return self.dataArr.count;
    };
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataArrBySection(section).count;
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
        cell.byBgColor(JobsSecondarySystemBackgroundColor);
    }
    TestLabelDemoModel *model = self.dataArrBySection(indexPath.section)[indexPath.row];
    return cell
        .byTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(model.title)
                .byFont(UIFontWeightMediumSize(JobsWidth(15)))
                .byTextCor(JobsLabelColor)
                .byNumberOfLines(1);
        })
        .byDetailTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(model.subTitle)
                .byFont(UIFontWeightRegularSize(JobsWidth(12)))
                .byTextCor(JobsSecondaryLabelColor)
                .byNumberOfLines(2);
        })
        .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
        .bySelectionStyle(UITableViewCellSelectionStyleDefault);
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TestLabelDemoModel *model = self.dataArrBySection(indexPath.section)[indexPath.row];
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

- (void)tableView:(UITableView *)tableView
willDisplayHeaderView:(UIView *)view
       forSection:(NSInteger)section{
    if (![view isKindOfClass:UITableViewHeaderFooterView.class]) return;
    UILabel *titleLab = ((UITableViewHeaderFooterView *)view).textLabel;
    titleLab.byTextCor(JobsLabelColor);
}

- (CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
#pragma mark —— Data
-(JobsRetNSArrayTestLabelDemoModelByNSIntegerBlock _Nonnull)dataArrBySection{
    @jobs_weakify(self)
    return ^NSArray<TestLabelDemoModel *> *(NSInteger section){
        @jobs_strongify(self)
        if (!self) return nil;
        if (section >= self.dataArr.count) return @[];
        return self.dataArr[section];
    };
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
    NSString *controlTitle = controlType == TestLabelDemoControlTypeButtonTitle ? @"UIButton.titleLabel".jobsTr() : @"BaseLabel".jobsTr();
    model.byDetailTitle(controlTitle.add(JobsNewline).add(title));
    model.byDetailSubTitle(detailSubTitle);
    return model;
}

-(JobsRetTestLabelDemoModelByVoidBlock _Nonnull)scrollLabelDemoModel{
    @jobs_weakify(self)
    return ^TestLabelDemoModel *{
        @jobs_strongify(self)
        if (!self) return nil;
        TestLabelDemoModel *model = [self demoModelWithTitle:@"超长文本滚动".jobsTr()
                                                    subTitle:@"超出后滚动".jobsTr()
                                              detailSubTitle:@"UILabel 分类能力".jobsTr().add(JobsNewline).add(@"文本宽度超过 Label 后，startScrollingIfNeededWithInterval 自动横向滚动".jobsTr())
                                                 showingType:UILabelShowingType_01
                                                 controlType:TestLabelDemoControlTypeLabel
                                                    richText:NO
                                               manualNewline:NO];
        model.byScrollLabelDemo(YES);
        return model;
    };
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
                .byTableFooterView(jobsMakeView(^(__kindof UIView * _Nullable view) {}))
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
                [self demoModelWithTitle:@"固定宽高省略".jobsTr()
                                 subTitle:@"超出省略".jobsTr()
                           detailSubTitle:@"定宽定高定字体".jobsTr().add(JobsNewline).add(@"超出内容以省略号收口".jobsTr())
                              showingType:UILabelShowingType_01
                              controlType:TestLabelDemoControlTypeLabel
                                 richText:NO
                            manualNewline:NO],
                [self demoModelWithTitle:@"AutoScroll 单行滚动".jobsTr()
                                 subTitle:@"横向滚动".jobsTr()
                           detailSubTitle:@"定宽定高".jobsTr().add(JobsNewline).add(@"超出内容由 AutoScroll 横向滚动展示".jobsTr())
                              showingType:UILabelShowingType_02
                              controlType:TestLabelDemoControlTypeLabel
                                 richText:NO
                            manualNewline:NO],
                self.scrollLabelDemoModel(),
                [self demoModelWithTitle:@"宽度自适应".jobsTr()
                                 subTitle:@"定高不定宽".jobsTr()
                           detailSubTitle:@"定高不定宽".jobsTr().add(JobsNewline).add(@"按文字真实宽度撑开".jobsTr())
                              showingType:UILabelShowingType_03
                              controlType:TestLabelDemoControlTypeLabel
                                 richText:NO
                            manualNewline:NO],
                [self demoModelWithTitle:@"缩小字号全展示".jobsTr()
                                 subTitle:@"自动缩小字号".jobsTr()
                           detailSubTitle:@"定宽定高".jobsTr().add(JobsNewline).add(@"通过缩小字号尽量展示完整内容".jobsTr())
                              showingType:UILabelShowingType_04
                              controlType:TestLabelDemoControlTypeLabel
                                 richText:NO
                            manualNewline:NO],
                [self demoModelWithTitle:@"普通文本自动换行".jobsTr()
                                 subTitle:@"自动换行".jobsTr()
                           detailSubTitle:@"定宽不定高".jobsTr().add(JobsNewline).add(@"普通文本按宽度自动换行".jobsTr())
                              showingType:UILabelShowingType_05
                              controlType:TestLabelDemoControlTypeLabel
                                 richText:NO
                            manualNewline:NO],
                [self demoModelWithTitle:@"普通文本手动换行".jobsTr()
                                 subTitle:@"手动换行符".jobsTr()
                           detailSubTitle:@"文本内置换行符".jobsTr().add(JobsNewline).add(@"固定宽度下展示多行".jobsTr())
                              showingType:UILabelShowingType_05
                              controlType:TestLabelDemoControlTypeLabel
                                 richText:NO
                            manualNewline:YES],
                [self demoModelWithTitle:@"富文本手动换行".jobsTr()
                                 subTitle:@"富文本分段".jobsTr()
                           detailSubTitle:@"富文本分段配置字体、颜色和背景".jobsTr().add(JobsNewline).add(@"按换行符展示多行".jobsTr())
                              showingType:UILabelShowingType_05
                              controlType:TestLabelDemoControlTypeLabel
                                 richText:YES
                            manualNewline:YES]
            ],
            @[
                [self demoModelWithTitle:@"固定宽高省略".jobsTr()
                                 subTitle:@"超出省略".jobsTr()
                           detailSubTitle:@"按钮标题定宽定高".jobsTr().add(JobsNewline).add(@"超出内容按 Label 规则省略".jobsTr())
                              showingType:UILabelShowingType_01
                              controlType:TestLabelDemoControlTypeButtonTitle
                                 richText:NO
                            manualNewline:NO],
                [self demoModelWithTitle:@"AutoScroll 单行滚动".jobsTr()
                                 subTitle:@"横向滚动".jobsTr()
                           detailSubTitle:@"按钮标题区域固定".jobsTr().add(JobsNewline).add(@"超出内容横向滚动展示".jobsTr())
                              showingType:UILabelShowingType_02
                              controlType:TestLabelDemoControlTypeButtonTitle
                                 richText:NO
                            manualNewline:NO],
                [self demoModelWithTitle:@"宽度自适应".jobsTr()
                                 subTitle:@"按内容撑开".jobsTr()
                           detailSubTitle:@"按钮标题按内容宽度自适应".jobsTr().add(JobsNewline).add(@"保持单行显示".jobsTr())
                              showingType:UILabelShowingType_03
                              controlType:TestLabelDemoControlTypeButtonTitle
                                 richText:NO
                            manualNewline:NO],
                [self demoModelWithTitle:@"缩小字号全展示".jobsTr()
                                 subTitle:@"自动缩小字号".jobsTr()
                           detailSubTitle:@"按钮标题固定宽高".jobsTr().add(JobsNewline).add(@"通过缩小字号尽量展示完整内容".jobsTr())
                              showingType:UILabelShowingType_04
                              controlType:TestLabelDemoControlTypeButtonTitle
                                 richText:NO
                            manualNewline:NO],
                [self demoModelWithTitle:@"普通文本自动换行".jobsTr()
                                 subTitle:@"自动换行".jobsTr()
                           detailSubTitle:@"按钮 titleLabel 开启多行".jobsTr().add(JobsNewline).add(@"普通文本按宽度自动换行".jobsTr())
                              showingType:UILabelShowingType_05
                              controlType:TestLabelDemoControlTypeButtonTitle
                                 richText:NO
                            manualNewline:NO],
                [self demoModelWithTitle:@"普通文本手动换行".jobsTr()
                                 subTitle:@"手动换行符".jobsTr()
                           detailSubTitle:@"按钮标题内置换行符".jobsTr().add(JobsNewline).add(@"固定宽度下展示多行".jobsTr())
                              showingType:UILabelShowingType_05
                              controlType:TestLabelDemoControlTypeButtonTitle
                                 richText:NO
                            manualNewline:YES],
                [self demoModelWithTitle:@"富文本手动换行".jobsTr()
                                 subTitle:@"富文本分段".jobsTr()
                           detailSubTitle:@"按钮富文本标题分段配置样式".jobsTr().add(JobsNewline).add(@"按换行符展示多行".jobsTr())
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
            @"BaseLabel".jobsTr(),
            @"UIButton.titleLabel".jobsTr()
        ];
    };return _sectionTitleArr;
}

@end

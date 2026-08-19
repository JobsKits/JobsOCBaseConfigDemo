//
//  JobsOCExcelDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import "JobsOCExcelDemoVC.h"

static NSString *const JobsOCExcelDemoCellReuseIdentifier = @"JobsOCExcelDemoCell";

@interface JobsOCExcelDemoVC ()

Prop_strong()UITableView *excelTableView;
Prop_copy()NSArray<NSDictionary<NSString *, id> *> *sheets;

-(NSArray<JobsOCExcelColumn *> *)columnsWithTitles:(NSArray<NSString *> *)titles
                                            widths:(NSArray<NSNumber *> *)widths;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCExcelDemoVC
@interface JobsOCExcelDemoVC (JobsPropertyDSLSetterAutogen_1c416cd166)
-(void)setFd_interactivePopMaxAllowedInitialDistanceToLeftEdge:(CGFloat)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCExcelDemoVC

@implementation JobsOCExcelDemoVC
-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCExcelDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        self.bySetupNavigationBarHidden(YES);
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"JobsOCExcel".jobsTr())
                    .byFont(UIFontWeightRegularSize(18));
            })
            .byBgCor(UIColor.systemGroupedBackgroundColor)
            .byNavBgCor(UIColor.systemBackgroundColor);
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCExcelDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.byGKMaxPopDistance(24);
        self.byFd_interactivePopMaxAllowedInitialDistanceToLeftEdge(24);
        self.makeNavByAlpha(1);
        self.view.byBgColor(UIColor.systemGroupedBackgroundColor);
        self.excelTableView.byAlpha(1);
    };
}

-(NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.sheets.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsOCExcelDemoCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsOCExcelDemoCellReuseIdentifier
                                                                forIndexPath:indexPath];
    NSDictionary<NSString *, id> *sheet = self.sheets[indexPath.row];
    [cell configureWithTitle:sheet[@"title"]
                     columns:sheet[@"columns"]
                        rows:sheet[@"rows"]
         freezeThroughColumn:[sheet[@"freezeThroughColumn"] integerValue]
                    delegate:self];
    return cell;
}

-(void)excelView:(JobsOCExcelView *)excelView
   didSelectCell:(JobsOCExcelCellContext *)context{
    JobsLog(@"JobsOCExcel selected row=%ld column=%ld value=%@",
            (long)context.row,
            (long)context.column,
            context.value);
}

#pragma mark —— lazyLoad
-(NSArray<JobsOCExcelColumn *> *)columnsWithTitles:(NSArray<NSString *> *)titles
                                            widths:(NSArray<NSNumber *> *)widths{
    NSMutableArray<JobsOCExcelColumn *> *columns = NSMutableArray.array;
    [titles enumerateObjectsUsingBlock:^(NSString *title, NSUInteger index, BOOL *stop) {
        CGFloat width = index < widths.count ? widths[index].doubleValue : 0;
        [columns addObject:[JobsOCExcelColumn columnWithTitle:title
                                                       width:width]];
    }];return columns.copy;
}

-(UITableView *)excelTableView{
    if (!_excelTableView) {
        _excelTableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            [tableView registerClass:JobsOCExcelDemoCell.class
              forCellReuseIdentifier:JobsOCExcelDemoCellReuseIdentifier];
            tableView.byDataSource(self)
                .byDelegate(self)
                .bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .byRowHeight(UITableViewAutomaticDimension)
                .byEstimatedRowHeight(JobsWidth(320))
                .byBgColor(UIColor.systemGroupedBackgroundColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                    make.left.right.bottom.equalTo(self.view);
                });
        });
    };return _excelTableView;
}

-(NSArray<NSDictionary<NSString *,id> *> *)sheets{
    if (!_sheets) {
        _sheets = @[
            @{
                @"title": @"季度销售数据｜冻结第 0 列，右侧月份横向拖动",
                @"columns": [self columnsWithTitles:@[@"城市", @"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月"]
                                                widths:@[@104, @112, @112, @112, @112, @112, @112, @112, @112]],
                @"freezeThroughColumn": @0,
                @"rows": @[
                    JobsOCExcelRow.rowWithValues(@[@"深圳", @"128", @"146", @"158", @"171", @"189", @"203", @"218", @"236"]),
                    JobsOCExcelRow.rowWithValues(@[@"上海", @"116", @"134", @"149", @"163", @"177", @"195", @"210", @"229"]),
                    JobsOCExcelRow.rowWithValues(@[@"北京", @"109", @"121", @"138", @"152", @"168", @"181", @"199", @"214"]),
                    JobsOCExcelRow.rowWithValues(@[@"成都", @"93", @"105", @"117", @"126", @"142", @"156", @"173", @"188"])
                ]
            },
            @{
                @"title": @"Office 式冻结｜冻结第 1 列时，第 0、1 列一起固定",
                @"columns": [self columnsWithTitles:@[@"域", @"服务", @"可用率", @"P50", @"P95", @"P99", @"QPS", @"错误率", @"负责人"]
                                                widths:@[@104, @132, @104, @104, @104, @104, @104, @104, @104]],
                @"freezeThroughColumn": @1,
                @"rows": @[
                    JobsOCExcelRow.rowWithValues(@[@"用户", @"用户中心", @"99.99%", @"32ms", @"88ms", @"142ms", @"860", @"0.02%", @"Jobs"]),
                    JobsOCExcelRow.rowWithValues(@[@"交易", @"订单中心", @"99.95%", @"45ms", @"121ms", @"206ms", @"620", @"0.08%", @"Jobs"]),
                    JobsOCExcelRow.rowWithValues(@[@"交易", @"支付网关", @"99.98%", @"51ms", @"136ms", @"248ms", @"540", @"0.03%", @"Jobs"])
                ]
            },
            @{
                @"title": @"四种固定格展示｜缩放、单行省略、多行省略、滚动",
                @"columns": [self columnsWithTitles:@[@"模式", @"固定宽度内容区"]
                                                widths:@[@108, @176]],
                @"freezeThroughColumn": @0,
                @"rows": @[
                    JobsOCExcelRow.rowWithCells(@[
                        JobsOCExcelCell.cellWithText(@"缩小字体"),
                        [JobsOCExcelCell cellWithText:@"内容很长时自动缩小字号直到尽量完整显示"
                                     textDisplayMode:JobsLabelTextDisplayModeScaleToFit]
                    ]),
                    JobsOCExcelRow.rowWithCells(@[
                        JobsOCExcelCell.cellWithText(@"单行省略"),
                        [JobsOCExcelCell cellWithText:@"不缩小字号，保持一行，超出后在尾部显示省略号"
                                     textDisplayMode:JobsLabelTextDisplayModeSingleLineTailTruncation]
                    ]),
                    JobsOCExcelRow.rowWithCells(@[
                        JobsOCExcelCell.cellWithText(@"多行省略"),
                        [JobsOCExcelCell cellWithText:@"不缩小字号，允许两行显示；两行仍放不下时，最后一行尾部使用省略号"
                                     textDisplayMode:JobsLabelTextDisplayModeMultiLineTailTruncation]
                    ]),
                    JobsOCExcelRow.rowWithCells(@[
                        JobsOCExcelCell.cellWithText(@"滚动展示"),
                        [JobsOCExcelCell cellWithText:@"UILabel+Scrolling 使用 CoreText 完整滚动展示这一段超长文字"
                                     textDisplayMode:JobsLabelTextDisplayModeScrolling]
                    ])
                ]
            }
        ];
    };return _sheets;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCExcelDemoVC
-(JobsRetJobsOCExcelDemoVCByCGFloatBlock _Nonnull)byFd_interactivePopMaxAllowedInitialDistanceToLeftEdge{
    @jobs_weakify(self)
    return ^__kindof JobsOCExcelDemoVC * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setFd_interactivePopMaxAllowedInitialDistanceToLeftEdge:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCExcelDemoVC
@end

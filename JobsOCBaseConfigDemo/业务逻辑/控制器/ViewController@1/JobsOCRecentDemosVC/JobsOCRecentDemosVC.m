//
//  JobsOCRecentDemosVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年11月15日，星期日.
//

#import "JobsOCRecentDemosVC.h"

@interface JobsOCRecentDemosVC ()

Prop_strong()UITableView *recentTableView;
Prop_strong()UIButton *emptyButton;
Prop_copy()NSArray<UIViewModel *> *entries;
Prop_copy()JobsOCRecentEntriesProvider entriesProvider;
Prop_copy()jobsByViewModelBlock selection;

-(jobsByVoidBlock _Nonnull)reloadRecentEntries;
-(JobsRetUIButtonModelByVoidBlock _Nonnull)emptyButtonModel;

@end

@implementation JobsOCRecentDemosVC

-(instancetype)initWithEntriesProvider:(JobsOCRecentEntriesProvider)provider
                             selection:(jobsByViewModelBlock)selection{
    if (self = [super init]) {
        _entriesProvider = [provider copy];
        _selection = [selection copy];
        _entries = @[];
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.recentTableView.byAlpha(1);
    self.emptyButton.byAlpha(1);
    @jobs_weakify(self)
    [self addNotificationName:语言切换 block:^(id _Nullable weakSelf, id _Nullable arg) {
        @jobs_strongify(self)
        self.reloadRecentEntries();
    }];
    [self addNotificationName:JobsThemeDidChangeNotification block:^(id _Nullable weakSelf, id _Nullable arg) {
        @jobs_strongify(self)
        self.reloadRecentEntries();
    }];
    self.reloadRecentEntries();
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.reloadRecentEntries();
}

-(jobsByVoidBlock _Nonnull)reloadRecentEntries{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self || !self.isViewLoaded) {
            return;
        }
        self->_entries = self.entriesProvider ? self.entriesProvider() : @[];
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.byGKNavTitle(@"最近使用".jobsTr());
        self.recentTableView.bySeparatorColor(JobsSeparatorColor);
        self.emptyButton.resetByButtonModel(self.emptyButtonModel(), NO).byTintColor(JobsSecondaryLabelColor);
        self.emptyButton.byHidden(self.entries.count > 0);
        [self.recentTableView reloadData];
    };
}

-(UITableView *)recentTableView{
    if (!_recentTableView) {
        _recentTableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            [tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"JobsOCRecentDemoCell"];
            tableView
                .byDelegate(self)
                .byDataSource(self)
                .byRowHeight(UITableViewAutomaticDimension)
                .byEstimatedRowHeight(64)
                .byTableFooterView(jobsMakeView(^(UIView *view) {
                    view.byBgColor(JobsClearColor);
                }))
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byBgColor(JobsClearColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.bottom.equalTo(self.view);
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                });
        });
    }
    return _recentTableView;
}

-(UIButton *)emptyButton{
    if (!_emptyButton) {
        _emptyButton = UIButton.initByButtonModel(self.emptyButtonModel())
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.center.equalTo(self.recentTableView);
                make.left.equalTo(self.recentTableView).offset(24);
                make.right.equalTo(self.recentTableView).offset(-24);
                make.height.mas_greaterThanOrEqualTo(160);
            });
#if DEBUG
        _emptyButton.accessibilityIdentifier = @"jobs.coverage.recent.empty.reload";
#endif
    }
    return _emptyButton;
}

-(JobsRetUIButtonModelByVoidBlock _Nonnull)emptyButtonModel{
    @jobs_weakify(self)
    return ^UIButtonModel *{
        @jobs_strongify(self)
        return jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable model) {
            model
                .byTitle(@"尚无浏览记录".jobsTr())
                .byTitleCor(JobsLabelColor)
                .byTitleFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(22)])
                .byTitleLineBreakMode(NSLineBreakByWordWrapping)
                .byTextAlignment(NSTextAlignmentCenter)
                .bySubTitle(@"轻点重新加载".jobsTr())
                .bySubTitleCor(JobsSecondaryLabelColor)
                .bySubTitleFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(16)])
                .bySubtitleLineBreakMode(NSLineBreakByWordWrapping)
                .bySubTextAlignment(NSTextAlignmentCenter)
                .byNormalImage(@"clock.arrow.circlepath".sys_img)
                .byImagePlacement(NSDirectionalRectEdgeTop)
                .byImagePadding(16)
                .byBaseBackgroundColor(JobsClearColor)
                .byClickEventBlock(^id(id _Nullable data) {
                    @jobs_strongify(self)
                    self.reloadRecentEntries();
                    return nil;
                });
        });
    };
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.entries.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JobsOCRecentDemoCell" forIndexPath:indexPath];
    UIViewModel *entry = self.entries[indexPath.row];
    return cell
        .byTextLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(entry.textModel.attributedTitle.string ?: entry.textModel.text ?: @"")
                .byTextCor(JobsLabelColor)
                .byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(17)])
                .byNumberOfLines(0);
        })
        .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
        .byBgColor(JobsSystemBackgroundColor);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.selection && indexPath.row < (NSInteger)self.entries.count) {
        self.selection(self.entries[indexPath.row]);
    }
}

@end

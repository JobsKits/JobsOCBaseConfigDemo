//
//  JobsOCSearcherDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月5日，星期日.
//

#import "JobsOCSearcherDemoVC.h"

NS_INLINE NSArray <NSString *>*_Nonnull JobsOCSearcherRecommendTextArr(void){
    return @[
        @"Java",
        @"Python",
        @"Objective-C",
        @"Swift",
        @"iOS",
        @"UIKit",
        @"Masonry",
        @"JobsOCSearcher"
    ];
}

@interface JobsOCSearcherDemoVC ()
<
UITableViewDelegate,
UITableViewDataSource
>

Prop_strong()JobsOCSearcherView *searchView;
Prop_strong()UITableView *resultsTableView;
Prop_copy()NSArray <NSString *> *matchingTerms;
Prop_copy()NSString *selectedTerm;

-(jobsByStrBlock _Nonnull)filterResults;
-(jobsByVoidBlock _Nonnull)refreshSearchAppearance;

-(JobsRetJobsOCSearcherConfigByVoidBlock _Nonnull)demoSearchConfig;

@end

@implementation JobsOCSearcherDemoVC

/// Preserve the shared navigation theme binding while removing this component Demo's local theme trigger.
-(jobsByVoidBlock _Nonnull)jobs_ensureDemoThemeButton{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self)
            return;
        [super jobs_ensureDemoThemeButton]();
        self.byGKNavRightBarButtonItem(nil)
            .byGKNavRightBarButtonItems(nil);
        self.navigationItem.byRightBarButtonItem(nil)
            .byRightBarButtonItems(nil);
    };
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSearcherDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                    .byText(@"JobsOCSearcher".jobsTr())
                    .byFont(UIFontWeightRegularSize(18));
            })
            .byBgCor(JobsSystemBackgroundColor)
            .byNavBgCor(JobsSystemBackgroundColor);
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSearcherDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.makeNavByAlpha(1);
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.searchView.byAlpha(1);
        [self addNotificationName:语言切换 block:^(id weakSelf, id arg) {
            @jobs_strongify(self)
            self.refreshSearchAppearance();
        }];
        [self addNotificationName:JobsThemeDidChangeNotification block:^(id weakSelf, id arg) {
            @jobs_strongify(self)
            self.refreshSearchAppearance();
        }];
    };
}

-(JobsRetJobsOCSearcherConfigByVoidBlock _Nonnull)demoSearchConfig{
    @jobs_weakify(self)
    return ^JobsOCSearcherConfig *{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsOCSearcherConfig.defaultConfig()
            .byPlaceholder(@"请输入搜索关键词".jobsTr())
            .byRecommendTitle(@"搜索推荐".jobsTr())
            .byHistoryTitle(@"搜索历史".jobsTr())
            .byHistoryStorageKey(@"JobsOCSearcherDemoSearchConfirmHistoryData")
            .byShowsCancelButton(YES)
            .byPageBackgroundColor(JobsSystemBackgroundColor)
            .byInputBackgroundColor(JobsSecondarySystemBackgroundColor)
            .byTextColor(JobsLabelColor)
            .bySecondaryTextColor(JobsLabelColor.colorWithAlphaComponentBy(0.7))
            .byAccentColor(JobsThemeCenter.shared.darkMode ? HEXCOLOR(0x8BC4EB) : HEXCOLOR(0x195E83))
            .bySearchTextDidChangeBlock(^(NSString *query) {
                @jobs_strongify(self)
                self.filterResults(query);
            });
    };
}
#pragma mark —— LazyLoad
-(JobsOCSearcherView *)searchView{
    if (!_searchView) {
        _searchView = [JobsOCSearcherView.alloc initWithConfig:self.demoSearchConfig()];
        _searchView.byOverrideUserInterfaceStyle(JobsThemeCenter.shared.darkMode ? UIUserInterfaceStyleDark : UIUserInterfaceStyleLight);
        _searchView.byRecommendSearches(JobsOCSearcherRecommendTextArr())
            .byResultContentView(self.resultsTableView)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(12));
                make.left.right.equalTo(self.view);
                make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            });
        for (UIView *view in _searchView.subviews) {
            if (![view isKindOfClass:UIButton.class] ||
                ![view.accessibilityIdentifier isEqualToString:@"jobs.searcher.cancel"]) {
                continue;
            }
            UIButton *button = (UIButton *)view;
            JobsOCCoveragePrepareLongPressButton(button, @"jobs.searcher.cancel");
            button.onLongPressGestureAppendBy(^(UIButton *sender) {
                JobsOCCoverageLongPressDelivered(sender);
                JobsLog(@"");
            });
            break;
        }
    }
    return _searchView;
}


-(jobsByVoidBlock _Nonnull)refreshSearchAppearance{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self)
            return;
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.searchView.byOverrideUserInterfaceStyle(JobsThemeCenter.shared.darkMode ? UIUserInterfaceStyleDark : UIUserInterfaceStyleLight);
        self.searchView.reloadWithConfig(self.demoSearchConfig());
        self.filterResults(self.searchView.normalizedQuery);
    };
}

-(jobsByStrBlock _Nonnull)filterResults{
    @jobs_weakify(self)
    return ^(NSString *query) {
        @jobs_strongify(self)
        if (!self)
            return;
        NSMutableArray <NSString *> *matches = jobsMakeMutArr(nil);
        for (NSString *term in JobsOCSearcherRecommendTextArr()) {
            if (query.length && [term rangeOfString:query options:NSCaseInsensitiveSearch | NSDiacriticInsensitiveSearch].location != NSNotFound) {
                [matches addObject:term];
            }
        }
        self->_matchingTerms = matches.copy;
        [self.resultsTableView reloadData];
        if (self->_searchView)
            self->_searchView.byResultCount(matches.count);
    };
}

-(UITableView *)resultsTableView{
    if (!_resultsTableView) {
        _resultsTableView = jobsMakeTableViewByPlain(^(__kindof UITableView *table) {
            table.byDelegate(self)
                .byDataSource(self)
                .byRowHeight(UITableViewAutomaticDimension)
                .byEstimatedRowHeight(88)
                .byTableFooterView(jobsMakeView(^(__kindof UIView *view) {}))
                .byKeyboardDismissMode(UIScrollViewKeyboardDismissModeOnDrag)
                .byBgColor(JobsClearColor)
                .byAccessibilityIdentifier(@"jobs.searcher.results");
        });
        [_resultsTableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"JobsSearcherTerm"];
    }
    return _resultsTableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.matchingTerms.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray <NSString *> *descriptions = @[
        @"Java 是运行在 Java 虚拟机上的编程语言。".jobsTr(),
        @"Python 是常用于脚本、自动化和数据处理的编程语言。".jobsTr(),
        @"Objective-C 是支持消息发送和运行时机制的编程语言。".jobsTr(),
        @"Swift 是 Apple 平台应用开发使用的编程语言。".jobsTr(),
        @"iOS 是 iPhone 使用的操作系统。".jobsTr(),
        @"UIKit 提供窗口、视图、控件和页面导航等原生界面能力。".jobsTr(),
        @"Masonry 是基于 Auto Layout 的 Objective-C 布局库。".jobsTr(),
        @"JobsOCSearcher 统一管理输入、推荐词、搜索历史和结果区域。".jobsTr()
    ];
    NSString *term = self.matchingTerms[indexPath.row];
    NSUInteger index = [JobsOCSearcherRecommendTextArr() indexOfObject:term];
    NSString *detail = index < descriptions.count ? descriptions[index] : @"";
    NSMutableAttributedString *text = JobsMutAttributedStringByAttributes([NSString stringWithFormat:@"%@\n%@", term, detail],
        @{NSFontAttributeName:UIFontWeightRegularSize(15), NSForegroundColorAttributeName:JobsLabelColor.colorWithAlphaComponentBy(0.7)});
    [text addAttributes:@{NSFontAttributeName:UIFontWeightSemiboldSize(17), NSForegroundColorAttributeName:JobsLabelColor}
                  range:NSMakeRange(0, term.length)];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JobsSearcherTerm" forIndexPath:indexPath];
    return cell.byTextLabel(^(UILabel *label) {
        label.byAttributedText(text).byNumberOfLines(0);
    })
        .byAccessoryType([self.selectedTerm isEqualToString:term] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone)
        .byBgColor(JobsSystemBackgroundColor)
        .byAccessibilityIdentifier([@"jobs.searcher.result." stringByAppendingString:term]);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self->_selectedTerm = self.matchingTerms[indexPath.row];
    self.searchView.saveHistoryByText(self.searchView.normalizedQuery);
    self.searchView.dismissKeyboard();
    [tableView reloadData];
}

@end

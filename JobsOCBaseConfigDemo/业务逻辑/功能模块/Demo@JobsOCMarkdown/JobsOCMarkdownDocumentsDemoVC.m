//
//  JobsOCMarkdownDocumentsDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月30日，星期四.
//  Copyright © 2026 Jobs. All rights reserved.
//

#import "JobsOCMarkdownDocumentsDemoVC.h"

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

static NSString *const JobsOCMarkdownDocumentCellReuseIdentifier = @"JobsOCMarkdownDocumentCell";

@interface JobsOCMarkdownDocumentCell : UITableViewCell

-(instancetype)byDocument:(JobsOCMarkdownDocument *)document;
-(instancetype)byErrorMessage:(NSString *)message;

@end

@interface JobsOCMarkdownDocumentDemoVC : BaseViewController <JobsOCMarkdownViewDelegate>

Prop_strong()JobsOCMarkdownDocument *document;
Prop_strong()JobsOCMarkdownCatalog *catalog;
Prop_copy(nullable)NSString *initialAnchor;
Prop_strong()JobsOCMarkdownView *markdownView;

-(instancetype)initWithDocument:(JobsOCMarkdownDocument *)document
                         catalog:(JobsOCMarkdownCatalog *)catalog;
-(instancetype)initWithDocument:(JobsOCMarkdownDocument *)document
                         catalog:(JobsOCMarkdownCatalog *)catalog
                   initialAnchor:(nullable NSString *)initialAnchor;

@end

@interface JobsOCMarkdownDocumentsDemoVC ()
<
UITableViewDataSource,
UITableViewDelegate,
UISearchBarDelegate
>

Prop_strong()JobsOCMarkdownCatalog *catalog;
Prop_copy()NSArray <JobsOCMarkdownDocument *>*allDocuments;
Prop_copy()NSArray <JobsOCMarkdownDocument *>*visibleDocuments;
Prop_strong(nullable)NSError *catalogError;
Prop_strong()UISearchBar *searchBar;
Prop_strong()UITableView *documentTableView;

-(void)jobsLoadCatalog;
-(void)jobsApplySearch:(NSString *)query;

@end

@implementation JobsOCMarkdownDocumentsDemoVC

-(void)loadView{
    [super loadView];
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data
                .byText(@"Markdown 文档浏览器".tr)
                .byFont(UIFontWeightRegularSize(18));
        })
        .byBgCor(JobsSystemGroupedBackgroundColor)
        .byNavBgCor(JobsSystemBackgroundColor);
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.byBgColor(JobsSystemGroupedBackgroundColor);
    self.makeNavByAlpha(1);
    [self jobsLoadCatalog];
    self.searchBar.byAlpha(1);
    self.documentTableView.byAlpha(1);
}
#pragma mark —— UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.catalogError ? 1 : self.visibleDocuments.count;
}

-(__kindof UITableViewCell *)tableView:(UITableView *)tableView
                 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsOCMarkdownDocumentCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsOCMarkdownDocumentCellReuseIdentifier
                                                                       forIndexPath:indexPath];
    if (self.catalogError) {
        return [cell byErrorMessage:self.catalogError.localizedDescription];
    };return [cell byDocument:self.visibleDocuments[indexPath.row]];
}
#pragma mark —— UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(68);
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.catalogError || indexPath.row >= self.visibleDocuments.count) return;
    JobsOCMarkdownDocumentDemoVC *reader = [[JobsOCMarkdownDocumentDemoVC alloc]
                                            initWithDocument:self.visibleDocuments[indexPath.row]
                                            catalog:self.catalog];
    [self.navigationController pushViewController:reader animated:YES];
}
#pragma mark —— UISearchBarDelegate
-(void)searchBar:(UISearchBar *)searchBar
   textDidChange:(NSString *)searchText{
    [self jobsApplySearch:searchText];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
}
#pragma mark —— lazyLoad
-(UISearchBar *)searchBar{
    if (!_searchBar) {
        _searchBar = jobsMakeUISearchBar(^(__kindof UISearchBar * _Nullable searchBar) {
            searchBar
                .byPlaceholder(@"按标题或工程相对路径搜索".tr)
                .byDelegate(self)
                .byShowsCancelButton(NO)
                .bySearchBarStyle(UISearchBarStyleMinimal)
                .byTranslucent(YES)
                .byBackgroundImage(jobsMakeImage())
                .byBarTintColor(JobsSystemBackgroundColor)
                .byBgColor(JobsSystemBackgroundColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                    make.left.right.equalTo(self.view);
                    make.height.mas_equalTo(JobsWidth(56));
                });
        });
    };return _searchBar;
}

-(UITableView *)documentTableView{
    if (!_documentTableView) {
        _documentTableView = jobsMakeTableViewByInsetGrouped(^(__kindof UITableView * _Nullable tableView) {
            [tableView registerClass:JobsOCMarkdownDocumentCell.class
               forCellReuseIdentifier:JobsOCMarkdownDocumentCellReuseIdentifier];
            tableView
                .byDelegate(self)
                .byDataSource(self)
                .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .byRowHeight(JobsWidth(68))
                .byEstimatedRowHeight(0)
                .byEstimatedSectionHeaderHeight(0)
                .byEstimatedSectionFooterHeight(0)
                .bySectionHeaderTopPadding(0)
                .byContentInset(UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0))
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byBgColor(JobsSystemGroupedBackgroundColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.searchBar.mas_bottom);
                    make.left.right.bottom.equalTo(self.view);
                });
        });
    };return _documentTableView;
}
#pragma mark —— 一些私有方法
-(void)jobsLoadCatalog{
    NSError *error = nil;
    self.catalog = [JobsOCMarkdownCatalog bundledCatalogWithError:&error];
    self.catalogError = error;
    self.allDocuments = [self.catalog.documents sortedArrayUsingComparator:^NSComparisonResult(JobsOCMarkdownDocument * _Nonnull obj1,
                                                                                                JobsOCMarkdownDocument * _Nonnull obj2) {
        return [obj1.relativePath localizedStandardCompare:obj2.relativePath];
    }] ?: @[];
    self.visibleDocuments = self.allDocuments;
    [self.documentTableView reloadData];
}

-(void)jobsApplySearch:(NSString *)query{
    NSString *keyword = [query stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
    if (!keyword.length) {
        self.visibleDocuments = self.allDocuments;
    }else{
        NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(JobsOCMarkdownDocument *document,
                                                                       NSDictionary<NSString *,id> *bindings) {
            return [document.title localizedCaseInsensitiveContainsString:keyword]
                || [document.relativePath localizedCaseInsensitiveContainsString:keyword];
        }];
        self.visibleDocuments = [self.allDocuments filteredArrayUsingPredicate:predicate];
    }
    [self.documentTableView reloadData];
}

@end

@implementation JobsOCMarkdownDocumentCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:UITableViewCellStyleSubtitle
                    reuseIdentifier:reuseIdentifier]) {
        self.bySelectedBackgroundView(jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsTertiarySystemBackgroundColor);
        }));
    };return self;
}

-(instancetype)byDocument:(JobsOCMarkdownDocument *)document{
    self
        .byTextLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(document.title)
                .byTextCor(JobsLabelColor)
                .byFont(UIFontWeightRegularSize(16))
                .byNumberOfLines(1);
        })
        .byDetailTextLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(document.relativePath)
                .byTextCor(JobsSecondaryLabelColor)
                .byFont(UIFontWeightRegularSize(12))
                .byNumberOfLines(2);
        })
        .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
        .bySelectionStyle(UITableViewCellSelectionStyleDefault)
        .byContentView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsClearColor);
        })
        .byBgColor(JobsSystemBackgroundColor);
    return self;
}

-(instancetype)byErrorMessage:(NSString *)message{
    self
        .byTextLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"无法读取 Markdown 文档".tr)
                .byTextCor(UIColor.systemRedColor)
                .byFont(UIFontWeightRegularSize(16));
        })
        .byDetailTextLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(message)
                .byTextCor(JobsSecondaryLabelColor)
                .byFont(UIFontWeightRegularSize(12))
                .byNumberOfLines(0);
        })
        .byAccessoryType(UITableViewCellAccessoryNone)
        .bySelectionStyle(UITableViewCellSelectionStyleNone)
        .byContentView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsClearColor);
        })
        .byBgColor(JobsSystemBackgroundColor);
    return self;
}

@end

@implementation JobsOCMarkdownDocumentDemoVC

-(instancetype)initWithDocument:(JobsOCMarkdownDocument *)document
                         catalog:(JobsOCMarkdownCatalog *)catalog{
    return [self initWithDocument:document catalog:catalog initialAnchor:nil];
}

-(instancetype)initWithDocument:(JobsOCMarkdownDocument *)document
                         catalog:(JobsOCMarkdownCatalog *)catalog
                   initialAnchor:(nullable NSString *)initialAnchor{
    if (self = [super init]) {
        self.document = document;
        self.catalog = catalog;
        self.initialAnchor = initialAnchor;
        NSString *title = document.title.length ? document.title : @"Markdown";
        self.title = title;
        self.viewModel.byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data
                .byText(title)
                .byFont(UIFontWeightRegularSize(18));
        });
    };return self;
}

-(void)loadView{
    [super loadView];
    NSString *title = self.document.title ?: @"Markdown";
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data
                .byText(title)
                .byFont(UIFontWeightRegularSize(18));
        })
        .byBgCor(JobsSystemBackgroundColor)
        .byNavBgCor(JobsSystemBackgroundColor);
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.byBgColor(JobsSystemBackgroundColor);
    self.makeNavByAlpha(1);
    self.byGKNavTitle(self.document.title.length ? self.document.title : @"Markdown");
    self.markdownView.delegate = self;
    [self.markdownView loadDocument:self.document];
}
#pragma mark —— JobsOCMarkdownViewDelegate
-(void)markdownViewDidFinishRendering:(JobsOCMarkdownView *)markdownView{
    if (!self.initialAnchor.length) return;
    [markdownView scrollToAnchor:self.initialAnchor animated:NO];
}

-(void)markdownView:(JobsOCMarkdownView *)markdownView
  didRequestOpenURL:(NSURL *)URL{
    if (URL.isFileURL) {
        NSURLComponents *components = [NSURLComponents componentsWithURL:URL resolvingAgainstBaseURL:NO];
        NSString *anchor = components.fragment;
        components.fragment = nil;
        JobsOCMarkdownDocument *linkedDocument = [self.catalog documentWithFileURL:components.URL];
        if (linkedDocument) {
            if ([linkedDocument.identifier isEqualToString:self.document.identifier] && anchor.length) {
                [markdownView scrollToAnchor:anchor animated:YES];
            }else{
                JobsOCMarkdownDocumentDemoVC *reader = [[JobsOCMarkdownDocumentDemoVC alloc]
                                                        initWithDocument:linkedDocument
                                                        catalog:self.catalog
                                                        initialAnchor:anchor];
                [self.navigationController pushViewController:reader animated:YES];
            }
        };return;
    }
    [UIApplication.sharedApplication openURL:URL
                                     options:@{}
                           completionHandler:nil];
}

-(void)markdownView:(JobsOCMarkdownView *)markdownView
   didFailWithError:(NSError *)error{
    error.localizedDescription.toast();
}
#pragma mark —— lazyLoad
-(JobsOCMarkdownView *)markdownView{
    if (!_markdownView) {
        _markdownView = JobsOCMarkdownView.new;
        _markdownView
            .byBgColor(JobsSystemBackgroundColor)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.gk_navigationBar.mas_bottom);
                make.left.right.bottom.equalTo(self.view);
            });
    };return _markdownView;
}

@end

//
//  JobsOCMarkdownDocumentsDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月30日，星期四.
//  Copyright © 2026 Jobs. All rights reserved.
//

#import "JobsOCMarkdownDocumentsDemoVC.h"

static NSString *const JobsOCMarkdownDocumentCellReuseIdentifier = @"JobsOCMarkdownDocumentCell";

@interface JobsOCMarkdownDocumentCell : UITableViewCell

-(JobsRetIDByJobsOCMarkdownDocumentBlock _Nonnull)byDocument;
-(JobsRetIDByStrBlock _Nonnull)byErrorMessage;

@end

@interface JobsOCMarkdownDocumentDemoVC : BaseViewController <JobsOCMarkdownViewDelegate>

Prop_strong()JobsOCMarkdownDocument *document;
Prop_strong()JobsOCMarkdownCatalog *catalog;
Prop_copy(nullable)NSString *initialAnchor;
Prop_strong()JobsOCMarkdownView *markdownView;

-(JobsRetJobsOCMarkdownDocumentDemoVCByDocumentBlock _Nonnull)byDocument;
-(JobsRetJobsOCMarkdownDocumentDemoVCByCatalogBlock _Nonnull)byCatalog;
-(JobsRetJobsOCMarkdownDocumentDemoVCByStrBlock _Nonnull)byInitialAnchor;

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

-(jobsByVoidBlock _Nonnull)jobsLoadCatalog;
-(jobsByStrBlock _Nonnull)jobsApplySearch;
-(JobsRetJobsOCMarkdownDocumentsDemoVCByCatalogBlock _Nonnull)byCatalog;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCMarkdownDocumentsDemoVC
@interface JobsOCMarkdownDocumentsDemoVC (JobsPropertyDSLSetterAutogen_cb95e2fa19)
-(void)setCatalogError:(NSError * _Nullable)data;
-(void)setVisibleDocuments:(NSArray <JobsOCMarkdownDocument *>* _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCMarkdownDocumentsDemoVC

@implementation JobsOCMarkdownDocumentsDemoVC

-(JobsRetJobsOCMarkdownDocumentsDemoVCByCatalogBlock _Nonnull)byCatalog{
    @jobs_weakify(self)
    return ^__kindof JobsOCMarkdownDocumentsDemoVC *_Nullable(JobsOCMarkdownCatalog *_Nullable catalog){
        @jobs_strongify(self)
        if (!self) return nil;
        self.catalog = catalog;
        return self;
    };
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCMarkdownDocumentsDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byText(@"Markdown 文档浏览器".jobsTr())
                    .byFont(UIFontWeightRegularSize(18));
            })
            .byBgCor(JobsSystemGroupedBackgroundColor)
            .byNavBgCor(JobsSystemBackgroundColor);
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCMarkdownDocumentsDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.view.byBgColor(JobsSystemGroupedBackgroundColor);
        self.makeNavByAlpha(1);
        self.jobsLoadCatalog();
        self.searchBar.byAlpha(1);
        self.documentTableView.byAlpha(1);
    };
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
        return cell.byErrorMessage(self.catalogError.localizedDescription);
    };return cell.byDocument(self.visibleDocuments[indexPath.row]);
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
    (((jobsByStrBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCMarkdownDocumentsDemoVC.class, @selector(jobsApplySearch)))(self, @selector(jobsApplySearch)))(searchText);
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    ((((jobsByUISearchBarBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCMarkdownDocumentsDemoVC.class, @selector(searchBarSearchButtonClicked)))(self, @selector(searchBarSearchButtonClicked))))(searchBar);
}
-(jobsByUISearchBarBlock _Nonnull)searchBarSearchButtonClicked{
    @jobs_weakify(self)
    return ^(UISearchBar * searchBar){
        @jobs_strongify(self)
        if (!self) return;
        searchBar.resignFirstResponder;
    };
}
#pragma mark —— lazyLoad
-(UISearchBar *)searchBar{
    if (!_searchBar) {
        _searchBar = jobsMakeUISearchBar(^(__kindof UISearchBar * _Nullable searchBar) {
            searchBar
                .byPlaceholder(@"按标题或工程相对路径搜索".jobsTr())
                .byDelegate(self)
                .byShowsCancelButton(NO)
                .bySearchBarStyle(UISearchBarStyleMinimal)
                .byTranslucent(YES)
                .byBackgroundImage(jobsMakeImage(^(UIImage *object){}))
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
-(jobsByVoidBlock _Nonnull)jobsLoadCatalog{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSError *error = nil;
        self.byCatalog(JobsOCMarkdownCatalog.bundledCatalogWithError(&error));
        self.byCatalogError(error);
        self.allDocuments = [self.catalog.documents sortedArrayUsingComparator:^NSComparisonResult(JobsOCMarkdownDocument * _Nonnull obj1,
                                                                                                    JobsOCMarkdownDocument * _Nonnull obj2) {
            return [obj1.relativePath localizedStandardCompare:obj2.relativePath];
        }] ?: @[];
        self.byVisibleDocuments(self.allDocuments);
        [self.documentTableView reloadData];
    };
}

-(jobsByStrBlock _Nonnull)jobsApplySearch{
    @jobs_weakify(self)
    return ^(NSString * query){
        @jobs_strongify(self)
        if (!self) return;
        NSString *keyword = [query stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
        if (!keyword.length) {
            self.byVisibleDocuments(self.allDocuments);
        }else{
            NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(JobsOCMarkdownDocument *document,
                                                                           NSDictionary<NSString *,id> *bindings) {
                return [document.title localizedCaseInsensitiveContainsString:keyword]
                    || [document.relativePath localizedCaseInsensitiveContainsString:keyword];
            }];
            self.byVisibleDocuments([self.allDocuments filteredArrayUsingPredicate:predicate]);
        }
        [self.documentTableView reloadData];
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCMarkdownDocumentsDemoVC
-(JobsRetJobsOCMarkdownDocumentsDemoVCByNSArrayJobsOCMarkdownDocumentBlock _Nonnull)byVisibleDocuments{
    @jobs_weakify(self)
    return ^__kindof JobsOCMarkdownDocumentsDemoVC * _Nullable(NSArray <JobsOCMarkdownDocument *>* _Nullable data){
        @jobs_strongify(self)
        [self setVisibleDocuments:data];
        return self;
    };
}

-(JobsRetJobsOCMarkdownDocumentsDemoVCByNSErrorBlock _Nonnull)byCatalogError{
    @jobs_weakify(self)
    return ^__kindof JobsOCMarkdownDocumentsDemoVC * _Nullable(NSError * _Nullable data){
        @jobs_strongify(self)
        [self setCatalogError:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCMarkdownDocumentsDemoVC
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

-(JobsRetIDByJobsOCMarkdownDocumentBlock _Nonnull)byDocument{
    @jobs_weakify(self)
    return ^id(JobsOCMarkdownDocument * document){
        @jobs_strongify(self)
        if (!self) return nil;
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
    };
}

-(JobsRetIDByStrBlock _Nonnull)byErrorMessage{
    @jobs_weakify(self)
    return ^id(NSString * message){
        @jobs_strongify(self)
        if (!self) return nil;
        self
            .byTextLabel(^(__kindof UILabel * _Nullable label) {
                label
                    .byText(@"无法读取 Markdown 文档".jobsTr())
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
    };
}

@end

@implementation JobsOCMarkdownDocumentDemoVC

-(JobsRetJobsOCMarkdownDocumentDemoVCByDocumentBlock _Nonnull)byDocument{
    @jobs_weakify(self)
    return ^__kindof JobsOCMarkdownDocumentDemoVC *_Nullable(JobsOCMarkdownDocument *_Nullable document){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setDocument:document];
        return self;
    };
}

-(JobsRetJobsOCMarkdownDocumentDemoVCByCatalogBlock _Nonnull)byCatalog{
    @jobs_weakify(self)
    return ^__kindof JobsOCMarkdownDocumentDemoVC *_Nullable(JobsOCMarkdownCatalog *_Nullable catalog){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setCatalog:catalog];
        return self;
    };
}

-(JobsRetJobsOCMarkdownDocumentDemoVCByStrBlock _Nonnull)byInitialAnchor{
    @jobs_weakify(self)
    return ^__kindof JobsOCMarkdownDocumentDemoVC *_Nullable(NSString *_Nullable string){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setInitialAnchor:string];
        return self;
    };
}


-(instancetype)initWithDocument:(JobsOCMarkdownDocument *)document
                         catalog:(JobsOCMarkdownCatalog *)catalog{
    return [self initWithDocument:document catalog:catalog initialAnchor:nil];
}

-(instancetype)initWithDocument:(JobsOCMarkdownDocument *)document
                         catalog:(JobsOCMarkdownCatalog *)catalog
                   initialAnchor:(nullable NSString *)initialAnchor{
    if (self = [super init]) {
        self.byDocument(document).byCatalog(catalog).byInitialAnchor(initialAnchor);
        NSString *title = document.title.length ? document.title : @"Markdown";
        self.byTitle(title);
        self.viewModel.byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data
                .byText(title)
                .byFont(UIFontWeightRegularSize(18));
        });
    };return self;
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCMarkdownDocumentDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        NSString *title = self.document.title ?: @"Markdown";
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byText(title)
                    .byFont(UIFontWeightRegularSize(18));
            })
            .byBgCor(JobsSystemBackgroundColor)
            .byNavBgCor(JobsSystemBackgroundColor);
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCMarkdownDocumentDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
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
        self.byGKNavTitle(self.document.title.length ? self.document.title : @"Markdown");
        self.markdownView.byDelegate(self).loadDocument(self.document);
    };
}
#pragma mark —— JobsOCMarkdownViewDelegate
-(void)markdownViewDidFinishRendering:(JobsOCMarkdownView *)markdownView{
    jobsByJobsOCMarkdownViewBlock action = ((jobsByJobsOCMarkdownViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCMarkdownDocumentDemoVC.class, @selector(jobsMarkdownViewDidFinishRendering)))(self, @selector(jobsMarkdownViewDidFinishRendering));
    if (action) action(markdownView);
}

-(jobsByJobsOCMarkdownViewBlock _Nonnull)jobsMarkdownViewDidFinishRendering{
    @jobs_weakify(self)
    return ^(JobsOCMarkdownView * markdownView){
        @jobs_strongify(self)
        if (!self) return;
        if (!self.initialAnchor.length) return;
        [markdownView scrollToAnchor:self.initialAnchor animated:NO];
    };
}

-(void)markdownView:(JobsOCMarkdownView *)markdownView
  didRequestOpenURL:(NSURL *)URL{
    if (URL.isFileURL) {
        NSURLComponents *components = [NSURLComponents componentsWithURL:URL resolvingAgainstBaseURL:NO];
        NSString *anchor = components.fragment;
        components.byFragment(nil);
        JobsOCMarkdownDocument *linkedDocument = self.catalog.documentWithFileURL(components.URL);
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

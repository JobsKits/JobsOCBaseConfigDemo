//
//  JobsOCOpenWebViewController.m
//  JobsOCOpen
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "JobsOCOpenWebViewController.h"

#import "NSString+Sys.h"

@interface JobsOCOpenWebViewController ()

Prop_strong() NSURL *url;
Prop_copy(nullable) NSString *pageTitle;
Prop_strong() WKWebView *jobsOCOpenWebView;

-(jobsByVoidBlock _Nonnull)setupNavigationBar;
-(jobsByVoidBlock _Nonnull)handleBack;

@end

@implementation JobsOCOpenWebViewController
-(JobsRetJobsOCOpenWebVCByURLBlock _Nonnull)byURL{
    @jobs_weakify(self)
    return ^__kindof JobsOCOpenWebViewController *_Nullable(NSURL *_Nullable URL){
        @jobs_strongify(self)
        [self setUrl:URL];
        return self;
    };
}

-(JobsRetJobsOCOpenWebVCByStrBlock _Nonnull)byPageTitle{
    @jobs_weakify(self)
    return ^__kindof JobsOCOpenWebViewController *_Nullable(NSString *_Nullable pageTitle){
        @jobs_strongify(self)
        [self setPageTitle:pageTitle];
        return self;
    };
}

-(instancetype)initWithURL:(NSURL *)url
                     title:(NSString *_Nullable)title{
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.byURL(url).byPageTitle(title);
    };return self;
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCOpenWebViewController.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.byTitle(self.pageTitle ?: self.url.host);
        self.setupNavigationBar();
        [self.view addSubview:self.jobsOCOpenWebView];
        [self.jobsOCOpenWebView loadRequest:[NSURLRequest requestWithURL:self.url]];
    };
}

-(void)viewDidLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCOpenWebViewController.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
        CGRect frame = self.view.safeAreaLayoutGuide.layoutFrame;
        CGFloat navigationBarBottom = CGRectGetMaxY(self.gk_navigationBar.frame);
        if (navigationBarBottom > CGRectGetMinY(frame)) {
            CGFloat safeAreaBottom = CGRectGetMaxY(frame);
            frame.origin.y = navigationBarBottom;
            frame.size.height = MAX(0, safeAreaBottom - navigationBarBottom);
        }
        self.jobsOCOpenWebView.byFrame(frame);
    };
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    if (!self.pageTitle.length) self.title = webView.title ?: self.url.host;
}

-(jobsByVoidBlock _Nonnull)setupNavigationBar{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        JobsNavBarConfig *config = jobsMakeNavBarConfig(^(__kindof JobsNavBarConfig *_Nullable config) {
            config.viewModel = jobsMakeViewModel(^(__kindof UIViewModel *_Nullable viewModel) {
                viewModel
                    .byAlpha(1)
                    .byNavBgCor(JobsClearColor);
                viewModel.textModel.byText(self.pageTitle ?: self.url.host ?: @"网页".jobsTr());
            });
            config.backBtn = BaseButton.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel *_Nullable model) {
                model.byNormalImage(@"全局返回箭头".img)
                     .byHighlightImage(@"全局返回箭头".img)
                     .byTitle(@"返回".jobsTr())
                     .byBaseBackgroundColor(JobsClearColor)
                     .byClickEventBlock(^id(__kindof UIButton *_Nullable x) {
                    @jobs_strongify(self)
                    self.handleBack();
                    return nil;
                });
            }));
        });
        self.makeGKNavByConfig(config);
    };
}

-(jobsByVoidBlock _Nonnull)handleBack{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.jobsOCOpenWebView.canGoBack) {
            [self.jobsOCOpenWebView goBack];
            return;
        }
        UINavigationController *navigationController = self.navigationController;
        if (navigationController && navigationController.viewControllers.firstObject != self) {
            [navigationController popViewControllerAnimated:YES];
        } else if (navigationController.presentingViewController) {
            [navigationController dismissViewControllerAnimated:YES completion:nil];
        } else {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    };
}

-(WKWebView *)jobsOCOpenWebView{
    if (!_jobsOCOpenWebView) {
        WKWebViewConfiguration *configuration = jobsMakeWebViewConfiguration(^(WKWebViewConfiguration *object){});
        _jobsOCOpenWebView = [WKWebView.alloc initWithFrame:CGRectZero configuration:configuration]
            .byNavigationDelegate(self)
            .byAllowsBackForwardNavigationGestures(YES)
            .byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    };return _jobsOCOpenWebView;
}

@end

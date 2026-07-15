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

-(void)setupNavigationBar;
-(void)handleBack;

@end

@implementation JobsOCOpenWebViewController
-(instancetype)initWithURL:(NSURL *)url
                     title:(NSString *_Nullable)title{
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.url = url;
        self.pageTitle = title;
    };return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = self.pageTitle ?: self.url.host;
    [self setupNavigationBar];
    [self.view addSubview:self.jobsOCOpenWebView];
    [self.jobsOCOpenWebView loadRequest:[NSURLRequest requestWithURL:self.url]];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    CGRect frame = self.view.safeAreaLayoutGuide.layoutFrame;
    CGFloat navigationBarBottom = CGRectGetMaxY(self.gk_navigationBar.frame);
    if (navigationBarBottom > CGRectGetMinY(frame)) {
        CGFloat safeAreaBottom = CGRectGetMaxY(frame);
        frame.origin.y = navigationBarBottom;
        frame.size.height = MAX(0, safeAreaBottom - navigationBarBottom);
    }
    self.jobsOCOpenWebView.frame = frame;
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    if (!self.pageTitle.length) self.title = webView.title ?: self.url.host;
}

-(void)setupNavigationBar{
    @jobs_weakify(self)
    JobsNavBarConfig *config = jobsMakeNavBarConfig(^(__kindof JobsNavBarConfig *_Nullable config) {
        config.viewModel = jobsMakeViewModel(^(__kindof UIViewModel *_Nullable viewModel) {
            viewModel.Alpha = 1;
            viewModel.byNavBgCor(JobsClearColor);
            viewModel.textModel.byText(self.pageTitle ?: self.url.host ?: @"网页".tr);
        });
        config.backBtn = BaseButton.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel *_Nullable model) {
            model.byNormalImage(@"全局返回箭头".img)
                 .byHighlightImage(@"全局返回箭头".img)
                 .byTitle(@"返回".tr)
                 .byBaseBackgroundColor(JobsClearColor)
                 .byClickEventBlock(^id(__kindof UIButton *_Nullable x) {
                @jobs_strongify(self)
                [self handleBack];
                return nil;
            });
        }));
    });
    self.makeGKNavByConfig(config);
}

-(void)handleBack{
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
}

-(WKWebView *)jobsOCOpenWebView{
    if (!_jobsOCOpenWebView) {
        WKWebViewConfiguration *configuration = WKWebViewConfiguration.new;
        _jobsOCOpenWebView = [WKWebView.alloc initWithFrame:CGRectZero configuration:configuration];
        _jobsOCOpenWebView.navigationDelegate = self;
        _jobsOCOpenWebView.allowsBackForwardNavigationGestures = YES;
        _jobsOCOpenWebView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    };return _jobsOCOpenWebView;
}

@end

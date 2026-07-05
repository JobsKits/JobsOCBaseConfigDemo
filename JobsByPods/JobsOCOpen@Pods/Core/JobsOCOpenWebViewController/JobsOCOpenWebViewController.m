//
//  JobsOCOpenWebViewController.m
//  JobsOCOpen
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "JobsOCOpenWebViewController.h"

@interface JobsOCOpenWebViewController ()

Prop_strong() NSURL *url;
Prop_copy(nullable) NSString *pageTitle;
Prop_strong() WKWebView *jobsOCOpenWebView;

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
    [self.view addSubview:self.jobsOCOpenWebView];
    [self.jobsOCOpenWebView loadRequest:[NSURLRequest requestWithURL:self.url]];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.jobsOCOpenWebView.frame = self.view.safeAreaLayoutGuide.layoutFrame;
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    if (!self.pageTitle.length) self.title = webView.title ?: self.url.host;
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

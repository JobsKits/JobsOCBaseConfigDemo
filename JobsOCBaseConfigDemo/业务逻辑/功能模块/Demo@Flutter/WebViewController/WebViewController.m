//
//  WebViewController.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "WebViewController.h"

@interface WebViewController ()

Prop_copy()NSString *url;
Prop_copy()NSString *titleStr;
Prop_strong()WKWebView *webView;

@end

@implementation WebViewController
- (instancetype)initWithURL:(NSString *)url title:(NSString *)title {
  self = [super init];
  if (self) {
    _url = url;
    _titleStr = title;
  };return self;
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(WebViewController.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.byTitle(self.titleStr);
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
        _webView.addOn(self.view);
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
        [_webView loadRequest:request];
        UIBarButtonItem *closeItem = jobsMakeBarButtonItemByTitle(@"关闭",
                                                                  UIBarButtonItemStylePlain,
                                                                  self,
                                                                  @selector(close),
                                                                  nil);
        self.navigationItem.byLeftBarButtonItem(closeItem);
    };
}

- (void)close {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(WebViewController.class, @selector(jobsClose)))(self, @selector(jobsClose));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsClose{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self dismissViewControllerAnimated:YES completion:nil];
    };
}

@end

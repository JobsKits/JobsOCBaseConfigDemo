//
//  NSObject+HTML.m
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+HTML.h"

@implementation NSObject (HTML)
/// HTML 必要标签
- (JobsRetNSMutableArrayNSStringByVoidBlock _Nonnull)requiredHTMLTags{
    @jobs_weakify(self)
    return ^__kindof NSMutableArray<NSString *> *{
        @jobs_strongify(self)
        if (!self) return nil;
        return jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable arr) {
            arr
                .add(@"<html>").add(@"</html>")
                .add(@"<head>").add(@"</head>")
                .add(@"<body>").add(@"</body>");
        });
    };
}
/// HTML 标签
-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)htmlTags{
    @jobs_weakify(self)
    return ^__kindof NSArray <__kindof NSString *>*{
        @jobs_strongify(self)
        if (!self) return nil;
        @jobs_weakify(self)
        return jobsMakeMutArr(^(__kindof NSMutableArray <__kindof NSString *>*_Nullable arr) {
            @jobs_strongify(self)
            arr
                .addBy(self.requiredHTMLTags())
                .add(@"<div>").add(@"</div>")
                .add(@"<span>").add(@"</span>")
                .add(@"<p>").add(@"</p>")
                .add(@"<a>").add(@"</a>")
                .add(@"<img>")
                .add(@"<ul>").add(@"</ul>")
                .add(@"<ol>").add(@"</ol>")
                .add(@"<li>").add(@"</li>")
                .add(@"<h1>").add(@"</h1>")
                .add(@"<h2>").add(@"</h2>")
                .add(@"<h3>").add(@"</h3>")
                .add(@"<h4>").add(@"</h4>")
                .add(@"<h5>").add(@"</h5>")
                .add(@"<h6>").add(@"</h6>")
                .add(@"<table>").add(@"</table>")
                .add(@"<tr>").add(@"</tr>")
                .add(@"<td>").add(@"</td>")
                .add(@"<th>").add(@"</th>")
                .add(@"<form>").add(@"</form>")
                .add(@"<input>")
                .add(@"<button>").add(@"</button>")
                .add(@"<select>").add(@"</select>")
                .add(@"<option>").add(@"</option>")
                .add(@"<textarea>").add(@"</textarea>")
                .add(@"<link>")
                .add(@"<meta>")
                .add(@"<script>").add(@"</script>")
                .add(@"<style>").add(@"</style>")
                .add(@"<header>").add(@"</header>")
                .add(@"<footer>").add(@"</footer>")
                .add(@"<nav>").add(@"</nav>")
                .add(@"<section>").add(@"</section>")
                .add(@"<article>").add(@"</article>")
                .add(@"<aside>").add(@"</aside>")
                .add(@"<main>").add(@"</main>")
                .add(@"<figure>").add(@"</figure>")
                .add(@"<figcaption>").add(@"</figcaption>")
                .add(@"<blockquote>").add(@"</blockquote>")
                .add(@"<code>").add(@"</code>")
                .add(@"<pre>").add(@"</pre>")
                .add(@"<iframe>").add(@"</iframe>")
                .add(@"<strong>").add(@"</strong>")
                .add(@"<em>").add(@"</em>")
                .add(@"<br>")
                .add(@"<hr>");
        });
    };
}
/// 一个常规的WebView
-(JobsRetWKWebViewByViewModelBlock _Nonnull)makeNormaleWebViewByViewModel{
    @jobs_weakify(self)
    return ^__kindof WKWebView *_Nullable(__kindof UIViewModel *_Nullable viewModel){
        @jobs_strongify(self)
        WKWebView *webView = WKWebView.initBy(jobsMakeWebViewConfiguration(^(__kindof WKWebViewConfiguration * _Nullable config) {
            config.byUserContentController(jobsMakeUserContentController(^(__kindof WKUserContentController * _Nullable data) {
                [data addScriptMessageHandler:self name:viewModel.handlerName]; // handler 名字
            }));
        })).byUrl(viewModel.url)
            .byNavDelegate(self); // 设置代理监听网页加载状态
        /// 从 Objective-C 调用 JavaScript 方法
        [webView evaluateJavaScript:viewModel.evaluateJavaScript
                  completionHandler:viewModel.completionHandlerBlock];
        return webView;
    };
}
#pragma mark —— WKScriptMessageHandler
-(void)userContentController:(WKUserContentController *)userContentController
     didReceiveScriptMessage:(WKScriptMessage *)message{
}

@end

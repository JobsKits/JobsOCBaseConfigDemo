//
//  NSString+WKWebView.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+WKWebView.h"

@implementation NSString (WKWebView)
/// loadHTMLString：包含 HTML 内容的字符串
/// baseURL：指定 HTML 内容的基本 URL，可以用于解析相对路径
-(JobsRetWKWebViewByStrBlock _Nonnull)webViewByloadHTMLString{
    return ^__kindof WKWebView *_Nullable(NSString *_Nullable data){
        @jobs_weakify(self)
        return jobsMakeWKWebView(^(__kindof WKWebView * _Nullable webView) {
            @jobs_strongify(self)
            [webView loadHTMLString:self baseURL:data.jobsURL()];
        });
    };
}
/// 解析纯的HTML字符串
-(JobsRetWKWebViewByVoidBlock _Nonnull)webViewByloadHTMLStr{
    @jobs_weakify(self)
    return ^__kindof WKWebView *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        @jobs_weakify(self)
        return jobsMakeWKWebView(^(__kindof WKWebView * _Nullable webView) {
            @jobs_strongify(self)
            [webView loadHTMLString:self baseURL:nil];
        });
    };
}
/// 解析URL数据
-(JobsRetWKWebViewByVoidBlock _Nonnull)makeWebView{
    return ^__kindof WKWebView *_Nullable(){
        @jobs_weakify(self)
        return jobsMakeWKWebView(^(__kindof WKWebView *_Nullable webView) {
            @jobs_strongify(self)
            [webView loadRequest:self.jobsURL().jobsURLRequest()];
        });
    };
}
/// 解析JS
-(JobsRetWKWebViewByVoidBlock _Nonnull)makeWebViewByJS{
    return ^__kindof WKWebView *_Nullable(){
        @jobs_weakify(self)
        return jobsMakeWKWebViewByConfig(^(__kindof WKWebView *_Nullable webView) {
            @jobs_strongify(self)
            [webView evaluateJavaScript:self
                      completionHandler:^(id _Nullable result,
                                          NSError * _Nullable error) {
                if (error) {
                    JobsLog(@"执行 JavaScript 出错: %@", error);
                } else {
                    JobsLog(@"JavaScript 结果: %@", result);
                }
            }];
        });
    };
}
/// 鉴别一个字符串里面是否包含HTML的标签。如果有则这个字符串考虑用WebView来进行承接
-(JobsRetBOOLByVoidBlock _Nonnull)isHTMLString{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        for (NSString *tag in self.htmlTags()) {
            if (self.containsString(tag)) return YES;
        };return NO;
    };
}
/// 某个字符串是否包含这些HTML必要的成像标签。如果没有就要做特殊处理
-(JobsRetBOOLByVoidBlock _Nonnull)isContainsRequiredHTMLTags{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        for (NSString *tag in self.requiredHTMLTags()) {
            if (self.containsString(tag)) return YES;
        };return NO;
    };
}
/// 包装 HTML 字符串，使之能被 WKWebView 正确显示
-(JobsRetStrByVoidBlock _Nonnull)wrapHTMLString{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        if(!self.isContainsRequiredHTMLTags()){
            /// 如果输入字符串不包含Web的成像标签，则进行添加，并且将这个HTML片段写入Body内部
            return [NSString stringWithFormat:@"<!DOCTYPE html>\
            <html>\
            <head>\
            <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\
            <title>Dynamic Content</title>\
            </head>\
            <body>%@</body>\
            </html>", self];
        }else return self;
    };
}
/// 包装 HTML 字符串，使之能被 WKWebView 正确显示 + 背景透明
-(JobsRetStrByVoidBlock _Nonnull)wrapHTMLStringWithClearBg {
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        if (!self.isContainsRequiredHTMLTags()) {
            // 如果输入字符串不包含 Web 的成像标签，则进行添加，并且将这个 HTML 片段写入 Body 内部
            return [NSString stringWithFormat:@"<!DOCTYPE html>\
        <html>\
        <head>\
        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\
        <title>Dynamic Content</title>\
        <style>\
        html, body { \
            height: 100%%;\
            margin: 0;\
            padding: 0;\
            background-color: transparent;\
        }\
        body {\
            display: flex;\
            justify-content: center;\
            align-items: center;\
        }\
        </style>\
        </head>\
        <body>%@</body>\
        </html>", self];
        } else return self;
    };
}

@end

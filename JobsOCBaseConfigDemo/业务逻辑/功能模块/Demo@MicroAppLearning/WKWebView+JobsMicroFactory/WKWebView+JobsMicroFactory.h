//
//  WKWebView+JobsMicroFactory.h
//  JobsMicroAppLearning
//
//  Created by Jobs on 2026年10月19日，星期一.
//

#import "JobsMicroLearningBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface WKWebView (JobsMicroFactory)

/// WebKit 必须在 initWithFrame:configuration: 前配置存储，不能在创建后更换 dataStore。
+(WKWebView *)jobsMicroWebViewWithStore:(WKWebsiteDataStore *)store handler:(nullable id<WKScriptMessageHandler>)handler;
/// 用宿主手动 / 跟随系统的有效主题覆盖 Web 内容，不依赖 WebKit 自动传播 traits。
-(jobsByVoidBlock _Nonnull)jobsMicroApplyHostTheme;

@end

NS_ASSUME_NONNULL_END

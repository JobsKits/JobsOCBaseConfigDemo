//
//  WKWebViewConfiguration+Extra.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <WebKit/WebKit.h>
#import "JobsMakes.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface WKWebViewConfiguration (Extra)

@end

NS_ASSUME_NONNULL_END

#ifndef JOBS_MAKE_WK_WEB_VIEW_CONFIGURATION
#define JOBS_MAKE_WK_WEB_VIEW_CONFIGURATION

NS_INLINE __kindof WKWebViewConfiguration *_Nonnull jobsMakeWKWebViewConfiguration(jobsByWKWebViewConfigBlock _Nonnull block){
    WKWebViewConfiguration *data = WKWebViewConfiguration.alloc.init;
    if (block) block(data);
    return data;
}
#endif

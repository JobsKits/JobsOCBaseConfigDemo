//
//  WKWebViewConfiguration+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <WebKit/WebKit.h>

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

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

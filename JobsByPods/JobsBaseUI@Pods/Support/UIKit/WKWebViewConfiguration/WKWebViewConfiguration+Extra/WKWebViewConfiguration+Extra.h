//
//  WKWebViewConfiguration+Extra.h
//  JobsBaseUI
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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

NS_ASSUME_NONNULL_END

#ifndef JOBS_MAKE_WK_WEB_VIEW_CONFIGURATION
#define JOBS_MAKE_WK_WEB_VIEW_CONFIGURATION

NS_INLINE __kindof WKWebViewConfiguration *_Nonnull jobsMakeWKWebViewConfiguration(jobsByWKWebViewConfigBlock _Nonnull block){
    WKWebViewConfiguration *data = jobsMakeWebViewConfiguration(^(WKWebViewConfiguration *object){});
    if (block) block(data);
    return data;
}
#endif

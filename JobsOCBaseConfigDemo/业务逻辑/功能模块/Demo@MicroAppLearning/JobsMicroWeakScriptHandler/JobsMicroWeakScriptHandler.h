//
//  JobsMicroWeakScriptHandler.h
//  JobsMicroAppLearning
//
//  Created by Jobs on 2026年10月19日，星期一.
//

#import <WebKit/WebKit.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

/// WKUserContentController 强持有 handler，用弱转发解除 WebView → VC 的环。
@interface JobsMicroWeakScriptHandler : NSObject <WKScriptMessageHandler>

-(instancetype)initWithTarget:(id<WKScriptMessageHandler>)target;

@end

NS_ASSUME_NONNULL_END

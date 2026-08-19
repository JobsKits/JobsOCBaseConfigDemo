//
//  JobsScreenshotObserver.h
//  JobsScreenCapture
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import <UIKit/UIKit.h>

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

@interface JobsScreenshotObserver : NSObject

-(JobsRetIDByVoidBlocks _Nonnull)startWithHandler;
-(JobsRetIDByVoidBlock _Nonnull)jobsStop;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsScreenshotObserver
-(JobsRetJobsScreenshotObserverByIDNSObjectBlock _Nonnull)byScreenshotToken;
-(JobsRetJobsScreenshotObserverByjobsByVoidBlockBlock _Nonnull)byScreenshotHandler;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsScreenshotObserver
@end

NS_ASSUME_NONNULL_END

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

-(instancetype)startWithHandler:(jobsByVoidBlock)handler;
-(instancetype)stop;

@end

NS_ASSUME_NONNULL_END

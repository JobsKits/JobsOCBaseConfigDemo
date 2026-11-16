//
//  JobsDebugEnvironment.h
//  JobsDebugPanel
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#pragma once
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

#if DEBUG
NS_ASSUME_NONNULL_BEGIN

@interface JobsDebugEnvironment : NSObject

Prop_copy(readonly)NSString *identifier;
Prop_copy(readonly)NSString *title;
Prop_copy(readonly)NSString *baseURL;
-(JobsRetDebugEnvironmentByStringBlock _Nonnull)byIdentifier;
-(JobsRetDebugEnvironmentByStringBlock _Nonnull)byTitle;
-(JobsRetDebugEnvironmentByStringBlock _Nonnull)byBaseURL;

@end

NS_ASSUME_NONNULL_END
#endif


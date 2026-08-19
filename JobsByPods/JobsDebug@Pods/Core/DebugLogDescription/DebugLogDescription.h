//
//  DebugLogDescription.h
//  JobsDebug
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_DEBUGLOGDESCRIPTION_4812D86079
#define JOBS_HEADER_GUARD_DEBUGLOGDESCRIPTION_4812D86079

#import <objc/runtime.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <Foundation/Foundation.h>

#if __has_include(<JobsStringUtils/JobsStringUtilsHeader.h>)
#import <JobsStringUtils/JobsStringUtilsHeader.h>
#else
#import "JobsStringUtilsHeader.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
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

#ifdef DEBUG

@interface NSObject (DebugDescription)

+(jobsByVoidBlock _Nonnull)redirectNSlogToDocumentFolder;

@end

@interface NSDictionary (DebugDescription)

@end

@interface NSArray (DebugDescription)

@end

#endif
#endif /* JOBS_HEADER_GUARD_DEBUGLOGDESCRIPTION_4812D86079 */

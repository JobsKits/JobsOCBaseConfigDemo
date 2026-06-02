//
//  DebugLogDescription.h
//  JobsDebug
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_DEBUGLOGDESCRIPTION_4812D86079
#define JOBS_HEADER_GUARD_DEBUGLOGDESCRIPTION_4812D86079

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#if __has_include(<JobsStringUtils/JobsStringUtils.h>)
#import <JobsStringUtils/JobsStringUtils.h>
#else
#import "JobsStringUtils.h"
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

#ifdef DEBUG

@interface NSObject (DebugDescription)

+(void)redirectNSlogToDocumentFolder;

@end

@interface NSDictionary (DebugDescription)

@end

@interface NSArray (DebugDescription)

@end

#endif
#endif /* JOBS_HEADER_GUARD_DEBUGLOGDESCRIPTION_4812D86079 */

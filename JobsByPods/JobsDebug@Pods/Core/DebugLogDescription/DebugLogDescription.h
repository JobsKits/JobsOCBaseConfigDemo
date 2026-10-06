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
#import <stdio.h>
#import <fcntl.h>
#import <unistd.h>

#import <JobsDebug/NSObject+Extra.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

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

#ifndef JOBS_ENABLE_COLLECTION_LOG_SWIZZLE
#define JOBS_ENABLE_COLLECTION_LOG_SWIZZLE 0
#endif

#if DEBUG

@interface NSObject (DebugDescription)

+(jobsByVoidBlock _Nonnull)redirectNSlogToDocumentFolder;
/// 显式输出有序 JSON；非 JSON 对象、循环或过深容器返回 nil。
-(JobsRetStrByVoidBlock _Nonnull)convertToJsonString;

@end

@interface NSDictionary (DebugDescription)

@end

@interface NSArray (DebugDescription)

@end

#endif
#endif /* JOBS_HEADER_GUARD_DEBUGLOGDESCRIPTION_4812D86079 */

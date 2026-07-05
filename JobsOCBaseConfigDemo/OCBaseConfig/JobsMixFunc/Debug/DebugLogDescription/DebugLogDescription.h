//
//  DebugLogDescription.h
//  JobsDebug
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_DEBUGLOGDESCRIPTION_4812D86079
#define JOBS_HEADER_GUARD_DEBUGLOGDESCRIPTION_4812D86079

#import <objc/runtime.h>
#import <Foundation/Foundation.h>

#import "JobsStringUtilsHeader.h"

#import "NSObject+Extra.h"
#import "NSString+Extra.h"
#import "NSData+Extra.h"

#import "JobsMakes.h"

#import "JobsDefines.h"

#ifdef DEBUG

/// 同一个类的方法交换
void JobsDebugMethodSwizzle(Class _Nonnull c,
                            SEL _Nonnull _orig,
                            SEL _Nonnull _new);

@interface NSObject (DebugDescription)

+(void)redirectNSlogToDocumentFolder;

@end

@interface NSDictionary (DebugDescription)

@end

@interface NSArray (DebugDescription)

@end

#endif
#endif /* JOBS_HEADER_GUARD_DEBUGLOGDESCRIPTION_4812D86079 */

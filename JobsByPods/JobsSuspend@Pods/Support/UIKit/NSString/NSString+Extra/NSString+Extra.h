//
//  NSString+Extra.h
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_EXTRA_EFAB384418
#define JOBS_HEADER_GUARD_NSSTRING_EXTRA_EFAB384418

#pragma once

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extra)

+(NSString *)nullableString:(id _Nullable)nullableString
              replaceString:(NSString *_Nullable)replaceString;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_EXTRA_EFAB384418 */

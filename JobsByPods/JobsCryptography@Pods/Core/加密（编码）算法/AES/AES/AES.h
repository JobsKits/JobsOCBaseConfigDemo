//
//  AES.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_AES_6FD8B3B286
#define JOBS_HEADER_GUARD_AES_6FD8B3B286

#import <Foundation/Foundation.h>
#import <JobsCryptography/NSData+Base64.h>
#import <JobsCryptography/NSString+Base64.h>
#import <JobsCryptography/NSData+CommonCrypto.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

@interface AES : NSObject

+(NSString *)encrypt:(NSString *)message
            password:(NSString *)password;

+(NSString *)decrypt:(NSString *)base64EncodedString
            password:(NSString *)password;

@end
#endif /* JOBS_HEADER_GUARD_AES_6FD8B3B286 */

//
//  AESCrypt.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_AESCRYPT_0180CA757D
#define JOBS_HEADER_GUARD_AESCRYPT_0180CA757D

#import <Foundation/Foundation.h>

#import "JobsByOCPods.h"

#import "JobsCryptography.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface AESCrypt : NSObject
///
+(NSString *)encrypt:(NSString *)message password:(NSString *)password;
///
+(NSString *)decrypt:(NSString *)base64EncodedString password:(NSString *)password;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_AESCRYPT_0180CA757D */

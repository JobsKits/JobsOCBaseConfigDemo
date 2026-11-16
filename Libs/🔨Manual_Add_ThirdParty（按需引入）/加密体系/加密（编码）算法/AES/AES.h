//
//  AES.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_AES_6FD8B3B286
#define JOBS_HEADER_GUARD_AES_6FD8B3B286

#import <Foundation/Foundation.h>
#import "NSData+Base64.h"
#import "NSString+Base64.h"
#import "NSData+CommonCrypto.h"

#import "JobsDefines.h"

@interface AES : NSObject

+(NSString *)encrypt:(NSString *)message
            password:(NSString *)password;

+(NSString *)decrypt:(NSString *)base64EncodedString
            password:(NSString *)password;

@end
#endif /* JOBS_HEADER_GUARD_AES_6FD8B3B286 */

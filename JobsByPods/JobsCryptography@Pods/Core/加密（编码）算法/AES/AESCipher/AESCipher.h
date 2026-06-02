//
//  AESCipher.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_AESCIPHER_756C1FDB5F
#define JOBS_HEADER_GUARD_AESCIPHER_756C1FDB5F

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

NSString * aesEncryptString(NSString *content,
                            NSString *key);

NSString * aesDecryptString(NSString *content,
                            NSString *key);

#endif /* JOBS_HEADER_GUARD_AESCIPHER_756C1FDB5F */

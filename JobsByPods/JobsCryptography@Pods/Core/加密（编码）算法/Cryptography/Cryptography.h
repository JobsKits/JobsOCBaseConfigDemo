//
//  Cryptography.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef Cryptography_h
#define Cryptography_h

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonHMAC.h>

/// 第三方
#import <JobsCryptography/GTMBase64.h>
/// 系统拓展
#import <JobsCryptography/NSData+CommonCrypto.h>
#import <JobsCryptography/Base16.h>
#import <JobsCryptography/Base32.h>
#import <JobsCryptography/Base64.h>
#import <JobsCryptography/Base85.h>
#import <JobsCryptography/CaesarCipher.h>
#import <JobsCryptography/SHA-1.h>
#import <JobsCryptography/SHA-224.h>
#import <JobsCryptography/SHA-256.h>
#import <JobsCryptography/SHA-384.h>
#import <JobsCryptography/SHA-512.h>
#import <JobsCryptography/DES.h>
#import <JobsCryptography/RSAUtil.h>
#import <JobsCryptography/AES.h>
#import <JobsCryptography/AESCipher.h>
#import <JobsCryptography/MD5.h>
/// 其他
#import <JobsCryptography/HexadecimalData.h>
#import <JobsCryptography/MIME.h>

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

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

#endif /* Cryptography_h */

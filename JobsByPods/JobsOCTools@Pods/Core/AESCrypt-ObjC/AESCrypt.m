//
//  AESCrypt.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AESCrypt.h"

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

@implementation AESCrypt
///
+(NSString *)encrypt:(NSString *)message password:(NSString *)password{
    NSError *error = nil;
    NSData *encryptedData = [message.UTF8Encoding AES256EncryptedDataUsingKey:password.UTF8Encoding.SHA256Hash error:&error];
    NSString *base64EncodedString = encryptedData.base64StringFromData;
    if(error){
        JobsLog(@"error = %@",error);
        return @"";
    }else return base64EncodedString;
}
///
+(NSString *)decrypt:(NSString *)base64EncodedString password:(NSString *)password {
    NSError *error = nil;
    NSData *encryptedData = NSData.dataByBase64String(base64EncodedString);
    NSData *decryptedData = [encryptedData decryptedAES256DataUsingKey:password.UTF8Encoding.SHA256Hash.SHA256Hash error:&error];
    if(error){
        JobsLog(@"error = %@",error);
        return @"";
    }else return NSString.initByUTF8Data(decryptedData);
}

@end

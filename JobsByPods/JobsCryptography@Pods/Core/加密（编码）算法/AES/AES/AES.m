//
//  AES.m
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AES.h"

@implementation AES
+(NSString *)encrypt:(NSString *)message
            password:(NSString *)password{
    NSError *error = nil;
    NSData *encryptedData = [message.jobsUTF8Encoding() AES256EncryptedDataUsingKey:password.jobsUTF8Encoding().SHA256Hash error:&error];
    NSString *base64EncodedString = encryptedData.base64StringFromData();
    if(error){
        JobsLog(@"error = %@",error);
        return @"";
    }else return base64EncodedString;
}

+(NSString *)decrypt:(NSString *)base64EncodedString
            password:(NSString *)password{
    NSError *error = nil;
    NSData *encryptedData = NSData.dataByBase64String(base64EncodedString);
    NSData *decryptedData = [encryptedData decryptedAES256DataUsingKey:password.jobsUTF8Encoding().SHA256Hash
                                                                 error:&error];
    if(error){
        JobsLog(@"error = %@",error);
        return @"";
    }else return NSString.initByUTF8Data(decryptedData);
}

@end

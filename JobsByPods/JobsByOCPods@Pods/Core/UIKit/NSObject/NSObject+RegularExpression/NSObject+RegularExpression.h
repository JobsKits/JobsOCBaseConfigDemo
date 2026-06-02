//
//  NSObject+RegularExpression.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_REGULAREXPRESSION_3A4A97D4A6
#define JOBS_HEADER_GUARD_NSOBJECT_REGULAREXPRESSION_3A4A97D4A6

#import <Foundation/Foundation.h>

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

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (RegularExpression)
#pragma mark —— 校验只能输入n位的数字
+(BOOL)checkingNumberWithLength:(NSString *)length number:(NSString *)number;
#pragma mark —— 校验最少输入n位的数字
+(BOOL)checkingNumberWithLeastLength:(NSString *)leastLength number:(NSString *)number;
#pragma mark —— 密码校验
+(BOOL)lc_checkingPasswordWithShortest:(NSInteger)shortest
                               longest:(NSInteger)longest
                              password:(NSString *)pwd;
#pragma mark —— 邮箱校验
+(JobsRetBOOLByStrBlock _Nonnull)checkingEmail;
#pragma mark —— 验证(中国大陆)手机号
-(JobsRetBOOLByStrBlock _Nonnull)checkingMobile;
#pragma mark —— 验证电话号
-(JobsRetBOOLByStrBlock _Nonnull)checkingPhoneNum;
#pragma mark —— 身份证号验证
-(JobsRetBOOLByStrBlock _Nonnull)checkingIdCard;

#pragma mark —— 由数字和26个英文字母组成的字符串
-(JobsRetBOOLByStrBlock _Nonnull)checkingStrFormNumberAndLetter;
#pragma mark —— 26位英文大小写字母组成的字符
-(JobsRetBOOLByStrBlock _Nonnull)checkingStrFormLowerAndUpperLetter;
#pragma mark —— 小写字母
-(JobsRetBOOLByStrBlock _Nonnull)checkingLowerLetter;
#pragma mark —— 大写字母
-(JobsRetBOOLByStrBlock _Nonnull)checkingUpperLetter;
#pragma mark —— 特殊字符
-(JobsRetBOOLByStrBlock _Nonnull)checkingSpecialChar;
#pragma mark —— 只能输入数字
-(JobsRetBOOLByStrBlock _Nonnull)checkingNumber;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_REGULAREXPRESSION_3A4A97D4A6 */

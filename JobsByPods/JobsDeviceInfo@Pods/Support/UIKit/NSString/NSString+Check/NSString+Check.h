//
//  NSString+Check.h
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_CHECK_0EBF158D33
#define JOBS_HEADER_GUARD_NSSTRING_CHECK_0EBF158D33

#pragma once

#import <Foundation/Foundation.h>
#import <_ctype.h> // 引入字符分类与大小写转换等 C 标准字符处理相关的内部定义
#import <JobsDeviceInfo/NSString+Replace.h>

#if __has_include(<JobsStringUtils/JobsStringUtils.h>)
#import <JobsStringUtils/JobsStringUtils.h>
#else
#import "JobsStringUtils.h"
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

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Check)
#pragma mark —— 字符串的 比较 & 判断
/// 如果字符串为null 那么不走isEqualToString，无法比较都是空的情况
+(BOOL)isEqualStrA:(NSString *)stringA strB:(NSString *)stringB;

-(JobsRetBOOLByIDBlock _Nonnull)isEqualToString;
-(JobsRetBOOLByIDBlock _Nonnull)containsString;
-(JobsRetBOOLByIDBlock _Nonnull)hasPrefix;
-(JobsRetBOOLByIDBlock _Nonnull)hasSuffix;
/// 判断字符串对象是否为狭义范围内的空格
-(BOOL)isNotBlank;
/// 判断是否是广义范围内的空格(space、\t、\r、\n)
-(BOOL)isSpace;
/// 判断字符串是否包含空格：返回YES【没有空格】
-(BOOL)isContainBlank;
/// 给定某字符串，判断里面的组成char是否全部为某个char
/// @param standardChar 执行标准
-(BOOL)isAllSameCharWithStandardChar:(char)standardChar;
/// 是否是系统自带九宫格输入 yes-是 no-不是
-(BOOL)isNineKeyBoard;
/// 判断是否为整形
-(BOOL)isPureInt;
/// 判断是否为浮点形
-(BOOL)isPureFloat;
/// 判断是否是数字字母结合
-(BOOL)isAlnum;
/// 判断是否是ASCII码的控制字符
-(BOOL)isCntrl;
/// 判断是否是为可打印字符(不包含空格)
-(BOOL)isGraph;
/// 判断字符是否为可打印字符（含空格）
-(BOOL)isPrint;
/// 判断是否是小写的英文字母
-(BOOL)isLower;
/// 判断字符是否为大写英文字母
-(BOOL)isUpper;
/// 判断字符是否为16进制数字
-(BOOL)isXdigit;
/// 判断字符是否为标点符号或特殊字符
-(BOOL)isPunct;
/// 是否全是字母（26个英文字母）
-(BOOL)isAllLetterCharacter;
/// 字符串是否包含URL【返回YES包含】
-(BOOL)isContainsUrl;
/// 正则匹配手机号
-(BOOL)checkTelNumber;
/// 正则判断是否为菲律宾手机号码
/// 菲律宾的手机号码通常有以下格式：
/// 11位数字，以 9 开头的数字序列
/// 国际格式为 +63 开头，后面是10位数字
-(BOOL)isPhilippinesPhoneNum;
/// 至少包含一个数字、大写字母、小写字母和特殊字符
-(BOOL)isMixedCharacterString;
/// 检查是否是纯数字
-(BOOL)isPureDigit;
/// 本字符串是否包含入参字符串的任何字符
-(JobsRetBOOLByStrBlock _Nonnull)isContainBy;
/// 本字符串是否不包含入参字符串的任何字符
-(JobsRetBOOLByStrBlock _Nonnull)isNotContainBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_CHECK_0EBF158D33 */

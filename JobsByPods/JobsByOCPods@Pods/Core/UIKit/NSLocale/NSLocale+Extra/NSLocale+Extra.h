//
//  NSLocale+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSLOCALE_EXTRA_336543BCD1
#define JOBS_HEADER_GUARD_NSLOCALE_EXTRA_336543BCD1

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

/// 获取系统的首选语言代码
NS_INLINE NSString *_Nullable currentLanguage(void){
    NSString *languageCode = NSLocale.preferredLanguages.firstObject;
    return languageCode;
}

NS_ASSUME_NONNULL_BEGIN

@interface NSLocale (Extra)

+(JobsRetLocaleByStrBlock _Nonnull)initByID;
/// 对系统方法 objectForKey 的二次封装
-(JobsRetIDByStrBlock _Nonnull)objectForKey;
/// 区域标识符。例如 @"en_US" 表示美国的英语。
-(NSString *)areaID;
-(JobsRetStrByVoidBlock _Nonnull)jobsAreaID;
/// 语言代码。例如 @"en" 表示英语，@"zh" 表示中文。
-(NSString *)languageCode;
-(JobsRetStrByVoidBlock _Nonnull)jobsLanguageCode;
/// 国家代码。例如 @"US" 表示美国，@"CN" 表示中国。
-(NSString *)countryCode;
-(JobsRetStrByVoidBlock _Nonnull)jobsCountryCode;
/// 书写系统代码。例如拉丁字母是 @"Latn"。
-(NSString *)scriptCode;
-(JobsRetStrByVoidBlock _Nonnull)jobsScriptCode;
/// 变体标识符，用于表示同一语言的特定地区或变体。
-(NSString *)variantCode;
-(JobsRetStrByVoidBlock _Nonnull)jobsVariantCode;
/// 区域使用的示例字符集。
-(NSCharacterSet *)exemplarCharacterSet;
-(JobsRetNSCharacterSetByVoidBlock _Nonnull)jobsExemplarCharacterSet;
/// 区域中使用的默认日历类型，例如公历（Gregorian Calendar）。
-(JobsRetFSCalendarByGetGregorianBlock _Nonnull)calendar;
/// 排序顺序标识符，用于指定文本排序的方式。
-(NSString *)collationIdentifier;
-(JobsRetStrByVoidBlock _Nonnull)jobsCollationIdentifier;
/// 是否使用公制系统。例如 @(YES) 表示使用公制系统。
-(NSNumber *)usesMetricSystem;
-(JobsRetNSNumberByVoidBlock _Nonnull)jobsUsesMetricSystem;
/// 度量系统的描述，比如 @"Metric" 表示公制。
-(NSString *)measurementSystem;
-(JobsRetStrByVoidBlock _Nonnull)jobsMeasurementSystem;
/// 十进制分隔符，例如美国是 @"."，某些国家是 @","。
-(NSString *)decimalSeparator;
-(JobsRetStrByVoidBlock _Nonnull)jobsDecimalSeparator;
/// 千位分隔符，例如美国使用 @", "。
-(NSString *)groupingSeparator;
-(JobsRetStrByVoidBlock _Nonnull)jobsGroupingSeparator;
/// 货币符号，例如美元符号 @"$"。
-(NSString *)currencySymbol;
-(JobsRetStrByVoidBlock _Nonnull)jobsCurrencySymbol;
/// 货币代码，例如 @"USD" 表示美元。
-(NSString *)currencyCode;
-(JobsRetStrByVoidBlock _Nonnull)jobsCurrencyCode;
/// 排序标识符，用于文本比较和排序。
-(NSString *)collatorIdentifier;
-(JobsRetStrByVoidBlock _Nonnull)jobsCollatorIdentifier;
/// 引号的起始符号，例如英文使用 @"\u201c"。
-(NSString *)quotationBeginDelimiter;
-(JobsRetStrByVoidBlock _Nonnull)jobsQuotationBeginDelimiter;
/// 引号的结束符号，例如英文使用 @"\u201d"。
-(NSString *)quotationEndDelimiter;
-(JobsRetStrByVoidBlock _Nonnull)jobsQuotationEndDelimiter;
/// 备用引号的起始符号，例如英文的备用引号是 @"\u2018"。
-(NSString *)alternateQuotationBeginDelimiter;
-(JobsRetStrByVoidBlock _Nonnull)jobsAlternateQuotationBeginDelimiter;
/// 备用引号的结束符号，例如英文的备用引号是 @"\u2019"。
-(NSString *)alternateQuotationEndDelimiter;
-(JobsRetStrByVoidBlock _Nonnull)jobsAlternateQuotationEndDelimiter;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSLOCALE_EXTRA_336543BCD1 */

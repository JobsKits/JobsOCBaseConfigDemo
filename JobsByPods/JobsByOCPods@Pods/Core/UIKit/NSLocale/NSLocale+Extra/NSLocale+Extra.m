//
//  NSLocale+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSLocale+Extra.h"

@implementation NSLocale (Extra)
+(JobsRetLocaleByStrBlock _Nonnull)initByID{
    return ^NSLocale *_Nullable(__kindof NSString *_Nullable ID){
        return [NSLocale localeWithLocaleIdentifier:ID];
    };
}
/// 对系统方法 objectForKey 的二次封装
-(JobsRetIDByStrBlock _Nonnull)objectForKey{
    @jobs_weakify(self)
    return ^id _Nullable(NSLocaleKey _Nullable key){
        @jobs_strongify(self)
        return [self objectForKey:key];
    };
}
/// 区域标识符。例如 @"en_US" 表示美国的英语。
-(NSString *)areaID{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSLocale.class, @selector(jobsAreaID)))(self, @selector(jobsAreaID)))();
}

-(JobsRetStrByVoidBlock _Nonnull)jobsAreaID{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return (NSString *)self.objectForKey(NSLocaleIdentifier);
    };
}
/// 语言代码。例如 @"en" 表示英语，@"zh" 表示中文。
/// 当前本地化环境（即当前设备的区域设置）中所使用的语言代码
-(NSString *)languageCode{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSLocale.class, @selector(jobsLanguageCode)))(self, @selector(jobsLanguageCode)))();
}

-(JobsRetStrByVoidBlock _Nonnull)jobsLanguageCode{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return (NSString *)self.objectForKey(NSLocaleLanguageCode);
    };
}
/// 国家代码。例如 @"US" 表示美国，@"CN" 表示中国。
-(NSString *)countryCode{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSLocale.class, @selector(jobsCountryCode)))(self, @selector(jobsCountryCode)))();
}

-(JobsRetStrByVoidBlock _Nonnull)jobsCountryCode{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return (NSString *)self.objectForKey(NSLocaleCountryCode);
    };
}
/// 书写系统代码。例如拉丁字母是 @"Latn"。
-(NSString *)scriptCode{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSLocale.class, @selector(jobsScriptCode)))(self, @selector(jobsScriptCode)))();
}

-(JobsRetStrByVoidBlock _Nonnull)jobsScriptCode{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return (NSString *)self.objectForKey(NSLocaleScriptCode);
    };
}
/// 变体标识符，用于表示同一语言的特定地区或变体。
-(NSString *)variantCode{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSLocale.class, @selector(jobsVariantCode)))(self, @selector(jobsVariantCode)))();
}

-(JobsRetStrByVoidBlock _Nonnull)jobsVariantCode{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return (NSString *)self.objectForKey(NSLocaleVariantCode);
    };
}
/// 区域使用的示例字符集。
-(NSCharacterSet *)exemplarCharacterSet{
    JobsRetNSCharacterSetByVoidBlock action = ((JobsRetNSCharacterSetByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSLocale.class, @selector(jobsExemplarCharacterSet)))(self, @selector(jobsExemplarCharacterSet));
    return action ? action() : nil;
}

-(JobsRetNSCharacterSetByVoidBlock _Nonnull)jobsExemplarCharacterSet{
    @jobs_weakify(self)
    return ^NSCharacterSet *{
        @jobs_strongify(self)
        if (!self) return nil;
        return (NSCharacterSet *)self.objectForKey(NSLocaleExemplarCharacterSet);
    };
}
/// 区域中使用的默认日历类型，例如公历（Gregorian Calendar）。
-(JobsRetFSCalendarByGetGregorianBlock _Nonnull)calendar{
    @jobs_weakify(self)
    return ^NSCalendar *{
        @jobs_strongify(self)
        if (!self) return nil;
        return (NSCalendar *)self.objectForKey(NSLocaleCalendar);
    };
}
/// 排序顺序标识符，用于指定文本排序的方式。
-(NSString *)collationIdentifier{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSLocale.class, @selector(jobsCollationIdentifier)))(self, @selector(jobsCollationIdentifier)))();
}

-(JobsRetStrByVoidBlock _Nonnull)jobsCollationIdentifier{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return (NSString *)self.objectForKey(NSLocaleCollationIdentifier);
    };
}
/// 是否使用公制系统。例如 @(YES) 表示使用公制系统。
-(NSNumber *)usesMetricSystem{
    JobsRetNSNumberByVoidBlock action = ((JobsRetNSNumberByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSLocale.class, @selector(jobsUsesMetricSystem)))(self, @selector(jobsUsesMetricSystem));
    return action ? action() : nil;
}

-(JobsRetNSNumberByVoidBlock _Nonnull)jobsUsesMetricSystem{
    @jobs_weakify(self)
    return ^NSNumber *{
        @jobs_strongify(self)
        if (!self) return nil;
        return (NSNumber *)self.objectForKey(NSLocaleUsesMetricSystem);
    };
}
/// 度量系统的描述，比如 @"Metric" 表示公制。
-(NSString *)measurementSystem{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSLocale.class, @selector(jobsMeasurementSystem)))(self, @selector(jobsMeasurementSystem)))();
}

-(JobsRetStrByVoidBlock _Nonnull)jobsMeasurementSystem{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return (NSString *)self.objectForKey(NSLocaleMeasurementSystem);
    };
}
/// 十进制分隔符，例如美国是 @"."，某些国家是 @","。
-(NSString *)decimalSeparator{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSLocale.class, @selector(jobsDecimalSeparator)))(self, @selector(jobsDecimalSeparator)))();
}

-(JobsRetStrByVoidBlock _Nonnull)jobsDecimalSeparator{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return (NSString *)self.objectForKey(NSLocaleDecimalSeparator);
    };
}
/// 千位分隔符，例如美国使用 @", "。
-(NSString *)groupingSeparator{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSLocale.class, @selector(jobsGroupingSeparator)))(self, @selector(jobsGroupingSeparator)))();
}

-(JobsRetStrByVoidBlock _Nonnull)jobsGroupingSeparator{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.objectForKey(NSLocaleGroupingSeparator);
    };
}
/// 货币符号，例如美元符号 @"$"。
-(NSString *)currencySymbol{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSLocale.class, @selector(jobsCurrencySymbol)))(self, @selector(jobsCurrencySymbol)))();
}

-(JobsRetStrByVoidBlock _Nonnull)jobsCurrencySymbol{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return (NSString *)self.objectForKey(NSLocaleCurrencySymbol);
    };
}
/// 货币代码，例如 @"USD" 表示美元。
-(NSString *)currencyCode{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSLocale.class, @selector(jobsCurrencyCode)))(self, @selector(jobsCurrencyCode)))();
}

-(JobsRetStrByVoidBlock _Nonnull)jobsCurrencyCode{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return (NSString *)self.objectForKey(NSLocaleCurrencyCode);
    };
}
/// 排序标识符，用于文本比较和排序。
-(NSString *)collatorIdentifier{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSLocale.class, @selector(jobsCollatorIdentifier)))(self, @selector(jobsCollatorIdentifier)))();
}

- (JobsRetStrByVoidBlock _Nonnull)jobsCollatorIdentifier{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return (NSString *)self.objectForKey(NSLocaleCollatorIdentifier);
    };
}
/// 引号的起始符号，例如英文使用 @"\u201c"。
-(NSString *)quotationBeginDelimiter{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSLocale.class, @selector(jobsQuotationBeginDelimiter)))(self, @selector(jobsQuotationBeginDelimiter)))();
}

-(JobsRetStrByVoidBlock _Nonnull)jobsQuotationBeginDelimiter{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return (NSString *)self.objectForKey(NSLocaleQuotationBeginDelimiterKey);
    };
}
/// 引号的结束符号，例如英文使用 @"\u201d"。
-(NSString *)quotationEndDelimiter{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSLocale.class, @selector(jobsQuotationEndDelimiter)))(self, @selector(jobsQuotationEndDelimiter)))();
}

-(JobsRetStrByVoidBlock _Nonnull)jobsQuotationEndDelimiter{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return (NSString *)self.objectForKey(NSLocaleQuotationEndDelimiterKey);
    };
}
/// 备用引号的起始符号，例如英文的备用引号是 @"\u2018"。
-(NSString *)alternateQuotationBeginDelimiter{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSLocale.class, @selector(jobsAlternateQuotationBeginDelimiter)))(self, @selector(jobsAlternateQuotationBeginDelimiter)))();
}

-(JobsRetStrByVoidBlock _Nonnull)jobsAlternateQuotationBeginDelimiter{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return (NSString *)self.objectForKey(NSLocaleAlternateQuotationBeginDelimiterKey);
    };
}
/// 备用引号的结束符号，例如英文的备用引号是 @"\u2019"。
-(NSString *)alternateQuotationEndDelimiter{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSLocale.class, @selector(jobsAlternateQuotationEndDelimiter)))(self, @selector(jobsAlternateQuotationEndDelimiter)))();
}

-(JobsRetStrByVoidBlock _Nonnull)jobsAlternateQuotationEndDelimiter{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return (NSString *)self.objectForKey(NSLocaleAlternateQuotationEndDelimiterKey);
    };
}

@end

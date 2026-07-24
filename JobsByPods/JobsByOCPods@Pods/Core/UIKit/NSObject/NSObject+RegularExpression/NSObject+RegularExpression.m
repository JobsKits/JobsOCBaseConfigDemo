//
//  NSObject+RegularExpression.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+RegularExpression.h"

NSString * const JobsCNIDErrorDomain = @"com.jobs.cnid.validation";

static NSString *JobsCNIDErrorMessage(JobsCNIDErrorCode code) {
    switch (code) {
        /// 处理 JobsCNIDErrorCodeBirthDate 分支
        case JobsCNIDErrorCodeBirthDate:
            return @"出生日期无效或超出合理范围";
        /// 处理 JobsCNIDErrorCodeSequence 分支
        case JobsCNIDErrorCodeSequence:
            return @"顺序码无效（不能为000）";
        /// 处理 JobsCNIDErrorCodeChecksum 分支
        case JobsCNIDErrorCodeChecksum:
            return @"校验位不匹配";
        /// 处理 JobsCNIDErrorCodeFormat 分支
        case JobsCNIDErrorCodeFormat:
        /// 未匹配已知分支时执行兜底处理
        default:
            return @"格式错误：18位(前17位数字+最后一位数字或X) 或 15位纯数字";
    }
}

static void JobsCNIDFillError(NSError **error, JobsCNIDErrorCode code) {
    if (error) *error = [NSError errorWithDomain:JobsCNIDErrorDomain
                                            code:code
                                        userInfo:@{NSLocalizedDescriptionKey:JobsCNIDErrorMessage(code)}];
}

static NSString *JobsCNIDNormalizedString(NSString *raw) {
    return [[raw ?: @"" stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet].uppercaseString copy];
}

static BOOL JobsCNIDMatches(NSString *text, NSString *regEx) {
    if (!text.length) return NO;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    return [predicate evaluateWithObject:text];
}

static unichar JobsCNIDChecksumChar(NSString *body17) {
    NSArray<NSNumber *> *weights = @[@7,@9,@10,@5,@8,@4,@2,@1,@6,@3,@7,@9,@10,@5,@8,@4,@2];
    NSInteger sum = 0;
    for (NSUInteger idx = 0; idx < 17; idx++) sum += ([body17 characterAtIndex:idx] - '0') * weights[idx].integerValue;
    return [@"10X98765432" characterAtIndex:sum % 11];
}

static BOOL JobsCNIDBirthDateIsValid(NSString *birthString) {
    if (birthString.length != 8) return NO;
    NSInteger year = [birthString substringWithRange:NSMakeRange(0, 4)].integerValue;
    NSInteger month = [birthString substringWithRange:NSMakeRange(4, 2)].integerValue;
    NSInteger day = [birthString substringWithRange:NSMakeRange(6, 2)].integerValue;
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = NSDateComponents.new;
    components.year = year;
    components.month = month;
    components.day = day;
    NSDate *birthDate = [calendar dateFromComponents:components];
    if (!birthDate) return NO;
    NSDateComponents *actual = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                                           fromDate:birthDate];
    if (actual.year != year || actual.month != month || actual.day != day) return NO;
    NSDateComponents *minComponents = NSDateComponents.new;
    minComponents.year = 1900;
    minComponents.month = 1;
    minComponents.day = 1;
    NSDate *minDate = [calendar dateFromComponents:minComponents];
    if ([birthDate compare:minDate] == NSOrderedAscending || [birthDate compare:NSDate.date] == NSOrderedDescending) return NO;
    return YES;
}

static BOOL JobsCNIDValidate18(NSString *id18, NSError **error) {
    if (!JobsCNIDMatches(id18, @"^\\d{17}[\\dX]$")) {
        JobsCNIDFillError(error, JobsCNIDErrorCodeFormat);
        return NO;
    }
    NSString *birthString = [id18 substringWithRange:NSMakeRange(6, 8)];
    if (!JobsCNIDBirthDateIsValid(birthString)) {
        JobsCNIDFillError(error, JobsCNIDErrorCodeBirthDate);
        return NO;
    }
    NSString *sequence = [id18 substringWithRange:NSMakeRange(14, 3)];
    if ([sequence isEqualToString:@"000"]) {
        JobsCNIDFillError(error, JobsCNIDErrorCodeSequence);
        return NO;
    }
    NSString *body17 = [id18 substringToIndex:17];
    if (JobsCNIDChecksumChar(body17) != [id18 characterAtIndex:17]) {
        JobsCNIDFillError(error, JobsCNIDErrorCodeChecksum);
        return NO;
    };return YES;
}

@implementation NSObject (RegularExpression)
#pragma mark —— 一些私有方法
/// 基本的验证方法：YES:成功 NO:失败
/// - Parameters:
///   - regEx: 校验格式
///   - data: 要校验的数据
+(BOOL)baseCheckForRegEx:(NSString *)regEx data:(NSString *)data{
    NSPredicate *card = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    return [card evaluateWithObject:data];
}
#pragma mark —— 校验只能输入n位的数字
+(BOOL)checkingNumberWithLength:(NSString *)length number:(NSString *)number{
    NSString *regEx = [NSString stringWithFormat:@"^\\d{%@}$", length];
    return [NSObject baseCheckForRegEx:regEx data:number];
}
#pragma mark —— 校验最少输入n位的数字
+(BOOL)checkingNumberWithLeastLength:(NSString *)leastLength number:(NSString *)number{
    NSString *regEx = [NSString stringWithFormat:@"^\\d{%@,}$", leastLength];
    return [NSObject baseCheckForRegEx:regEx data:number];
}
#pragma mark —— 密码校验
+(BOOL)lc_checkingPasswordWithShortest:(NSInteger)shortest
                               longest:(NSInteger)longest
                              password:(NSString *)pwd{
    NSString *regEx =[NSString stringWithFormat:@"^[a-zA-Z0-9]{%ld,%ld}+$", shortest, longest];
    return [NSObject baseCheckForRegEx:regEx data:pwd];
}
#pragma mark —— 邮箱校验
+(JobsRetBOOLByStrBlock _Nonnull)checkingEmail{
    @jobs_weakify(self)
    return ^BOOL(NSString *_Nullable email){
        @jobs_strongify(self)
        NSString *regEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        return [NSObject baseCheckForRegEx:regEx data:email];
    };
}
#pragma mark —— 验证(中国大陆)手机号
-(JobsRetBOOLByStrBlock _Nonnull)checkingMobile{
    @jobs_weakify(self)
    return ^BOOL(NSString *_Nullable mobile){
        @jobs_strongify(self)
        NSString *regEx = @"^1[3|4|5|7|8][0-9]\\d{8}$";
        return [NSObject baseCheckForRegEx:regEx data:mobile];
    };
}
#pragma mark —— 验证电话号
-(JobsRetBOOLByStrBlock _Nonnull)checkingPhoneNum{
    @jobs_weakify(self)
    return ^BOOL(NSString *_Nullable phone){
        @jobs_strongify(self)
        NSString *regEx = @"^(\\d{3,4}-)\\d{7,8}$";
        return [NSObject baseCheckForRegEx:regEx data:phone];
    };
}
#pragma mark —— 身份证号验证
-(JobsRetBOOLByStrBlock _Nonnull)checkingIdCard{
    @jobs_weakify(self)
    return ^BOOL(NSString *_Nullable idCard){
        @jobs_strongify(self)
        NSString *regEx = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
        return [NSObject baseCheckForRegEx:regEx data:idCard];
    };
}
/// 中国大陆公民身份证号码严格校验
+(BOOL)jobs_isValidCNID:(NSString *_Nullable)raw{
    return [NSObject jobs_validateCNID:raw error:nil].length > 0;
}
/// 中国大陆公民身份证号码严格校验，成功时返回标准化后的 18 位号码
+(NSString *_Nullable)jobs_validateCNID:(NSString *_Nullable)raw
                                  error:(NSError *_Nullable *_Nullable)error{
    NSString *idString = JobsCNIDNormalizedString(raw);
    if (!idString.length) {
        JobsCNIDFillError(error, JobsCNIDErrorCodeFormat);
        return nil;
    }
    if (JobsCNIDMatches(idString, @"^\\d{17}[\\dX]$")) {
        if (JobsCNIDValidate18(idString, error)) return idString;
        return nil;
    }
    if (JobsCNIDMatches(idString, @"^\\d{15}$")) {
        NSString *converted = [NSObject jobs_convertCNID15To18:idString centuryHint:19 error:error];
        if (!converted.length) return nil;
        if (JobsCNIDValidate18(converted, error)) return converted;
        return nil;
    }
    JobsCNIDFillError(error, JobsCNIDErrorCodeFormat);
    return nil;
}
/// 将 15 位身份证号码转换为 18 位身份证号码
+(NSString *_Nullable)jobs_convertCNID15To18:(NSString *_Nullable)id15
                                 centuryHint:(NSInteger)centuryHint
                                       error:(NSError *_Nullable *_Nullable)error{
    NSString *idString = JobsCNIDNormalizedString(id15);
    if (!JobsCNIDMatches(idString, @"^\\d{15}$")) {
        JobsCNIDFillError(error, JobsCNIDErrorCodeFormat);
        return nil;
    }
    NSInteger safeCentury = centuryHint > 0 ? centuryHint : 19;
    NSString *body17 = [NSString stringWithFormat:@"%@%02ld%@%@",
                        [idString substringToIndex:6],
                        (long)safeCentury,
                        [idString substringWithRange:NSMakeRange(6, 6)],
                        [idString substringFromIndex:12]];
    if (body17.length != 17) {
        JobsCNIDFillError(error, JobsCNIDErrorCodeFormat);
        return nil;
    };return [body17 stringByAppendingFormat:@"%C",JobsCNIDChecksumChar(body17)];
}
#pragma mark —— 由数字和26个英文字母组成的字符串
-(JobsRetBOOLByStrBlock _Nonnull)checkingStrFormNumberAndLetter{
    return ^BOOL(NSString *_Nullable data){
        NSString *regEx = @"^[A-Za-z0-9]+$";
        return [NSObject baseCheckForRegEx:regEx data:data];
    };
}
#pragma mark —— 26位英文大小写字母组成的字符
-(JobsRetBOOLByStrBlock _Nonnull)checkingStrFormLowerAndUpperLetter{
    return ^BOOL(NSString *_Nullable data){
        NSString *regEx = @"^[A-Za-z]+$";
        return [NSObject baseCheckForRegEx:regEx data:data];
    };
}
#pragma mark —— 小写字母
-(JobsRetBOOLByStrBlock _Nonnull)checkingLowerLetter{
    return ^BOOL(NSString *_Nullable lowerCase){
        NSString *regEx = @"^[a-z]+$";
        return [NSObject baseCheckForRegEx:regEx data:lowerCase];
    };
}
#pragma mark —— 大写字母
-(JobsRetBOOLByStrBlock _Nonnull)checkingUpperLetter{
    return ^BOOL(NSString *_Nullable upperCase){
        NSString *regEx = @"^[A-Z]+$";
        return [NSObject baseCheckForRegEx:regEx data:upperCase];
    };
}
#pragma mark —— 特殊字符
-(JobsRetBOOLByStrBlock _Nonnull)checkingSpecialChar{
    return ^BOOL(NSString *_Nullable data){
        NSString *regEx = @"[^%&',;=?$\x22]+";
        return [NSObject baseCheckForRegEx:regEx data:data];
    };
}
#pragma mark —— 只能输入数字
-(JobsRetBOOLByStrBlock _Nonnull)checkingNumber{
    return ^BOOL(NSString *_Nullable number){
        NSString *regEx = @"^[0-9]*$";
        return [NSObject baseCheckForRegEx:regEx data:number];
    };
}

@end

//
//  JobsStringUtils.h
//  JobsStringUtils
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSSTRINGUTILS_9B277DEF34
#define JOBS_HEADER_GUARD_JOBSSTRINGUTILS_9B277DEF34

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#ifndef FORMAT_STRING
#define FORMAT_STRING(fmt, val) [NSString stringWithFormat:(fmt), (val)]
#endif

FOUNDATION_EXPORT NSMutableString *JobsMutableString(NSString * _Nullable value);
FOUNDATION_EXPORT NSURL * _Nullable JobsUrl(NSString * _Nullable value);
FOUNDATION_EXPORT NSURL * _Nullable JobsFileUrl(NSString * _Nullable value);
/// 要判nil和NULL，必须用类方法或者内联函数，在实例方法里面nil和NULL会被包装为空串
FOUNDATION_EXPORT BOOL isNull(id _Nullable value);
FOUNDATION_EXPORT BOOL isValue(id _Nullable value);
FOUNDATION_EXPORT BOOL JobsCanOpenUrl(NSString * _Nullable value);
FOUNDATION_EXPORT NSString *Guard(NSString * _Nullable value);
FOUNDATION_EXPORT NSString *_Nonnull toStringByFloatDecimalPlaces(float i, NSUInteger decimalPlaces);
FOUNDATION_EXPORT NSString *_Nonnull StringWithUTF8String(const char * _Nullable value);
FOUNDATION_EXPORT NSString *_Nonnull JobsFormattedString(NSString *format, ...) NS_FORMAT_FUNCTION(1, 2);
FOUNDATION_EXPORT NSString *_Nonnull toStringByID(id _Nullable i);
FOUNDATION_EXPORT NSString *_Nonnull toStringByInt(int i);
FOUNDATION_EXPORT NSString *_Nonnull toStringByFloat(float i);
FOUNDATION_EXPORT NSString *_Nonnull toStringByDouble(double i);
FOUNDATION_EXPORT NSString *_Nonnull toStringByShort(short i);
FOUNDATION_EXPORT NSString *_Nonnull toStringByUnsignedShort(unsigned short i);
FOUNDATION_EXPORT NSString *_Nonnull toStringByNSInteger(NSInteger i);
FOUNDATION_EXPORT NSString *_Nonnull toStringByNSUInteger(NSUInteger i);
FOUNDATION_EXPORT NSString *_Nonnull toStringByLong(long i);
FOUNDATION_EXPORT NSString *_Nonnull toStringByLongLong(long long i);
FOUNDATION_EXPORT NSString *_Nonnull toStringByChar(char i);
FOUNDATION_EXPORT NSString *_Nonnull toStringByUnsignedChar(unsigned char i);

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSSTRINGUTILS_9B277DEF34 */

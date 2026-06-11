//
//  NSNumber+Extra.m
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSNumber+Extra.h"

@implementation NSNumber (Extra)

+(JobsRetNumberByCharBlock _Nonnull)initByChar{
    return ^__kindof NSNumber *_Nullable(char data){
        return [NSNumber numberWithChar:data];
    };
}

+(JobsRetNumberByUnsignedCharBlock _Nonnull)initByUnsignedChar{
    return ^__kindof NSNumber *_Nullable(unsigned char data){
        return [NSNumber numberWithUnsignedChar:data];
    };
}

+(JobsRetNumberByShortBlock _Nonnull)initByShort{
    return ^__kindof NSNumber *_Nullable(short data){
        return [NSNumber numberWithShort:data];
    };
}

+(JobsRetNumberByUnsignedShortBlock _Nonnull)initByUnsignedShort{
    return ^__kindof NSNumber *_Nullable(unsigned short data){
        return [NSNumber numberWithUnsignedShort:data];
    };
}

+(JobsRetNumberByIntBlock _Nonnull)initByInt{
    return ^__kindof NSNumber *_Nullable(int data){
        return [NSNumber numberWithInt:data];
    };
}

+(JobsRetNumberByUnsignedIntBlock _Nonnull)initByUnsignedInt{
    return ^__kindof NSNumber *_Nullable(unsigned int data){
        return [NSNumber numberWithUnsignedInt:data];
    };
}

+(JobsRetNumberByLongBlock _Nonnull)initByLong{
    return ^__kindof NSNumber *_Nullable(long data){
        return [NSNumber numberWithLong:data];
    };
}

+(JobsRetNumberByUnsignedLongBlock _Nonnull)initByUnsignedLong{
    return ^__kindof NSNumber *_Nullable(unsigned long data){
        return [NSNumber numberWithUnsignedLong:data];
    };
}

+(JobsRetNumberByLongLongBlock _Nonnull)initByLongLong{
    return ^__kindof NSNumber *_Nullable(long long data){
        return [NSNumber numberWithLongLong:data];
    };
}

+(JobsRetNumberByUnsignedLongLongBlock _Nonnull)initByUnsignedLongLong{
    return ^__kindof NSNumber *_Nullable(unsigned long long data){
        return [NSNumber numberWithUnsignedLongLong:data];
    };
}

+(JobsRetNumberByFloatBlock _Nonnull)initByFloat{
    return ^__kindof NSNumber *_Nullable(float data){
        return [NSNumber numberWithFloat:data];
    };
}

+(JobsRetNumberByDoubleBlock _Nonnull)initByDouble{
    return ^__kindof NSNumber *_Nullable(double data){
        return [NSNumber numberWithDouble:data];
    };
}

+(JobsRetNumberByBOOLBlock _Nonnull)initByBOOL{
    return ^__kindof NSNumber *_Nullable(BOOL data){
        return [NSNumber numberWithBool:data];
    };
}

+(JobsRetNumberByNSIntegerBlock _Nonnull)initByNSInteger{
    return ^__kindof NSNumber *_Nullable(NSInteger data){
        return [NSNumber numberWithInteger:data];
    };
}

+(JobsRetNumberByNSUIntegerBlock _Nonnull)initByNSUInteger{
    return ^__kindof NSNumber *_Nullable(NSUInteger data){
        return [NSNumber numberWithUnsignedInteger:data];
    };
}
/// 特殊处理 CGFloat 类型
+(JobsRetNumberByCGFloatBlock _Nonnull)initByCGFloat{
    return ^__kindof NSNumber *_Nullable(CGFloat data){
        /// 由于 CGFloat 在不同平台上可能是 float 或 double，因此我们根据平台来封装
        #if TARGET_OS_MAC && !TARGET_OS_IPHONE
        return [NSNumber numberWithDouble:data]; // macOS 使用 double
        #else
        return [NSNumber numberWithFloat:data]; // iOS 使用 float
        #endif
    };
}

-(CGFloat)byFloat{
    /// 根据平台进行解包
    #if TARGET_OS_MAC && !TARGET_OS_IPHONE
    return [self doubleValue];  // macOS 使用 double
    #else
    return [self floatValue];   // iOS 使用 float
    #endif
}

-(JobsRetStrByNumberBlock _Nonnull)toString{
    @jobs_weakify(self)
    return ^NSString *_Nullable(NSNumber *_Nullable data) {
        @jobs_strongify(self)
        if(KindOfNumberCls(data)){
            return data.stringValue;
        }else return @"";
    };
}

-(NSString *)stringValueOrEmpty{
    if (self.intValue == -1) {
        return @""; // 返回空字符串
    };return self.stringValue;
}

-(JobsRetNumberByNSIntegerBlock _Nonnull)updateByStepInt{
    @jobs_weakify(self)
    return ^NSNumber *(NSInteger data){
        @jobs_strongify(self)
        return @(self.intValue + data);
    };
}

-(JobsRetNumberByCGFloatBlock _Nonnull)updateByStepFloat{
    @jobs_weakify(self)
    return ^NSNumber *(CGFloat data){
        @jobs_strongify(self)
        return @(self.floatValue + data);
    };
}

@end

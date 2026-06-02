//
//  JobsDefineFuncs.h
//  Pods
//
//  Created by Jobs on 2026/5/15.
//

#ifndef JobsDefineFuncs_h
#define JobsDefineFuncs_h

#import <UIKit/UIKit.h>
#import <JobsOCDefs/JobsDefineTimeEnums.h>
#import <JobsOCDefs/JobsDefineConstString.h>

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif
/// 根据 TimeZoneType 获取系统时区对象
/// 优先使用 IANA 时区名称，避免 PST、CST、BST 这类缩写带来的歧义
NS_INLINE NSTimeZone *_Nullable timeZone(TimeZoneType timeZoneType) {
    switch (timeZoneType) {
        case TimeZoneTypeUTC:
            return [NSTimeZone timeZoneWithName:@"UTC"]; // 协调世界时
        case TimeZoneTypeGMT:
            return [NSTimeZone timeZoneWithName:@"GMT"]; // 格林尼治标准时间
        case TimeZoneTypePST:
            return [NSTimeZone timeZoneWithName:@"America/Los_Angeles"]; // 太平洋时间
        case TimeZoneTypeEST:
            return [NSTimeZone timeZoneWithName:@"America/New_York"]; // 美国东部时间
        case TimeZoneTypeCST:
            return [NSTimeZone timeZoneWithName:@"America/Chicago"]; // 美国中部时间
        case TimeZoneTypeMST:
            return [NSTimeZone timeZoneWithName:@"America/Denver"]; // 美国山地时间
        case TimeZoneTypeCSTChina:
            return [NSTimeZone timeZoneWithName:@"Asia/Shanghai"]; // 中国标准时间
        case TimeZoneTypeJST:
            return [NSTimeZone timeZoneWithName:@"Asia/Tokyo"]; // 日本标准时间
        case TimeZoneTypeBST:
            return [NSTimeZone timeZoneWithName:@"Europe/London"]; // 英国时间
        case TimeZoneTypeAEST:
            return [NSTimeZone timeZoneWithName:@"Australia/Sydney"]; // 澳大利亚东部时间
        case TimeZoneTypeAWST:
            return [NSTimeZone timeZoneWithName:@"Australia/Perth"]; // 澳大利亚西部时间
        case TimeZoneTypeCET:
            return [NSTimeZone timeZoneWithName:@"Europe/Berlin"]; // 欧洲中部时间
        case TimeZoneTypeMSK:
            return [NSTimeZone timeZoneWithName:@"Europe/Moscow"]; // 莫斯科时间
        case TimeZoneTypeIST:
            return [NSTimeZone timeZoneWithName:@"Asia/Kolkata"]; // 印度标准时间
        case TimeZoneTypeBRT:
            return [NSTimeZone timeZoneWithName:@"America/Sao_Paulo"]; // 巴西利亚时间
        case TimeZoneTypeCSTMexico:
            return [NSTimeZone timeZoneWithName:@"America/Mexico_City"]; // 墨西哥城时间
        case TimeZoneTypeART:
            return [NSTimeZone timeZoneWithName:@"America/Argentina/Buenos_Aires"]; // 阿根廷时间
        case TimeZoneTypeHST:
            return [NSTimeZone timeZoneWithName:@"Pacific/Honolulu"]; // 夏威夷时间
        case TimeZoneTypeAKST:
            return [NSTimeZone timeZoneWithName:@"America/Anchorage"]; // 阿拉斯加时间
        case TimeZoneTypeCEST:
            return [NSTimeZone timeZoneWithName:@"Europe/Berlin"]; // 中欧时间
        case TimeZoneTypeEET:
            return [NSTimeZone timeZoneWithName:@"Europe/Helsinki"]; // 欧洲东部时间
        case TimeZoneTypeWET:
            return [NSTimeZone timeZoneWithName:@"Europe/Lisbon"]; // 欧洲西部时间
        case TimeZoneTypeNST:
            return [NSTimeZone timeZoneWithName:@"America/St_Johns"]; // 纽芬兰时间
        case TimeZoneTypeAST:
            return [NSTimeZone timeZoneWithName:@"America/Halifax"]; // 大西洋时间
        case TimeZoneTypePDT:
            return [NSTimeZone timeZoneWithName:@"America/Los_Angeles"]; // 太平洋时间
        case TimeZoneTypeMDT:
            return [NSTimeZone timeZoneWithName:@"America/Denver"]; // 山地时间
        case TimeZoneTypeCDT:
            return [NSTimeZone timeZoneWithName:@"America/Chicago"]; // 中部时间
        case TimeZoneTypeEDT:
            return [NSTimeZone timeZoneWithName:@"America/New_York"]; // 东部时间
        case TimeZoneTypeNZST:
            return [NSTimeZone timeZoneWithName:@"Pacific/Auckland"]; // 新西兰时间
        case TimeZoneTypeHKT:
            return [NSTimeZone timeZoneWithName:@"Asia/Hong_Kong"]; // 香港时间
        case TimeZoneTypeSGT:
            return [NSTimeZone timeZoneWithName:@"Asia/Singapore"]; // 新加坡时间
        case TimeZoneTypeMYT:
            return [NSTimeZone timeZoneWithName:@"Asia/Kuala_Lumpur"]; // 马来西亚时间
        case TimeZoneTypeKST:
            return [NSTimeZone timeZoneWithName:@"Asia/Seoul"]; // 韩国标准时间
        default:
            return [NSTimeZone defaultTimeZone]; // 默认返回系统时区
    }
}

NS_INLINE NSString * _Nullable httpMethod(YTKRequestMethod method){
    switch (method) {
        case YTKRequestMethodGET:return GET;break;
        case YTKRequestMethodPOST:return POST;break;
        case YTKRequestMethodPUT:return PUT;break;
        case YTKRequestMethodDELETE:return DELETE;break;
        case YTKRequestMethodPATCH: return PATCH;break;
        case YTKRequestMethodHEAD:return HEAD;break;
        default:
            return @"";
            break;
    }
}
///  "Passing address of non-local object to __autoreleasing parameter for write-back" 警告的原因是 Objective-C 对指针操作的内存管理有一套特殊的机制，特别是涉及 __autoreleasing、__strong 等修饰符时。
///  当你传递一个对象的指针（比如 UIView **）时，编译器可能会将这个指针的参数视为 __autoreleasing。而你试图传递一个本地对象的地址给 __autoreleasing 参数时，就会触发这个警告。简而言之，Objective-C 认为这样操作可能会引发内存管理上的问题。
///  要解决这个问题，首先可以强制指定参数为 __strong 以避免自动推导为 __autoreleasing
///  如果你希望在函数内部能够修改外部变量的值，你可以使用指针的指针（UIView **），传递变量的地址来改变原变量的值。
///  destroyView(&view);
NS_INLINE void destroyView(__strong __kindof UIView *_Nonnull *_Nonnull view) {
    [*view removeFromSuperview];
    *view = nil;
}

NS_INLINE CGRect exchangeWidthAndHeight(CGRect frame){
    CGFloat width = frame.size.width;
    CGFloat height = frame.size.height;
    return CGRectMake(frame.origin.x, frame.origin.y, height, width);
}

NS_INLINE CGRect exchangeXAndY(CGRect frame){
    CGFloat x = frame.origin.x;
    CGFloat y = frame.origin.y;
    return CGRectMake(y, x, frame.size.width, frame.size.height);
}

#ifndef GETMethod
#define GETMethod httpMethod(YTKRequestMethodGET)
#endif

#ifndef POSTMethod
#define POSTMethod httpMethod(YTKRequestMethodPOST)
#endif

#ifndef PUTMethod
#define PUTMethod httpMethod(YTKRequestMethodPUT)
#endif

#ifndef DELETEMethod
#define DELETEMethod httpMethod(YTKRequestMethodDELETE)
#endif

#ifndef PATCHMethod
#define PATCHMethod httpMethod(YTKRequestMethodPATCH)
#endif

#ifndef HEADMethod
#define HEADMethod httpMethod(YTKRequestMethodHEAD)
#endif

#endif /* JobsDefineFuncs_h */

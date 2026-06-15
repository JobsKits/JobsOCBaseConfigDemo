//
//  UIDevice+XMUtils.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIDevice+XMUtils.h"

@implementation UIDevice (JobsByOCPodsXMUtils)
/**

     获取硬件平台名称，叫 device model 或者 machine name
     @return 硬件平台名称，如 iPhone3,1、iPad7,4 等
 */
+(NSString * _Nullable)platform{
    size_t size;
    sysctlbyname("hw.machine",
                 NULL,
                 &size,
                 NULL,
                 0);
    char *machine = (char *)malloc(size);
    if (machine == NULL) {
        return nil;
    }
    sysctlbyname("hw.machine",
                 machine,
                 &size,
                 NULL,
                 0);
    NSString *platform = [NSString stringWithCString:machine
                                            encoding:NSUTF8StringEncoding];
    free(machine);
    return platform;
}
/// 机型判定
///
/// 最近一次更新日期：2026.04.15
/// 数据来源：https://www.theiphonewiki.com/wiki/Models 定位标识符 Identifier
+(JobsRetStrByStrBlock _Nonnull)platformBy{
    return ^__kindof NSString *_Nullable(__kindof NSString *_Nullable string) {
        if (!string.length) return nil;

        static NSDictionary<NSString *, NSString *> *platformMap = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            platformMap = @{
                /// iPhone
                @"iPhone1,1"  : @"iPhone 初代",
                @"iPhone1,2"  : @"iPhone 3G",
                @"iPhone2,1"  : @"iPhone 3GS",
                @"iPhone3,1"  : @"iPhone 4 (GSM)",
                @"iPhone3,2"  : @"iPhone 4 (GSM Rev A)",
                @"iPhone3,3"  : @"iPhone 4 (CDMA)",
                @"iPhone4,1"  : @"iPhone 4S",
                @"iPhone5,1"  : @"iPhone 5 (GSM)",
                @"iPhone5,2"  : @"iPhone 5 (Global)",
                @"iPhone5,3"  : @"iPhone 5c",
                @"iPhone5,4"  : @"iPhone 5c",
                @"iPhone6,1"  : @"iPhone 5s",
                @"iPhone6,2"  : @"iPhone 5s",
                @"iPhone7,1"  : @"iPhone 6 Plus",
                @"iPhone7,2"  : @"iPhone 6",
                @"iPhone8,1"  : @"iPhone 6s",
                @"iPhone8,2"  : @"iPhone 6s Plus",
                @"iPhone8,4"  : @"iPhone SE (1st generation)",
                @"iPhone9,1"  : @"iPhone 7",
                @"iPhone9,2"  : @"iPhone 7 Plus",
                @"iPhone9,3"  : @"iPhone 7",
                @"iPhone9,4"  : @"iPhone 7 Plus",
                @"iPhone10,1" : @"iPhone 8",
                @"iPhone10,2" : @"iPhone 8 Plus",
                @"iPhone10,3" : @"iPhone X",
                @"iPhone10,4" : @"iPhone 8",
                @"iPhone10,5" : @"iPhone 8 Plus",
                @"iPhone10,6" : @"iPhone X",
                @"iPhone11,2" : @"iPhone XS",
                @"iPhone11,4" : @"iPhone XS Max",
                @"iPhone11,6" : @"iPhone XS Max",
                @"iPhone11,8" : @"iPhone XR",
                @"iPhone12,1" : @"iPhone 11",
                @"iPhone12,3" : @"iPhone 11 Pro",
                @"iPhone12,5" : @"iPhone 11 Pro Max",
                @"iPhone12,8" : @"iPhone SE (2nd generation)",
                @"iPhone13,1" : @"iPhone 12 mini",
                @"iPhone13,2" : @"iPhone 12",
                @"iPhone13,3" : @"iPhone 12 Pro",
                @"iPhone13,4" : @"iPhone 12 Pro Max",
                @"iPhone14,2" : @"iPhone 13 Pro",
                @"iPhone14,3" : @"iPhone 13 Pro Max",
                @"iPhone14,4" : @"iPhone 13 mini",
                @"iPhone14,5" : @"iPhone 13",
                @"iPhone14,6" : @"iPhone SE (3rd generation)",
                @"iPhone14,7" : @"iPhone 14",
                @"iPhone14,8" : @"iPhone 14 Plus",
                @"iPhone15,2" : @"iPhone 14 Pro",
                @"iPhone15,3" : @"iPhone 14 Pro Max",
                @"iPhone15,4" : @"iPhone 15",
                @"iPhone15,5" : @"iPhone 15 Plus",
                @"iPhone16,1" : @"iPhone 15 Pro",
                @"iPhone16,2" : @"iPhone 15 Pro Max",

                /// 最新机型
                @"iPhone17,1" : @"iPhone 16 Pro",
                @"iPhone17,2" : @"iPhone 16 Pro Max",
                @"iPhone17,3" : @"iPhone 16",
                @"iPhone17,4" : @"iPhone 16 Plus",
                @"iPhone17,5" : @"iPhone 16e",

                @"iPhone18,1" : @"iPhone 17 Pro",
                @"iPhone18,2" : @"iPhone 17 Pro Max",
                @"iPhone18,3" : @"iPhone 17",
                @"iPhone18,4" : @"iPhone Air",
                @"iPhone18,5" : @"iPhone 17e",

                /// iPod touch
                @"iPod1,1"    : @"iPod touch (1st generation)",
                @"iPod2,1"    : @"iPod touch (2nd generation)",
                @"iPod3,1"    : @"iPod touch (3rd generation)",
                @"iPod4,1"    : @"iPod touch (4th generation)",
                @"iPod5,1"    : @"iPod touch (5th generation)",
                @"iPod7,1"    : @"iPod touch (6th generation)",
                @"iPod9,1"    : @"iPod touch (7th generation)",
                @"iPod9,2"    : @"iPod touch (未来模型)",

                /// iPad
                @"iPad1,1"    : @"iPad",
                @"iPad1,2"    : @"iPad 3G",
                @"iPad2,1"    : @"iPad 2 (WiFi)",
                @"iPad2,2"    : @"iPad 2 (GSM)",
                @"iPad2,3"    : @"iPad 2 (CDMA)",
                @"iPad2,4"    : @"iPad 2 (WiFi)",
                @"iPad2,5"    : @"iPad mini (WiFi)",
                @"iPad2,6"    : @"iPad mini (GSM)",
                @"iPad2,7"    : @"iPad mini (CDMA)",
                @"iPad3,1"    : @"iPad 3 (WiFi)",
                @"iPad3,2"    : @"iPad 3 (CDMA)",
                @"iPad3,3"    : @"iPad 3 (GSM)",
                @"iPad3,4"    : @"iPad 4 (WiFi)",
                @"iPad3,5"    : @"iPad 4 (GSM)",
                @"iPad3,6"    : @"iPad 4 (CDMA)",
                @"iPad4,1"    : @"iPad Air (WiFi)",
                @"iPad4,2"    : @"iPad Air (Cellular)",
                @"iPad4,3"    : @"iPad Air (China)",
                @"iPad4,4"    : @"iPad mini 2 (WiFi)",
                @"iPad4,5"    : @"iPad mini 2 (Cellular)",
                @"iPad4,6"    : @"iPad mini 2 (China)",
                @"iPad4,7"    : @"iPad mini 3 (WiFi)",
                @"iPad4,8"    : @"iPad mini 3 (Cellular)",
                @"iPad4,9"    : @"iPad mini 3 (China)",

                /// Apple TV
                @"AppleTV1,1"  : @"Apple TV (1st generation)",
                @"AppleTV2,1"  : @"Apple TV (2nd generation)",
                @"AppleTV3,1"  : @"Apple TV (3rd generation)",
                @"AppleTV3,2"  : @"Apple TV (3rd generation)",
                @"AppleTV5,3"  : @"Apple TV (4th generation)",
                @"AppleTV6,2"  : @"Apple TV 4K",
                @"AppleTV11,1" : @"Apple TV 4K (2nd generation)",
            };
        });

        NSString *result = platformMap[string];
        if (result.length) return result;

        /// Simulator
        if ([string isEqualToString:@"i386"] ||
            [string isEqualToString:@"x86_64"] ||
            [string isEqualToString:@"arm64"]) {
            return UIDevice.currentDevice.model.add(@" ").add(@"Simulator");
        }

        /// 未知机型兜底：直接返回原始 identifier，便于排查和后续补充
        return string;
    };
}
/// 获取设备型号名称（可以区分iOS模拟器）
+(NSString * _Nullable)platformNameStr{
    NSString *platformStr = self.platform;
    if (!platformStr) {
        return UIDevice.currentDevice.model; // e.g. @"iPhone", @"iPod touch"
    };return self.platformBy(platformStr);
}
/// 获取当前设备标识符Identifier（不区分iOS模拟器：把IOS模拟器当真机对待）
+(NSString * _Nullable)platformIDStr{
    return self.isSimulator ? UIDevice.simulatorModel : self.platform;
}
/// 判断当前机型是否是iphone6 及其以上机型,过滤掉对ipad的判断
+(BOOL)judgementUpperIphone6{
    NSString *str = UIDevice.platformNameStr;
    if (str.isEqualToString(@"iPhone 2G"))         return NO;
    if (str.isEqualToString(@"iPhone 3G"))         return NO;
    if (str.isEqualToString(@"iPhone 3GS"))        return NO;
    if (str.isEqualToString(@"iPhone 4"))          return NO;
    if (str.isEqualToString(@"iPhone 4S"))         return NO;
    if (str.isEqualToString(@"iPhone 5"))          return NO;
    if (str.isEqualToString(@"iPhone 5c"))         return NO;
    if (str.isEqualToString(@"iPhone 5s"))         return NO;
    if (str.isEqualToString(@"iPhone Simulator"))  return NO; /// iPhone 模拟器
    return YES;
}
/// 判断当前机型是否为全面屏 iPhone（基于 machine identifier）
/// 全面屏机型返回 YES，非全面屏机型返回 NO
+ (BOOL)isFullScreen {
    NSString *machine = UIDevice.currentDevice.machineModel;
    if (![machine hasPrefix:@"iPhone"]) return NO;

    return !([machine hasPrefix:@"iPhone8,"]
          || [machine hasPrefix:@"iPhone9,"]
          || [machine hasPrefix:@"iPhone10,1"]
          || [machine hasPrefix:@"iPhone10,2"]
          || [machine hasPrefix:@"iPhone10,4"]
          || [machine hasPrefix:@"iPhone10,5"]
          || [machine hasPrefix:@"iPhone12,8"]
          || [machine hasPrefix:@"iPhone14,6"]);
}
/// 判断当前是否是iOS模拟器
+(BOOL)isSimulator{
    NSString *str = UIDevice.platformNameStr;
    return str.isEqualToString(@"iPhone Simulator");
}
/// 判断当前手机设备是否为刘海屏（兼容iOS模拟器）
+(BOOL)isBangScreen{
    if (@available(iOS 11.0, *)) {
        CGFloat topInset = jobsGetMainWindow().safeAreaInsets.top;
        return topInset > 20.0;
    };return NO;
}
/// 判断当前iOS机型
+(NSString *_Nullable)machineName{
    size_t size;
    sysctlbyname("hw.machine",
                 NULL,
                 &size,
                 NULL,
                 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine",
                 machine,
                 &size,
                 NULL, 0);
    NSString *machineString = [NSString stringWithCString:machine
                                                 encoding:NSUTF8StringEncoding];
    free(machine);
    return machineString;
}
/// 判定当前设备是否为iPhone（iOS模拟器也被视作为iPhone）
+(BOOL)isiPhone{
    return UIDevice.currentDevice.model.hasPrefix(@"iPhone");
}
/// 判断当前iOS模拟器所模拟的机型
+(NSString *_Nullable)simulatorModel{
    if (TARGET_OS_SIMULATOR) {
        NSDictionary *environment = NSProcessInfo.processInfo.environment;
        NSString *simulatorModel = environment[@"SIMULATOR_MODEL_IDENTIFIER"];
        return simulatorModel;
    };return nil; /// 不在模拟器上运行，返回 nil 或其他合适的值
}
/**
 
    获取设备型号名称
    @return 设备型号名称，与 platformNameStr 一致，只查询一次然后缓存
 */
+(NSString *_Nullable)deviceName{
    static NSString *deviceName = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deviceName = UIDevice.platformNameStr;
        if (deviceName.length == 0) deviceName = @"iPhone";
    });return deviceName;
}

@end

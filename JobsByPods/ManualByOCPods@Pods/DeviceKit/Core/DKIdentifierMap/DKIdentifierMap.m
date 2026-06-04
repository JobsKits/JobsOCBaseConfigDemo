//
//  DKIdentifierMap.m
//  DeviceKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "DKIdentifierMap.h"
#import <DeviceKit/DKDevice.h>
#import <DeviceKit/DKDeviceType.h>

@interface DKDevice ()
@property (nonatomic, copy, readwrite) NSString *identifier;

@end

static NSDictionary<NSString *, NSNumber *> *DKIdentifierToTypeMap(void) {
    static NSDictionary<NSString *, NSNumber *> *m;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        m = @{
        @"AppleTV11,1": @(DKDeviceTypeappleTV4K2),
        @"AppleTV14,1": @(DKDeviceTypeappleTV4K3),
        @"AppleTV5,3": @(DKDeviceTypeappleTVHD),
        @"AppleTV6,2": @(DKDeviceTypeappleTV4K),
        @"AudioAccessory1,1": @(DKDeviceTypehomePod),
        @"Watch1,1": @(DKDeviceTypeappleWatchSeries0_38mm),
        @"Watch1,2": @(DKDeviceTypeappleWatchSeries0_42mm),
        @"Watch2,3": @(DKDeviceTypeappleWatchSeries2_38mm),
        @"Watch2,4": @(DKDeviceTypeappleWatchSeries2_42mm),
        @"Watch2,6": @(DKDeviceTypeappleWatchSeries1_38mm),
        @"Watch2,7": @(DKDeviceTypeappleWatchSeries1_42mm),
        @"Watch3,1": @(DKDeviceTypeappleWatchSeries3_38mm),
        @"Watch3,2": @(DKDeviceTypeappleWatchSeries3_42mm),
        @"Watch3,3": @(DKDeviceTypeappleWatchSeries3_38mm),
        @"Watch3,4": @(DKDeviceTypeappleWatchSeries3_42mm),
        @"Watch4,1": @(DKDeviceTypeappleWatchSeries4_40mm),
        @"Watch4,2": @(DKDeviceTypeappleWatchSeries4_44mm),
        @"Watch4,3": @(DKDeviceTypeappleWatchSeries4_40mm),
        @"Watch4,4": @(DKDeviceTypeappleWatchSeries4_44mm),
        @"Watch5,1": @(DKDeviceTypeappleWatchSeries5_40mm),
        @"Watch5,10": @(DKDeviceTypeappleWatchSE_44mm),
        @"Watch5,11": @(DKDeviceTypeappleWatchSE_40mm),
        @"Watch5,12": @(DKDeviceTypeappleWatchSE_44mm),
        @"Watch5,2": @(DKDeviceTypeappleWatchSeries5_44mm),
        @"Watch5,3": @(DKDeviceTypeappleWatchSeries5_40mm),
        @"Watch5,4": @(DKDeviceTypeappleWatchSeries5_44mm),
        @"Watch5,9": @(DKDeviceTypeappleWatchSE_40mm),
        @"Watch6,1": @(DKDeviceTypeappleWatchSeries6_40mm),
        @"Watch6,10": @(DKDeviceTypeappleWatchSE2_40mm),
        @"Watch6,11": @(DKDeviceTypeappleWatchSE2_44mm),
        @"Watch6,12": @(DKDeviceTypeappleWatchSE2_40mm),
        @"Watch6,13": @(DKDeviceTypeappleWatchSE2_44mm),
        @"Watch6,14": @(DKDeviceTypeappleWatchSeries8_41mm),
        @"Watch6,15": @(DKDeviceTypeappleWatchSeries8_45mm),
        @"Watch6,16": @(DKDeviceTypeappleWatchSeries8_41mm),
        @"Watch6,17": @(DKDeviceTypeappleWatchSeries8_45mm),
        @"Watch6,18": @(DKDeviceTypeappleWatchUltra),
        @"Watch6,2": @(DKDeviceTypeappleWatchSeries6_44mm),
        @"Watch6,3": @(DKDeviceTypeappleWatchSeries6_40mm),
        @"Watch6,4": @(DKDeviceTypeappleWatchSeries6_44mm),
        @"Watch6,6": @(DKDeviceTypeappleWatchSeries7_41mm),
        @"Watch6,7": @(DKDeviceTypeappleWatchSeries7_45mm),
        @"Watch6,8": @(DKDeviceTypeappleWatchSeries7_41mm),
        @"Watch6,9": @(DKDeviceTypeappleWatchSeries7_45mm),
        @"Watch7,10": @(DKDeviceTypeappleWatchSeries10_42mm),
        @"Watch7,11": @(DKDeviceTypeappleWatchSeries10_46mm),
        @"Watch7,3": @(DKDeviceTypeappleWatchSeries9_41mm),
        @"Watch7,4": @(DKDeviceTypeappleWatchSeries9_45mm),
        @"Watch7,5": @(DKDeviceTypeappleWatchUltra2),
        @"Watch7,8": @(DKDeviceTypeappleWatchSeries10_42mm),
        @"Watch7,9": @(DKDeviceTypeappleWatchSeries10_46mm),
        @"arm64": @(DKDeviceTypeSimulator),
        @"i386": @(DKDeviceTypeSimulator),
        @"iPad11,1": @(DKDeviceTypeiPadMini5),
        @"iPad11,2": @(DKDeviceTypeiPadMini5),
        @"iPad11,3": @(DKDeviceTypeiPadAir3),
        @"iPad11,4": @(DKDeviceTypeiPadAir3),
        @"iPad11,6": @(DKDeviceTypeiPad8),
        @"iPad11,7": @(DKDeviceTypeiPad8),
        @"iPad12,1": @(DKDeviceTypeiPad9),
        @"iPad12,2": @(DKDeviceTypeiPad9),
        @"iPad13,1": @(DKDeviceTypeiPadAir4),
        @"iPad13,10": @(DKDeviceTypeiPadPro12Inch5),
        @"iPad13,11": @(DKDeviceTypeiPadPro12Inch5),
        @"iPad13,16": @(DKDeviceTypeiPadAir5),
        @"iPad13,17": @(DKDeviceTypeiPadAir5),
        @"iPad13,18": @(DKDeviceTypeiPad10),
        @"iPad13,19": @(DKDeviceTypeiPad10),
        @"iPad13,2": @(DKDeviceTypeiPadAir4),
        @"iPad13,4": @(DKDeviceTypeiPadPro11Inch3),
        @"iPad13,5": @(DKDeviceTypeiPadPro11Inch3),
        @"iPad13,6": @(DKDeviceTypeiPadPro11Inch3),
        @"iPad13,7": @(DKDeviceTypeiPadPro11Inch3),
        @"iPad13,8": @(DKDeviceTypeiPadPro12Inch5),
        @"iPad13,9": @(DKDeviceTypeiPadPro12Inch5),
        @"iPad14,1": @(DKDeviceTypeiPadMini6),
        @"iPad14,10": @(DKDeviceTypeiPadAir13M2),
        @"iPad14,11": @(DKDeviceTypeiPadAir13M2),
        @"iPad14,2": @(DKDeviceTypeiPadMini6),
        @"iPad14,3": @(DKDeviceTypeiPadPro11Inch4),
        @"iPad14,4": @(DKDeviceTypeiPadPro11Inch4),
        @"iPad14,5": @(DKDeviceTypeiPadPro12Inch6),
        @"iPad14,6": @(DKDeviceTypeiPadPro12Inch6),
        @"iPad14,8": @(DKDeviceTypeiPadAir11M2),
        @"iPad14,9": @(DKDeviceTypeiPadAir11M2),
        @"iPad16,3": @(DKDeviceTypeiPadPro11M4),
        @"iPad16,4": @(DKDeviceTypeiPadPro11M4),
        @"iPad16,5": @(DKDeviceTypeiPadPro13M4),
        @"iPad16,6": @(DKDeviceTypeiPadPro13M4),
        @"iPad2,1": @(DKDeviceTypeiPad2),
        @"iPad2,2": @(DKDeviceTypeiPad2),
        @"iPad2,3": @(DKDeviceTypeiPad2),
        @"iPad2,4": @(DKDeviceTypeiPad2),
        @"iPad2,5": @(DKDeviceTypeiPadMini),
        @"iPad2,6": @(DKDeviceTypeiPadMini),
        @"iPad2,7": @(DKDeviceTypeiPadMini),
        @"iPad3,1": @(DKDeviceTypeiPad3),
        @"iPad3,2": @(DKDeviceTypeiPad3),
        @"iPad3,3": @(DKDeviceTypeiPad3),
        @"iPad3,4": @(DKDeviceTypeiPad4),
        @"iPad3,5": @(DKDeviceTypeiPad4),
        @"iPad3,6": @(DKDeviceTypeiPad4),
        @"iPad4,1": @(DKDeviceTypeiPadAir),
        @"iPad4,2": @(DKDeviceTypeiPadAir),
        @"iPad4,3": @(DKDeviceTypeiPadAir),
        @"iPad4,4": @(DKDeviceTypeiPadMini2),
        @"iPad4,5": @(DKDeviceTypeiPadMini2),
        @"iPad4,6": @(DKDeviceTypeiPadMini2),
        @"iPad4,7": @(DKDeviceTypeiPadMini3),
        @"iPad4,8": @(DKDeviceTypeiPadMini3),
        @"iPad4,9": @(DKDeviceTypeiPadMini3),
        @"iPad5,1": @(DKDeviceTypeiPadMini4),
        @"iPad5,2": @(DKDeviceTypeiPadMini4),
        @"iPad5,3": @(DKDeviceTypeiPadAir2),
        @"iPad5,4": @(DKDeviceTypeiPadAir2),
        @"iPad6,11": @(DKDeviceTypeiPad5),
        @"iPad6,12": @(DKDeviceTypeiPad5),
        @"iPad6,3": @(DKDeviceTypeiPadPro9Inch),
        @"iPad6,4": @(DKDeviceTypeiPadPro9Inch),
        @"iPad6,7": @(DKDeviceTypeiPadPro12Inch),
        @"iPad6,8": @(DKDeviceTypeiPadPro12Inch),
        @"iPad7,1": @(DKDeviceTypeiPadPro12Inch2),
        @"iPad7,11": @(DKDeviceTypeiPad7),
        @"iPad7,12": @(DKDeviceTypeiPad7),
        @"iPad7,2": @(DKDeviceTypeiPadPro12Inch2),
        @"iPad7,3": @(DKDeviceTypeiPadPro10Inch),
        @"iPad7,4": @(DKDeviceTypeiPadPro10Inch),
        @"iPad7,5": @(DKDeviceTypeiPad6),
        @"iPad7,6": @(DKDeviceTypeiPad6),
        @"iPad8,1": @(DKDeviceTypeiPadPro11Inch),
        @"iPad8,10": @(DKDeviceTypeiPadPro11Inch2),
        @"iPad8,11": @(DKDeviceTypeiPadPro12Inch4),
        @"iPad8,12": @(DKDeviceTypeiPadPro12Inch4),
        @"iPad8,2": @(DKDeviceTypeiPadPro11Inch),
        @"iPad8,3": @(DKDeviceTypeiPadPro11Inch),
        @"iPad8,4": @(DKDeviceTypeiPadPro11Inch),
        @"iPad8,5": @(DKDeviceTypeiPadPro12Inch3),
        @"iPad8,6": @(DKDeviceTypeiPadPro12Inch3),
        @"iPad8,7": @(DKDeviceTypeiPadPro12Inch3),
        @"iPad8,8": @(DKDeviceTypeiPadPro12Inch3),
        @"iPad8,9": @(DKDeviceTypeiPadPro11Inch2),
        @"iPhone10,1": @(DKDeviceTypeiPhone8),
        @"iPhone10,2": @(DKDeviceTypeiPhone8Plus),
        @"iPhone10,3": @(DKDeviceTypeiPhoneX),
        @"iPhone10,4": @(DKDeviceTypeiPhone8),
        @"iPhone10,5": @(DKDeviceTypeiPhone8Plus),
        @"iPhone10,6": @(DKDeviceTypeiPhoneX),
        @"iPhone11,2": @(DKDeviceTypeiPhoneXS),
        @"iPhone11,4": @(DKDeviceTypeiPhoneXSMax),
        @"iPhone11,6": @(DKDeviceTypeiPhoneXSMax),
        @"iPhone11,8": @(DKDeviceTypeiPhoneXR),
        @"iPhone12,1": @(DKDeviceTypeiPhone11),
        @"iPhone12,3": @(DKDeviceTypeiPhone11Pro),
        @"iPhone12,5": @(DKDeviceTypeiPhone11ProMax),
        @"iPhone12,8": @(DKDeviceTypeiPhoneSE2),
        @"iPhone13,1": @(DKDeviceTypeiPhone12Mini),
        @"iPhone13,2": @(DKDeviceTypeiPhone12),
        @"iPhone13,3": @(DKDeviceTypeiPhone12Pro),
        @"iPhone13,4": @(DKDeviceTypeiPhone12ProMax),
        @"iPhone14,2": @(DKDeviceTypeiPhone13Pro),
        @"iPhone14,3": @(DKDeviceTypeiPhone13ProMax),
        @"iPhone14,4": @(DKDeviceTypeiPhone13Mini),
        @"iPhone14,5": @(DKDeviceTypeiPhone13),
        @"iPhone14,6": @(DKDeviceTypeiPhoneSE3),
        @"iPhone14,7": @(DKDeviceTypeiPhone14),
        @"iPhone14,8": @(DKDeviceTypeiPhone14Plus),
        @"iPhone15,2": @(DKDeviceTypeiPhone14Pro),
        @"iPhone15,3": @(DKDeviceTypeiPhone14ProMax),
        @"iPhone15,4": @(DKDeviceTypeiPhone15),
        @"iPhone15,5": @(DKDeviceTypeiPhone15Plus),
        @"iPhone16,1": @(DKDeviceTypeiPhone15Pro),
        @"iPhone16,2": @(DKDeviceTypeiPhone15ProMax),
        @"iPhone17,1": @(DKDeviceTypeiPhone16Pro),
        @"iPhone17,2": @(DKDeviceTypeiPhone16ProMax),
        @"iPhone17,3": @(DKDeviceTypeiPhone16),
        @"iPhone17,4": @(DKDeviceTypeiPhone16Plus),
        @"iPhone3,1": @(DKDeviceTypeiPhone4),
        @"iPhone3,2": @(DKDeviceTypeiPhone4),
        @"iPhone3,3": @(DKDeviceTypeiPhone4),
        @"iPhone4,1": @(DKDeviceTypeiPhone4s),
        @"iPhone5,1": @(DKDeviceTypeiPhone5),
        @"iPhone5,2": @(DKDeviceTypeiPhone5),
        @"iPhone5,3": @(DKDeviceTypeiPhone5c),
        @"iPhone5,4": @(DKDeviceTypeiPhone5c),
        @"iPhone6,1": @(DKDeviceTypeiPhone5s),
        @"iPhone6,2": @(DKDeviceTypeiPhone5s),
        @"iPhone7,1": @(DKDeviceTypeiPhone6Plus),
        @"iPhone7,2": @(DKDeviceTypeiPhone6),
        @"iPhone8,1": @(DKDeviceTypeiPhone6s),
        @"iPhone8,2": @(DKDeviceTypeiPhone6sPlus),
        @"iPhone8,4": @(DKDeviceTypeiPhoneSE),
        @"iPhone9,1": @(DKDeviceTypeiPhone7),
        @"iPhone9,2": @(DKDeviceTypeiPhone7Plus),
        @"iPhone9,3": @(DKDeviceTypeiPhone7),
        @"iPhone9,4": @(DKDeviceTypeiPhone7Plus),
        @"iPod5,1": @(DKDeviceTypeiPodTouch5),
        @"iPod7,1": @(DKDeviceTypeiPodTouch6),
        @"iPod9,1": @(DKDeviceTypeiPodTouch7),
        @"x86_64": @(DKDeviceTypeSimulator),
        };
    });
    return m;
}

static BOOL DKIsSimulatorArch(NSString *identifier) {
    return [identifier isEqualToString:@"i386"] || [identifier isEqualToString:@"x86_64"] || [identifier isEqualToString:@"arm64"];
}

DKDevice *DKMapIdentifierToDevice(NSString *identifier) {
    if (identifier.length == 0) {
        return [DKDevice unknownWithIdentifier:@"unknown"];
    }

    // Simulator: current process runs on x86_64/i386/arm64 (sim) and real model id is in env
    if (DKIsSimulatorArch(identifier)) {
        NSString *simID = NSProcessInfo.processInfo.environment[@"SIMULATOR_MODEL_IDENTIFIER"];
        if (simID.length == 0) simID = @"iOS";
        DKDevice *inner = DKMapIdentifierToDevice(simID);
        return [DKDevice simulatorWithSimulatedDevice:inner];
    }

    NSNumber *typeNum = DKIdentifierToTypeMap()[identifier];
    if (typeNum == nil) {
        return [DKDevice unknownWithIdentifier:identifier];
    }

    DKDevice *d = [DKDevice new];
    d.type = typeNum.integerValue;
    d.identifier = identifier;
    return d;
}

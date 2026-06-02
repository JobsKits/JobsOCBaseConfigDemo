#import "DKDeviceType.h"
#import "DKDevice.h"

NSString *DKDeviceTypeDescription(DKDeviceType type, id _Nullable simulatedDevice, NSString * _Nullable unknownIdentifier) {
    switch (type) {
        case DKDeviceTypeSimulator: {
            DKDevice *d = (DKDevice *)simulatedDevice;
            if (d) return [NSString stringWithFormat:@"Simulator (%@)", d.deviceDescription ?: @"Unknown"];
            return @"Simulator";
        }
        case DKDeviceTypeUnknown:
            return (unknownIdentifier.length > 0) ? unknownIdentifier : @"unknown";
        case DKDeviceTypeiPodTouch5: return @"iPod touch (5th generation)";
        case DKDeviceTypeiPodTouch6: return @"iPod touch (6th generation)";
        case DKDeviceTypeiPodTouch7: return @"iPod touch (7th generation)";
        case DKDeviceTypeiPhone4: return @"iPhone 4";
        case DKDeviceTypeiPhone4s: return @"iPhone 4s";
        case DKDeviceTypeiPhone5: return @"iPhone 5";
        case DKDeviceTypeiPhone5c: return @"iPhone 5c";
        case DKDeviceTypeiPhone5s: return @"iPhone 5s";
        case DKDeviceTypeiPhone6: return @"iPhone 6";
        case DKDeviceTypeiPhone6Plus: return @"iPhone 6 Plus";
        case DKDeviceTypeiPhone6s: return @"iPhone 6s";
        case DKDeviceTypeiPhone6sPlus: return @"iPhone 6s Plus";
        case DKDeviceTypeiPhone7: return @"iPhone 7";
        case DKDeviceTypeiPhone7Plus: return @"iPhone 7 Plus";
        case DKDeviceTypeiPhoneSE: return @"iPhone SE";
        case DKDeviceTypeiPhone8: return @"iPhone 8";
        case DKDeviceTypeiPhone8Plus: return @"iPhone 8 Plus";
        case DKDeviceTypeiPhoneX: return @"iPhone X";
        case DKDeviceTypeiPhoneXS: return @"iPhone Xs";
        case DKDeviceTypeiPhoneXSMax: return @"iPhone Xs Max";
        case DKDeviceTypeiPhoneXR: return @"iPhone Xʀ";
        case DKDeviceTypeiPhone11: return @"iPhone 11";
        case DKDeviceTypeiPhone11Pro: return @"iPhone 11 Pro";
        case DKDeviceTypeiPhone11ProMax: return @"iPhone 11 Pro Max";
        case DKDeviceTypeiPhoneSE2: return @"iPhone SE (2nd generation)";
        case DKDeviceTypeiPhone12: return @"iPhone 12";
        case DKDeviceTypeiPhone12Mini: return @"iPhone 12 mini";
        case DKDeviceTypeiPhone12Pro: return @"iPhone 12 Pro";
        case DKDeviceTypeiPhone12ProMax: return @"iPhone 12 Pro Max";
        case DKDeviceTypeiPhone13: return @"iPhone 13";
        case DKDeviceTypeiPhone13Mini: return @"iPhone 13 mini";
        case DKDeviceTypeiPhone13Pro: return @"iPhone 13 Pro";
        case DKDeviceTypeiPhone13ProMax: return @"iPhone 13 Pro Max";
        case DKDeviceTypeiPhoneSE3: return @"iPhone SE (3rd generation)";
        case DKDeviceTypeiPhone14: return @"iPhone 14";
        case DKDeviceTypeiPhone14Plus: return @"iPhone 14 Plus";
        case DKDeviceTypeiPhone14Pro: return @"iPhone 14 Pro";
        case DKDeviceTypeiPhone14ProMax: return @"iPhone 14 Pro Max";
        case DKDeviceTypeiPhone15: return @"iPhone 15";
        case DKDeviceTypeiPhone15Plus: return @"iPhone 15 Plus";
        case DKDeviceTypeiPhone15Pro: return @"iPhone 15 Pro";
        case DKDeviceTypeiPhone15ProMax: return @"iPhone 15 Pro Max";
        case DKDeviceTypeiPhone16: return @"iPhone 16";
        case DKDeviceTypeiPhone16Plus: return @"iPhone 16 Plus";
        case DKDeviceTypeiPhone16Pro: return @"iPhone 16 Pro";
        case DKDeviceTypeiPhone16ProMax: return @"iPhone 16 Pro Max";
        case DKDeviceTypeiPad2: return @"iPad 2";
        case DKDeviceTypeiPad3: return @"iPad (3rd generation)";
        case DKDeviceTypeiPad4: return @"iPad (4th generation)";
        case DKDeviceTypeiPadAir: return @"iPad Air";
        case DKDeviceTypeiPadAir2: return @"iPad Air 2";
        case DKDeviceTypeiPad5: return @"iPad (5th generation)";
        case DKDeviceTypeiPad6: return @"iPad (6th generation)";
        case DKDeviceTypeiPadAir3: return @"iPad Air (3rd generation)";
        case DKDeviceTypeiPad7: return @"iPad (7th generation)";
        case DKDeviceTypeiPad8: return @"iPad (8th generation)";
        case DKDeviceTypeiPad9: return @"iPad (9th generation)";
        case DKDeviceTypeiPad10: return @"iPad (10th generation)";
        case DKDeviceTypeiPadAir4: return @"iPad Air (4th generation)";
        case DKDeviceTypeiPadAir5: return @"iPad Air (5th generation)";
        case DKDeviceTypeiPadAir11M2: return @"iPad Air (11-inch) (M2)";
        case DKDeviceTypeiPadAir13M2: return @"iPad Air (13-inch) (M2)";
        case DKDeviceTypeiPadMini: return @"iPad Mini";
        case DKDeviceTypeiPadMini2: return @"iPad Mini 2";
        case DKDeviceTypeiPadMini3: return @"iPad Mini 3";
        case DKDeviceTypeiPadMini4: return @"iPad Mini 4";
        case DKDeviceTypeiPadMini5: return @"iPad Mini (5th generation)";
        case DKDeviceTypeiPadMini6: return @"iPad Mini (6th generation)";
        case DKDeviceTypeiPadPro9Inch: return @"iPad Pro (9.7-inch)";
        case DKDeviceTypeiPadPro12Inch: return @"iPad Pro (12.9-inch)";
        case DKDeviceTypeiPadPro12Inch2: return @"iPad Pro (12.9-inch) (2nd generation)";
        case DKDeviceTypeiPadPro10Inch: return @"iPad Pro (10.5-inch)";
        case DKDeviceTypeiPadPro11Inch: return @"iPad Pro (11-inch)";
        case DKDeviceTypeiPadPro12Inch3: return @"iPad Pro (12.9-inch) (3rd generation)";
        case DKDeviceTypeiPadPro11Inch2: return @"iPad Pro (11-inch) (2nd generation)";
        case DKDeviceTypeiPadPro12Inch4: return @"iPad Pro (12.9-inch) (4th generation)";
        case DKDeviceTypeiPadPro11Inch3: return @"iPad Pro (11-inch) (3rd generation)";
        case DKDeviceTypeiPadPro12Inch5: return @"iPad Pro (12.9-inch) (5th generation)";
        case DKDeviceTypeiPadPro11Inch4: return @"iPad Pro (11-inch) (4th generation)";
        case DKDeviceTypeiPadPro12Inch6: return @"iPad Pro (12.9-inch) (6th generation)";
        case DKDeviceTypeiPadPro11M4: return @"iPad Pro (11-inch) (M4)";
        case DKDeviceTypeiPadPro13M4: return @"iPad Pro (13-inch) (M4)";
        case DKDeviceTypehomePod: return @"HomePod";
        case DKDeviceTypeappleTVHD: return @"Apple TV HD";
        case DKDeviceTypeappleTV4K: return @"Apple TV 4K";
        case DKDeviceTypeappleTV4K2: return @"Apple TV 4K (2nd generation)";
        case DKDeviceTypeappleTV4K3: return @"Apple TV 4K (3rd generation)";
        case DKDeviceTypeappleWatchSeries0_38mm: return @"Apple Watch (1st generation) 38mm";
        case DKDeviceTypeappleWatchSeries0_42mm: return @"Apple Watch (1st generation) 42mm";
        case DKDeviceTypeappleWatchSeries1_38mm: return @"Apple Watch Series 1 38mm";
        case DKDeviceTypeappleWatchSeries1_42mm: return @"Apple Watch Series 1 42mm";
        case DKDeviceTypeappleWatchSeries2_38mm: return @"Apple Watch Series 2 38mm";
        case DKDeviceTypeappleWatchSeries2_42mm: return @"Apple Watch Series 2 42mm";
        case DKDeviceTypeappleWatchSeries3_38mm: return @"Apple Watch Series 3 38mm";
        case DKDeviceTypeappleWatchSeries3_42mm: return @"Apple Watch Series 3 42mm";
        case DKDeviceTypeappleWatchSeries4_40mm: return @"Apple Watch Series 4 40mm";
        case DKDeviceTypeappleWatchSeries4_44mm: return @"Apple Watch Series 4 44mm";
        case DKDeviceTypeappleWatchSeries5_40mm: return @"Apple Watch Series 5 40mm";
        case DKDeviceTypeappleWatchSeries5_44mm: return @"Apple Watch Series 5 44mm";
        case DKDeviceTypeappleWatchSeries6_40mm: return @"Apple Watch Series 6 40mm";
        case DKDeviceTypeappleWatchSeries6_44mm: return @"Apple Watch Series 6 44mm";
        case DKDeviceTypeappleWatchSE_40mm: return @"Apple Watch SE 40mm";
        case DKDeviceTypeappleWatchSE_44mm: return @"Apple Watch SE 44mm";
        case DKDeviceTypeappleWatchSeries7_41mm: return @"Apple Watch Series 7 41mm";
        case DKDeviceTypeappleWatchSeries7_45mm: return @"Apple Watch Series 7 45mm";
        case DKDeviceTypeappleWatchSeries8_41mm: return @"Apple Watch Series 8 41mm";
        case DKDeviceTypeappleWatchSeries8_45mm: return @"Apple Watch Series 8 45mm";
        case DKDeviceTypeappleWatchSE2_40mm: return @"Apple Watch SE (2nd generation) 40mm";
        case DKDeviceTypeappleWatchSE2_44mm: return @"Apple Watch SE (2nd generation) 44mm";
        case DKDeviceTypeappleWatchUltra: return @"Apple Watch Ultra";
        case DKDeviceTypeappleWatchSeries9_41mm: return @"Apple Watch Series 9 41mm";
        case DKDeviceTypeappleWatchSeries9_45mm: return @"Apple Watch Series 9 45mm";
        case DKDeviceTypeappleWatchUltra2: return @"Apple Watch Ultra2";
        case DKDeviceTypeappleWatchSeries10_42mm: return @"Apple Watch Series 10 42mm";
        case DKDeviceTypeappleWatchSeries10_46mm: return @"Apple Watch Series 10 46mm";
    }
    return @"unknown";
}

NSUInteger DKApplePencilSupportForType(DKDeviceType type, id _Nullable simulatedDevice, NSString * _Nullable unknownIdentifier) {
    (void)unknownIdentifier;
    if (type == DKDeviceTypeSimulator) {
        DKDevice *d = (DKDevice *)simulatedDevice;
        if (!d) return 0;
        return DKApplePencilSupportForType((DKDeviceType)d.type, d.simulatedDevice, d.unknownIdentifier);
    }
    switch (type) {
        case DKDeviceTypeiPad10: return (NSUInteger)4;
        case DKDeviceTypeiPad6: return (NSUInteger)1;
        case DKDeviceTypeiPad7: return (NSUInteger)1;
        case DKDeviceTypeiPad8: return (NSUInteger)1;
        case DKDeviceTypeiPad9: return (NSUInteger)1;
        case DKDeviceTypeiPadAir11M2: return (NSUInteger)10;
        case DKDeviceTypeiPadAir13M2: return (NSUInteger)10;
        case DKDeviceTypeiPadAir3: return (NSUInteger)1;
        case DKDeviceTypeiPadAir4: return (NSUInteger)6;
        case DKDeviceTypeiPadAir5: return (NSUInteger)6;
        case DKDeviceTypeiPadMini5: return (NSUInteger)1;
        case DKDeviceTypeiPadMini6: return (NSUInteger)6;
        case DKDeviceTypeiPadPro10Inch: return (NSUInteger)1;
        case DKDeviceTypeiPadPro11Inch: return (NSUInteger)6;
        case DKDeviceTypeiPadPro11Inch2: return (NSUInteger)6;
        case DKDeviceTypeiPadPro11Inch3: return (NSUInteger)6;
        case DKDeviceTypeiPadPro11Inch4: return (NSUInteger)6;
        case DKDeviceTypeiPadPro11M4: return (NSUInteger)14;
        case DKDeviceTypeiPadPro12Inch: return (NSUInteger)1;
        case DKDeviceTypeiPadPro12Inch2: return (NSUInteger)1;
        case DKDeviceTypeiPadPro12Inch3: return (NSUInteger)6;
        case DKDeviceTypeiPadPro12Inch4: return (NSUInteger)6;
        case DKDeviceTypeiPadPro12Inch5: return (NSUInteger)6;
        case DKDeviceTypeiPadPro12Inch6: return (NSUInteger)6;
        case DKDeviceTypeiPadPro13M4: return (NSUInteger)14;
        case DKDeviceTypeiPadPro9Inch: return (NSUInteger)1;
        default: return 0;
    }
}

//
//  DKBattery.m
//  DeviceKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "DKBattery.h"

#if TARGET_OS_IOS || TARGET_OS_TV || TARGET_OS_VISION
#import <UIKit/UIKit.h>
#endif

@implementation DKBattery

+ (DKBatteryState *)batteryState {
#if TARGET_OS_IOS || TARGET_OS_TV || TARGET_OS_VISION
    UIDevice *d = UIDevice.currentDevice;
    BOOL old = d.isBatteryMonitoringEnabled;
    d.batteryMonitoringEnabled = YES;

    float level = d.batteryLevel;
    UIDeviceBatteryState s = d.batteryState;

    d.batteryMonitoringEnabled = old;

    if (s == UIDeviceBatteryStateUnknown || level < 0) return [DKBatteryState unknown];
    if (s == UIDeviceBatteryStateFull) return [DKBatteryState full];
    if (s == UIDeviceBatteryStateCharging) return [DKBatteryState charging:level];
    if (s == UIDeviceBatteryStateUnplugged) return [DKBatteryState unplugged:level];
    return [DKBatteryState unknown];
#else
    return [DKBatteryState unknown];
#endif
}

@end

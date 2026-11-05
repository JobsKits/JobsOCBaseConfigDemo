//
//  JobsDeviceDescription.m
//  JobsDeviceDescription
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import "JobsDeviceDescription.h"

@implementation JobsDeviceDescription

+(JobsRetArrByVoidBlock _Nonnull)currentItems {
    return ^NSArray *{
        UIDevice *device = UIDevice.currentDevice;
        NSString *restrictedValue = @"iOS 不向普通应用提供";
        NSString *name = device.deviceName();
        NSString *deviceName = name.length ? name : @"系统未返回设备名称";
        NSString *systemVersion = [NSString stringWithFormat:@"%@ %@", device.deviceSystemName(), device.deviceSystemVersion()];
        return @[
            [JobsDeviceInfoItem itemWithTitle:@"UDID" value:restrictedValue restricted:YES],
            [JobsDeviceInfoItem itemWithTitle:@"设备名称" value:deviceName restricted:NO],
            [JobsDeviceInfoItem itemWithTitle:@"IMEI" value:restrictedValue restricted:YES],
            [JobsDeviceInfoItem itemWithTitle:@"系统版本" value:systemVersion restricted:NO],
            [JobsDeviceInfoItem itemWithTitle:@"序列号" value:restrictedValue restricted:YES]
        ];
    };
}

@end

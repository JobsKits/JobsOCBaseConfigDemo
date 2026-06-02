//
//  DKApplePencil.m
//  DeviceKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "DKApplePencil.h"
#import <DeviceKit/DKDeviceType.h>

@implementation DKApplePencil

+ (DKApplePencilSupport)applePencilSupportForDevice:(DKDevice *)device {
    // Implemented in generated code (currently placeholder until generator extended)
    return (DKApplePencilSupport)DKApplePencilSupportForType((DKDeviceType)device.type, device.simulatedDevice, device.unknownIdentifier);
}

@end

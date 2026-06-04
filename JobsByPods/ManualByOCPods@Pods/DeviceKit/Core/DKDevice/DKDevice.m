//
//  DKDevice.m
//  DeviceKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "DKDevice.h"
#import <DeviceKit/DKDeviceType.h>
#import <DeviceKit/DKIdentifierMap.h>

#import <sys/utsname.h>

@implementation DKBatteryState
+ (instancetype)unknown { DKBatteryState *s = [DKBatteryState new]; s.kind = DKBatteryStateKindUnknown; s.level = -1; return s; }
+ (instancetype)full { DKBatteryState *s = [DKBatteryState new]; s.kind = DKBatteryStateKindFull; s.level = 1; return s; }
+ (instancetype)charging:(float)level { DKBatteryState *s = [DKBatteryState new]; s.kind = DKBatteryStateKindCharging; s.level = level; return s; }
+ (instancetype)unplugged:(float)level { DKBatteryState *s = [DKBatteryState new]; s.kind = DKBatteryStateKindUnplugged; s.level = level; return s; }

@end

@interface DKDevice ()
@property (nonatomic, copy, readwrite) NSString *identifier;

@end

@implementation DKDevice

+ (NSString *)_machineIdentifier {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *machine = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return machine ?: @"unknown";
}

+ (instancetype)current {
    NSString *identifier = [self _machineIdentifier];
    return [self deviceWithIdentifier:identifier];
}

+ (instancetype)deviceWithIdentifier:(NSString *)identifier {
    return DKMapIdentifierToDevice(identifier);
}

+ (instancetype)simulatorWithSimulatedDevice:(DKDevice *)device {
    DKDevice *d = [DKDevice new];
    d.type = DKDeviceTypeSimulator;
    d.simulatedDevice = device;
    d.identifier = @"SIMULATOR";
    return d;
}

+ (instancetype)unknownWithIdentifier:(NSString *)identifier {
    DKDevice *d = [DKDevice new];
    d.type = DKDeviceTypeUnknown;
    d.unknownIdentifier = identifier;
    d.identifier = identifier;
    return d;
}

- (NSString *)deviceDescription {
    return DKDeviceTypeDescription((DKDeviceType)self.type, self.simulatedDevice, self.unknownIdentifier);
}

- (id)copyWithZone:(NSZone *)zone {
    DKDevice *d = [[[self class] allocWithZone:zone] init];
    d.type = self.type;
    d.simulatedDevice = [self.simulatedDevice copy];
    d.unknownIdentifier = [self.unknownIdentifier copy];
    d.identifier = [self.identifier copy];
    return d;
}

- (BOOL)isEqual:(id)object {
    if (object == self) return YES;
    if (![object isKindOfClass:[DKDevice class]]) return NO;
    DKDevice *other = (DKDevice *)object;
    return [[self deviceDescription] isEqualToString:[other deviceDescription]];
}

- (NSUInteger)hash {
    return self.deviceDescription.hash;
}

- (NSString *)description {
    return self.deviceDescription;
}

@end

//
//  JobsBluetoothPeripheral.m
//  JobsBluetooth
//
//  Created by Jobs on 2026年7月13日，星期一.
//

#import "JobsBluetoothPeripheral.h"

@implementation JobsBluetoothPeripheral

-(instancetype)initWithIdentifier:(NSUUID *)identifier
                             name:(NSString *)name
                             RSSI:(NSNumber *)RSSI
                advertisementData:(NSDictionary<NSString *,id> *)advertisementData
                        connected:(BOOL)connected{
    if (self = [super init]) {
        _identifier = identifier;
        _name = name.length ? name.copy : @"未命名设备";
        _RSSI = RSSI;
        _advertisementData = advertisementData.copy;
        _connected = connected;
    };return self;
}

@end

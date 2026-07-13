//
//  JobsBluetoothProfile.m
//  JobsBluetooth
//
//  Created by Jobs on 2026年7月13日，星期一.
//

#import "JobsBluetoothProfile.h"

@implementation JobsBluetoothProfile

-(instancetype)init{
    if (self = [super init]) {
        _identifier = @"default";
        _serviceUUIDs = @[];
        _scanTimeout = 10;
        _connectTimeout = 12;
        _maximumReconnectCount = 3;
    };return self;
}

-(id)copyWithZone:(NSZone *)zone{
    JobsBluetoothProfile *profile = [JobsBluetoothProfile new];
    profile.identifier = self.identifier;
    profile.serviceUUIDs = self.serviceUUIDs;
    profile.writeCharacteristicUUID = self.writeCharacteristicUUID;
    profile.notifyCharacteristicUUID = self.notifyCharacteristicUUID;
    profile.readCharacteristicUUID = self.readCharacteristicUUID;
    profile.scanTimeout = self.scanTimeout;
    profile.connectTimeout = self.connectTimeout;
    profile.maximumReconnectCount = self.maximumReconnectCount;
    profile.allowDuplicates = self.allowDuplicates;
    profile.encoder = self.encoder;
    profile.decoder = self.decoder;
    return profile;
}

-(JobsBluetoothProfile *(^)(NSString *))byIdentifier{return ^JobsBluetoothProfile *(NSString *value){self.identifier = value;return self;};}
-(JobsBluetoothProfile *(^)(NSArray<NSString *> *))byServiceUUIDStrings{return ^JobsBluetoothProfile *(NSArray<NSString *> *values){NSMutableArray *UUIDs = NSMutableArray.array;for (NSString *value in values) [UUIDs addObject:[CBUUID UUIDWithString:value]];self.serviceUUIDs = UUIDs.copy;return self;};}
-(JobsBluetoothProfile *(^)(NSString *))byWriteUUIDString{return ^JobsBluetoothProfile *(NSString *value){self.writeCharacteristicUUID = [CBUUID UUIDWithString:value];return self;};}
-(JobsBluetoothProfile *(^)(NSString *))byNotifyUUIDString{return ^JobsBluetoothProfile *(NSString *value){self.notifyCharacteristicUUID = [CBUUID UUIDWithString:value];return self;};}
-(JobsBluetoothProfile *(^)(NSString *))byReadUUIDString{return ^JobsBluetoothProfile *(NSString *value){self.readCharacteristicUUID = [CBUUID UUIDWithString:value];return self;};}
-(JobsBluetoothProfile *(^)(NSTimeInterval))byScanTimeout{return ^JobsBluetoothProfile *(NSTimeInterval value){self.scanTimeout = MAX(0, value);return self;};}
-(JobsBluetoothProfile *(^)(NSTimeInterval))byConnectTimeout{return ^JobsBluetoothProfile *(NSTimeInterval value){self.connectTimeout = MAX(0, value);return self;};}
-(JobsBluetoothProfile *(^)(NSUInteger))byMaximumReconnectCount{return ^JobsBluetoothProfile *(NSUInteger value){self.maximumReconnectCount = value;return self;};}
-(JobsBluetoothProfile *(^)(BOOL))byAllowDuplicates{return ^JobsBluetoothProfile *(BOOL value){self.allowDuplicates = value;return self;};}
-(JobsBluetoothProfile *(^)(JobsBluetoothEncodeBlock))byEncoder{return ^JobsBluetoothProfile *(JobsBluetoothEncodeBlock value){self.encoder = value;return self;};}
-(JobsBluetoothProfile *(^)(JobsBluetoothDecodeBlock))byDecoder{return ^JobsBluetoothProfile *(JobsBluetoothDecodeBlock value){self.decoder = value;return self;};}

@end

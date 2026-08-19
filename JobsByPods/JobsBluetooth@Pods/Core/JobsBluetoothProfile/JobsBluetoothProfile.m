//
//  JobsBluetoothProfile.m
//  JobsBluetooth
//
//  Created by Jobs on 2026年7月13日，星期一.
//

#import "JobsBluetoothProfile.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsBluetoothProfile
@interface JobsBluetoothProfile (JobsPropertyDSLSetterAutogen_bb910473ed)
-(void)setNotifyCharacteristicUUID:(CBUUID * _Nullable)data;
-(void)setReadCharacteristicUUID:(CBUUID * _Nullable)data;
-(void)setServiceUUIDs:(NSArray <CBUUID *>* _Nullable)data;
-(void)setWriteCharacteristicUUID:(CBUUID * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsBluetoothProfile

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
    profile.byIdentifier(self.identifier);
    profile.byServiceUUIDs(self.serviceUUIDs);
    profile.byWriteCharacteristicUUID(self.writeCharacteristicUUID);
    profile.byNotifyCharacteristicUUID(self.notifyCharacteristicUUID);
    profile.byReadCharacteristicUUID(self.readCharacteristicUUID);
    profile.byScanTimeout(self.scanTimeout);
    profile.byConnectTimeout(self.connectTimeout);
    profile.byMaximumReconnectCount(self.maximumReconnectCount);
    profile.byAllowDuplicates(self.allowDuplicates);
    profile.byEncoder(self.encoder);
    profile.byDecoder(self.decoder);
    return profile;
}

-(JobsRetJobsBluetoothProfileByNSStringBlock _Nonnull)byIdentifier{return ^JobsBluetoothProfile *(NSString *value){self.identifier = value;return self;};}
-(JobsRetJobsBluetoothProfileByNSArrayNSStringBlock _Nonnull)byServiceUUIDStrings{return ^JobsBluetoothProfile *(NSArray<NSString *> *values){NSMutableArray *UUIDs = NSMutableArray.array;for (NSString *value in values) [UUIDs addObject:[CBUUID UUIDWithString:value]];self.serviceUUIDs = UUIDs.copy;return self;};}
-(JobsRetJobsBluetoothProfileByNSStringBlock _Nonnull)byWriteUUIDString{return ^JobsBluetoothProfile *(NSString *value){self.writeCharacteristicUUID = [CBUUID UUIDWithString:value];return self;};}
-(JobsRetJobsBluetoothProfileByNSStringBlock _Nonnull)byNotifyUUIDString{return ^JobsBluetoothProfile *(NSString *value){self.notifyCharacteristicUUID = [CBUUID UUIDWithString:value];return self;};}
-(JobsRetJobsBluetoothProfileByNSStringBlock _Nonnull)byReadUUIDString{return ^JobsBluetoothProfile *(NSString *value){self.readCharacteristicUUID = [CBUUID UUIDWithString:value];return self;};}
-(JobsRetJobsBluetoothProfileByNSTimeIntervalBlock _Nonnull)byScanTimeout{return ^JobsBluetoothProfile *(NSTimeInterval value){self.scanTimeout = MAX(0, value);return self;};}
-(JobsRetJobsBluetoothProfileByNSTimeIntervalBlock _Nonnull)byConnectTimeout{return ^JobsBluetoothProfile *(NSTimeInterval value){self.connectTimeout = MAX(0, value);return self;};}
-(JobsRetJobsBluetoothProfileByNSUIntegerBlock _Nonnull)byMaximumReconnectCount{return ^JobsBluetoothProfile *(NSUInteger value){self.maximumReconnectCount = value;return self;};}
-(JobsRetJobsBluetoothProfileByBOOLBlock _Nonnull)byAllowDuplicates{return ^JobsBluetoothProfile *(BOOL value){self.allowDuplicates = value;return self;};}
-(JobsRetJobsBluetoothProfileByJobsBluetoothEncodeBlockBlock _Nonnull)byEncoder{return ^JobsBluetoothProfile *(JobsBluetoothEncodeBlock value){self.encoder = value;return self;};}
-(JobsRetJobsBluetoothProfileByJobsBluetoothDecodeBlockBlock _Nonnull)byDecoder{return ^JobsBluetoothProfile *(JobsBluetoothDecodeBlock value){self.decoder = value;return self;};}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsBluetoothProfile
-(JobsRetJobsBluetoothProfileByCBUUIDBlock _Nonnull)byNotifyCharacteristicUUID{
    @jobs_weakify(self)
    return ^__kindof JobsBluetoothProfile * _Nullable(CBUUID * _Nullable data){
        @jobs_strongify(self)
        [self setNotifyCharacteristicUUID:data];
        return self;
    };
}

-(JobsRetJobsBluetoothProfileByCBUUIDBlock _Nonnull)byReadCharacteristicUUID{
    @jobs_weakify(self)
    return ^__kindof JobsBluetoothProfile * _Nullable(CBUUID * _Nullable data){
        @jobs_strongify(self)
        [self setReadCharacteristicUUID:data];
        return self;
    };
}

-(JobsRetJobsBluetoothProfileByCBUUIDBlock _Nonnull)byWriteCharacteristicUUID{
    @jobs_weakify(self)
    return ^__kindof JobsBluetoothProfile * _Nullable(CBUUID * _Nullable data){
        @jobs_strongify(self)
        [self setWriteCharacteristicUUID:data];
        return self;
    };
}

-(JobsRetJobsBluetoothProfileByNSArrayCBUUIDBlock _Nonnull)byServiceUUIDs{
    @jobs_weakify(self)
    return ^__kindof JobsBluetoothProfile * _Nullable(NSArray <CBUUID *>* _Nullable data){
        @jobs_strongify(self)
        [self setServiceUUIDs:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsBluetoothProfile
@end

//
//  JobsBluetoothProfile.h
//  JobsBluetooth
//
//  Created by Jobs on 2026年7月13日，星期一.
//

#import <CoreBluetooth/CoreBluetooth.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#import <JobsBluetooth/JobsBluetoothTypes.h>

NS_ASSUME_NONNULL_BEGIN

/// 描述一种设备的稳定蓝牙能力。业务协议变化时只替换 Profile，不修改连接核心。
@interface JobsBluetoothProfile : NSObject <NSCopying>

Prop_copy()NSString *identifier;
Prop_copy()NSArray <CBUUID *>*serviceUUIDs;
Prop_strong(nullable)CBUUID *writeCharacteristicUUID;
Prop_strong(nullable)CBUUID *notifyCharacteristicUUID;
Prop_strong(nullable)CBUUID *readCharacteristicUUID;
Prop_assign()NSTimeInterval scanTimeout;
Prop_assign()NSTimeInterval connectTimeout;
Prop_assign()NSUInteger maximumReconnectCount;
Prop_assign()BOOL allowDuplicates;
Prop_copy(nullable)JobsBluetoothEncodeBlock encoder;
Prop_copy(nullable)JobsBluetoothDecodeBlock decoder;
Prop_copy(readonly)JobsBluetoothProfile *(^byIdentifier)(NSString *identifier);
Prop_copy(readonly)JobsBluetoothProfile *(^byServiceUUIDStrings)(NSArray <NSString *>*UUIDStrings);
Prop_copy(readonly)JobsBluetoothProfile *(^byWriteUUIDString)(NSString *UUIDString);
Prop_copy(readonly)JobsBluetoothProfile *(^byNotifyUUIDString)(NSString *UUIDString);
Prop_copy(readonly)JobsBluetoothProfile *(^byReadUUIDString)(NSString *UUIDString);
Prop_copy(readonly)JobsBluetoothProfile *(^byScanTimeout)(NSTimeInterval timeout);
Prop_copy(readonly)JobsBluetoothProfile *(^byConnectTimeout)(NSTimeInterval timeout);
Prop_copy(readonly)JobsBluetoothProfile *(^byMaximumReconnectCount)(NSUInteger count);
Prop_copy(readonly)JobsBluetoothProfile *(^byAllowDuplicates)(BOOL allowDuplicates);
Prop_copy(readonly)JobsBluetoothProfile *(^byEncoder)(JobsBluetoothEncodeBlock encoder);
Prop_copy(readonly)JobsBluetoothProfile *(^byDecoder)(JobsBluetoothDecodeBlock decoder);

@end

NS_ASSUME_NONNULL_END

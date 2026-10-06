//
//  JobsBluetoothWriteFixture.h
//  JobsBluetooth
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <CoreBluetooth/CoreBluetooth.h>

@interface JobsBluetoothWriteFixture : NSObject
@property(nonatomic, strong) NSMutableArray<NSData *> *sentChunks;
@property(nonatomic, assign) NSUInteger maximumWriteLength;
@property(nonatomic, copy) void (^onWrite)(NSData *data, CBCharacteristic *characteristic, CBCharacteristicWriteType type);
-(CBPeripheralState)state;
-(NSUInteger)maximumWriteValueLengthForType:(CBCharacteristicWriteType)type;
-(BOOL)canSendWriteWithoutResponse;
-(void)writeValue:(NSData *)data forCharacteristic:(CBCharacteristic *)characteristic type:(CBCharacteristicWriteType)type;
@end

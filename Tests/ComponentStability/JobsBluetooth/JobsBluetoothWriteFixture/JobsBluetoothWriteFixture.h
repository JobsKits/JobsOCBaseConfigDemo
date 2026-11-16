//
//  JobsBluetoothWriteFixture.h
//  JobsBluetooth
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <CoreBluetooth/CoreBluetooth.h>

// 用途：声明测试替身（fixture）；模拟外设写入能力、MTU 和发包记录，供分片与 ACK 顺序测试控制。
// 运行：由 JobsBluetooth-Unit-Stability 测试用例创建，不单独运行；不进入主 App，也不代表真实设备或外网验收。

@interface JobsBluetoothWriteFixture : NSObject

@property(nonatomic, strong) NSMutableArray<NSData *> *sentChunks;
@property(nonatomic, assign) NSUInteger maximumWriteLength;
@property(nonatomic, copy) void (^onWrite)(NSData *data, CBCharacteristic *characteristic, CBCharacteristicWriteType type);
-(CBPeripheralState)state;
-(NSUInteger)maximumWriteValueLengthForType:(CBCharacteristicWriteType)type;
-(BOOL)canSendWriteWithoutResponse;
-(void)writeValue:(NSData *)data forCharacteristic:(CBCharacteristic *)characteristic type:(CBCharacteristicWriteType)type;

@end

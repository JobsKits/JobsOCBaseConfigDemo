//
//  JobsBluetoothWriteFixture.m
//  JobsBluetooth
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsBluetoothWriteFixture.h"

// 用途：实现测试替身（fixture）；模拟外设写入能力、MTU 和发包记录，供分片与 ACK 顺序测试控制。
// 运行：由 JobsBluetooth-Unit-Stability 测试用例创建，不单独运行；不进入主 App，也不代表真实设备或外网验收。

@implementation JobsBluetoothWriteFixture

-(instancetype)init{
    if (self = [super init]) {
        _sentChunks = [NSMutableArray array];
        _maximumWriteLength = 3;
    }
    return self;
}

-(CBPeripheralState)state{
    return CBPeripheralStateConnected;
}

-(NSUInteger)maximumWriteValueLengthForType:(CBCharacteristicWriteType)type{
    return self.maximumWriteLength;
}

-(BOOL)canSendWriteWithoutResponse{
    return YES;
}

-(void)writeValue:(NSData *)data forCharacteristic:(CBCharacteristic *)characteristic type:(CBCharacteristicWriteType)type{
    [self.sentChunks addObject:data.copy];
    if (self.onWrite) {
        self.onWrite(data, characteristic, type);
    }
}

@end

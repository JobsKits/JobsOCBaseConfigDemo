//
//  JobsBluetoothWriteFixture.m
//  JobsBluetooth
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsBluetoothWriteFixture.h"

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

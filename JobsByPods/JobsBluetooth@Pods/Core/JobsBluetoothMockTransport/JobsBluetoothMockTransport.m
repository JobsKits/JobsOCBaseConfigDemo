//
//  JobsBluetoothMockTransport.m
//  JobsBluetooth
//
//  Created by Jobs on 2026年7月13日，星期一.
//

#import "JobsBluetoothMockTransport.h"

@implementation JobsBluetoothMockTransport
-(instancetype)init{
    if (self = [super init]) {
        _latency = 0.15;
        _enabled = YES;
    };return self;
}

-(JobsBluetoothMockTransport *(^)(NSTimeInterval))byLatency{return ^JobsBluetoothMockTransport *(NSTimeInterval value){self.latency = MAX(0, value);return self;};}
-(JobsBluetoothMockTransport *(^)(BOOL))byEnabled{return ^JobsBluetoothMockTransport *(BOOL value){self.enabled = value;return self;};}

-(NSArray<NSDictionary<NSString *,id> *> *)mockAdvertisements{
    return @[
        @{@"identifier": @"00000000-0000-0000-0000-000000000001", @"name": @"Jobs Sensor", @"RSSI": @(-42)},
        @{@"identifier": @"00000000-0000-0000-0000-000000000002", @"name": @"Jobs Light", @"RSSI": @(-67)},
        @{@"identifier": @"00000000-0000-0000-0000-000000000003", @"name": @"Jobs OTA", @"RSSI": @(-81)}
    ];
}

-(void)echoData:(NSData *)data completion:(void (^)(NSData *))completion{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.latency * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (completion) completion(data);
    });
}

@end

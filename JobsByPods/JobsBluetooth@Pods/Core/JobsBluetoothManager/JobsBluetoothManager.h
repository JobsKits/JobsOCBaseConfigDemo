//
//  JobsBluetoothManager.h
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

#import <JobsBluetooth/JobsBluetoothCommand.h>
#import <JobsBluetooth/JobsBluetoothMockTransport.h>
#import <JobsBluetooth/JobsBluetoothPeripheral.h>
#import <JobsBluetooth/JobsBluetoothProfile.h>

NS_ASSUME_NONNULL_BEGIN

/// 统一管理扫描、连接、服务发现、读写、通知、重连和命令队列。
@interface JobsBluetoothManager : NSObject

Prop_strong(readonly)dispatch_queue_t callbackQueue;
Prop_strong(readonly)JobsBluetoothProfile *profile;
Prop_strong(readonly)JobsBluetoothMockTransport *mockTransport;
Prop_assign(readonly)JobsBluetoothState state;
Prop_copy(readonly)NSArray <JobsBluetoothPeripheral *>*discoveredPeripherals;
Prop_copy(nullable)void (^stateChanged)(JobsBluetoothState state);
Prop_copy(nullable)void (^peripheralDiscovered)(JobsBluetoothPeripheral *peripheral);
Prop_copy(nullable)void (^dataReceived)(NSData *data, id _Nullable decodedObject);
Prop_copy(nullable)void (^logReceived)(NSString *message);

Prop_copy(readonly)JobsBluetoothManager *(^byCallbackQueue)(dispatch_queue_t queue);
Prop_copy(readonly)JobsBluetoothManager *(^byProfile)(JobsBluetoothProfile *profile);
Prop_copy(readonly)JobsBluetoothManager *(^byMockTransport)(JobsBluetoothMockTransport *transport);
Prop_copy(readonly)JobsBluetoothManager *(^onStateChanged)(void (^block)(JobsBluetoothState state));
Prop_copy(readonly)JobsBluetoothManager *(^onPeripheralDiscovered)(void (^block)(JobsBluetoothPeripheral *peripheral));
Prop_copy(readonly)JobsBluetoothManager *(^onDataReceived)(void (^block)(NSData *data, id _Nullable decodedObject));
Prop_copy(readonly)JobsBluetoothManager *(^onLog)(void (^block)(NSString *message));

-(instancetype)initWithProfile:(JobsBluetoothProfile *)profile NS_DESIGNATED_INITIALIZER;
-(instancetype)init;
-(void)startScan;
-(void)stopScan;
-(void)connectIdentifier:(NSUUID *)identifier;
-(void)disconnect;
-(void)read;
-(void)setNotifyEnabled:(BOOL)enabled;
-(void)sendCommand:(JobsBluetoothCommand *)command completion:(void (^)(NSData * _Nullable response, NSError * _Nullable error))completion;

@end

NS_ASSUME_NONNULL_END

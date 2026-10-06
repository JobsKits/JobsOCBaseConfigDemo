//
//  JobsBluetoothManager.h
//  JobsBluetooth
//
//  Created by Jobs on 2026年7月13日，星期一.
//

#import <math.h>
#import <CoreBluetooth/CoreBluetooth.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
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

/// 主队列管理扫描、连接、服务发现、读写、通知和命令队列；自动重连策略由调用方决定。
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
-(jobsByVoidBlock _Nonnull)startScan;
-(jobsByVoidBlock _Nonnull)stopScan;
-(jobsByNSUUIDBlock _Nonnull)connectIdentifier;
-(jobsByVoidBlock _Nonnull)disconnect;
-(jobsByVoidBlock _Nonnull)read;
-(jobsByBOOLBlock _Nonnull)setNotifyEnabled;
/// 单条在途命令，按优先级排队；matcher 存在时等待业务响应，否则完成只表示 GATT 写入被接受。
/// retryCount 仅用于协议明确幂等的命令；ACK 超时断开以隔离迟到 ACK。
-(void)sendCommand:(JobsBluetoothCommand *)command completion:(void (^)(NSData * _Nullable response, NSError * _Nullable error))completion;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsBluetoothManager
-(JobsRetJobsBluetoothManagerByCBPeripheralBlock _Nonnull)byConnectedPeripheral;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsBluetoothManager
@end

NS_ASSUME_NONNULL_END

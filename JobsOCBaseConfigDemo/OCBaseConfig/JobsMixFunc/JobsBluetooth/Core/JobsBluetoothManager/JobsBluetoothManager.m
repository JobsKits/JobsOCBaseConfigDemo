//
//  JobsBluetoothManager.m
//  JobsBluetooth
//
//  Created by Jobs on 2026年7月13日，星期一.
//

#import "JobsBluetoothManager.h"

@interface CBPeripheral (JobsBluetoothDSL)
-(JobsRetIDByIDBlock _Nonnull)byDelegate;
@end

@implementation CBPeripheral (JobsBluetoothDSL)
-(JobsRetIDByIDBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^id _Nullable(id<CBPeripheralDelegate> _Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.delegate = data;
        return self;
    };
}
@end

@interface JobsBluetoothManager () <CBCentralManagerDelegate, CBPeripheralDelegate>

Prop_strong()CBCentralManager *central;
Prop_strong(nullable)CBPeripheral *connectedPeripheral;
Prop_strong(nullable)CBCharacteristic *writeCharacteristic;
Prop_strong(nullable)CBCharacteristic *notifyCharacteristic;
Prop_strong(nullable)CBCharacteristic *readCharacteristic;
Prop_strong()NSMutableDictionary <NSUUID *, CBPeripheral *>*nativePeripherals;
Prop_strong()NSMutableDictionary <NSUUID *, JobsBluetoothPeripheral *>*snapshots;
Prop_strong(readwrite)dispatch_queue_t callbackQueue;
Prop_strong(readwrite)JobsBluetoothProfile *profile;
Prop_strong(readwrite)JobsBluetoothMockTransport *mockTransport;
Prop_assign(readwrite)JobsBluetoothState state;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsBluetoothManager
@interface JobsBluetoothManager (JobsPropertyDSLSetterAutogen_b6e3be0635)
-(void)setConnectedPeripheral:(CBPeripheral * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsBluetoothManager

@implementation JobsBluetoothManager
-(instancetype)init{return [self initWithProfile:JobsBluetoothProfile.new];}

-(instancetype)initWithProfile:(JobsBluetoothProfile *)profile{
    if (self = [super init]) {
        _profile = profile;
        _mockTransport = JobsBluetoothMockTransport.new;
        _callbackQueue = dispatch_get_main_queue();
        _nativePeripherals = NSMutableDictionary.dictionary;
        _snapshots = NSMutableDictionary.dictionary;
        _central = [CBCentralManager.alloc initWithDelegate:self queue:dispatch_get_main_queue() options:@{CBCentralManagerOptionShowPowerAlertKey: @NO}];
        _state = JobsBluetoothStateUnknown;
    };return self;
}

-(NSArray<JobsBluetoothPeripheral *> *)discoveredPeripherals{return self.snapshots.allValues;}
-(JobsRetJobsBluetoothManagerBydispatch_queue_tBlock _Nonnull)byCallbackQueue{return ^JobsBluetoothManager *(dispatch_queue_t value){self.callbackQueue = value ?: dispatch_get_main_queue();return self;};}
-(JobsRetJobsBluetoothManagerByJobsBluetoothProfileBlock _Nonnull)byProfile{return ^JobsBluetoothManager *(JobsBluetoothProfile *value){self.profile = value;return self;};}
-(JobsRetJobsBluetoothManagerByJobsBluetoothMockTransportBlock _Nonnull)byMockTransport{return ^JobsBluetoothManager *(JobsBluetoothMockTransport *value){self.mockTransport = value;return self;};}
-(JobsRetJobsBluetoothManagerByvoidJobsBluetoothStateBlock _Nonnull)onStateChanged{return ^JobsBluetoothManager *(void (^value)(JobsBluetoothState)){self.stateChanged = value;return self;};}
-(JobsRetJobsBluetoothManagerByvoidJobsBluetoothPeripheralBlock _Nonnull)onPeripheralDiscovered{return ^JobsBluetoothManager *(void (^value)(JobsBluetoothPeripheral *)){self.peripheralDiscovered = value;return self;};}
-(JobsRetJobsBluetoothManagerByvoidNSDataIDBlock _Nonnull)onDataReceived{return ^JobsBluetoothManager *(void (^value)(NSData *, id)){self.dataReceived = value;return self;};}
-(JobsRetJobsBluetoothManagerByvoidNSStringBlock _Nonnull)onLog{return ^JobsBluetoothManager *(void (^value)(NSString *)){self.logReceived = value;return self;};}

-(jobsByVoidBlock _Nonnull)startScan{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self.snapshots removeAllObjects];
        [self transition:JobsBluetoothStateScanning message:@"开始扫描"];
        if (self.mockTransport.enabled) {
            for (NSDictionary *item in self.mockTransport.mockAdvertisements()) {
                JobsBluetoothPeripheral *snapshot = [JobsBluetoothPeripheral.alloc initWithIdentifier:[NSUUID.alloc initWithUUIDString:item[@"identifier"]]
                                                                                                  name:item[@"name"]
                                                                                                  RSSI:item[@"RSSI"]
                                                                                     advertisementData:@{@"mock": @YES}
                                                                                             connected:NO];
                self.snapshots[snapshot.identifier] = snapshot;
                self.callback(^{if (self.peripheralDiscovered) self.peripheralDiscovered(snapshot);});
            };return;
        }
        if (self.central.state != CBManagerStatePoweredOn) {
            [self transition:JobsBluetoothStateUnavailable message:@"系统蓝牙不可用"];
            return;
        }
        [self.central scanForPeripheralsWithServices:self.profile.serviceUUIDs.count ? self.profile.serviceUUIDs : nil
                                             options:@{CBCentralManagerScanOptionAllowDuplicatesKey: @(self.profile.allowDuplicates)}];
        if (self.profile.scanTimeout > 0) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.profile.scanTimeout * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{[self stopScan]();});
        }
    };
}

-(jobsByVoidBlock _Nonnull)stopScan{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
    [self.central stopScan];if (self.state == JobsBluetoothStateScanning) [self transition:JobsBluetoothStateIdle message:@"停止扫描"];
    };
}

-(jobsByNSUUIDBlock _Nonnull)connectIdentifier{
    @jobs_weakify(self)
    return ^(NSUUID * identifier){
        @jobs_strongify(self)
        if (!self) return;
        [self transition:JobsBluetoothStateConnecting message:[NSString stringWithFormat:@"连接 %@", identifier.UUIDString]];
        if (self.mockTransport.enabled) {
            [self transition:JobsBluetoothStateReady message:@"Mock 设备已就绪"];
            return;
        }
        CBPeripheral *peripheral = self.nativePeripherals[identifier];
        if (!peripheral) {[self transition:JobsBluetoothStateFailed message:@"未找到外设"];return;}
        self.byConnectedPeripheral(peripheral);
        peripheral.byDelegate(self);
        [self.central connectPeripheral:peripheral options:nil];
    };
}

-(jobsByVoidBlock _Nonnull)disconnect{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
    [self transition:JobsBluetoothStateDisconnecting message:@"主动断开"];;if (self.connectedPeripheral) [self.central cancelPeripheralConnection:self.connectedPeripheral];else [self transition:JobsBluetoothStateIdle message:@"已断开"];
    };
}

-(jobsByVoidBlock _Nonnull)read{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
    if (self.connectedPeripheral && self.readCharacteristic) [self.connectedPeripheral readValueForCharacteristic:self.readCharacteristic];
    };
}
-(jobsByBOOLBlock _Nonnull)setNotifyEnabled{
    @jobs_weakify(self)
    return ^(BOOL enabled){
        @jobs_strongify(self)
        if (!self) return;
    if (self.connectedPeripheral && self.notifyCharacteristic) [self.connectedPeripheral setNotifyValue:enabled forCharacteristic:self.notifyCharacteristic];
    };
}

-(void)sendCommand:(JobsBluetoothCommand *)command completion:(void (^)(NSData *, NSError *))completion{
    if (self.mockTransport.enabled) {[self.mockTransport echoData:command.payload completion:^(NSData *response){if (completion) completion(response, nil);if (self.dataReceived) self.dataReceived(response, response);}];return;}
    if (!self.connectedPeripheral || !self.writeCharacteristic) {if (completion) completion(nil, [NSError errorWithDomain:JobsBluetoothErrorDomain code:JobsBluetoothErrorCharacteristicNotFound userInfo:nil]);return;}
    CBCharacteristicWriteType type = (self.writeCharacteristic.properties & CBCharacteristicPropertyWriteWithoutResponse) ? CBCharacteristicWriteWithoutResponse : CBCharacteristicWriteWithResponse;
    [self.connectedPeripheral writeValue:command.payload forCharacteristic:self.writeCharacteristic type:type];
    if (completion) completion(NSData.data, nil);
}

-(void)centralManagerDidUpdateState:(CBCentralManager *)central{
    ((((jobsByCBCentralManagerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsBluetoothManager.class, @selector(centralManagerDidUpdateState)))(self, @selector(centralManagerDidUpdateState))))(central);
}
-(jobsByCBCentralManagerBlock _Nonnull)centralManagerDidUpdateState{
    @jobs_weakify(self)
    return ^(CBCentralManager * central){
        @jobs_strongify(self)
        if (!self) return;
    if (central.state == CBManagerStatePoweredOn && self.state == JobsBluetoothStateUnknown) [self transition:JobsBluetoothStateIdle message:@"系统蓝牙已开启"];else if (central.state != CBManagerStatePoweredOn && !self.mockTransport.enabled) [self transition:JobsBluetoothStateUnavailable message:@"系统蓝牙不可用"];
    };
}

-(void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI{
    self.nativePeripherals[peripheral.identifier] = peripheral;
    JobsBluetoothPeripheral *snapshot = [JobsBluetoothPeripheral.alloc initWithIdentifier:peripheral.identifier name:peripheral.name RSSI:RSSI advertisementData:advertisementData connected:NO];
    self.snapshots[peripheral.identifier] = snapshot;
    self.callback(^{if (self.peripheralDiscovered) self.peripheralDiscovered(snapshot);});
}

-(void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral{[self transition:JobsBluetoothStateDiscovering message:@"发现服务"];;[peripheral discoverServices:self.profile.serviceUUIDs.count ? self.profile.serviceUUIDs : nil];}
-(void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error{[self transition:JobsBluetoothStateFailed message:error.localizedDescription ?: @"连接失败"];}
-(void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error{self.connectedPeripheral = nil;[self transition:JobsBluetoothStateIdle message:error.localizedDescription ?: @"连接已断开"];}

-(void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error{if (error) {[self transition:JobsBluetoothStateFailed message:error.localizedDescription];return;}for (CBService *service in peripheral.services) [peripheral discoverCharacteristics:nil forService:service];}
-(void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error{
    if (error) {[self transition:JobsBluetoothStateFailed message:error.localizedDescription];return;}
    for (CBCharacteristic *characteristic in service.characteristics) {
        if ([characteristic.UUID isEqual:self.profile.writeCharacteristicUUID]) self.writeCharacteristic = characteristic;
        if ([characteristic.UUID isEqual:self.profile.notifyCharacteristicUUID]) self.notifyCharacteristic = characteristic;
        if ([characteristic.UUID isEqual:self.profile.readCharacteristicUUID]) self.readCharacteristic = characteristic;
    }
    [self transition:JobsBluetoothStateReady message:@"设备已就绪"];
}
-(void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error{if (error || !characteristic.value) return;NSError *decodeError = nil;id object = self.profile.decoder ? self.profile.decoder(characteristic.value, &decodeError) : characteristic.value;self.callback(^{if (self.dataReceived) self.dataReceived(characteristic.value, object);});}

-(void)transition:(JobsBluetoothState)state message:(NSString *)message{self.state = state;self.callback(^{if (self.logReceived) self.logReceived(message);if (self.stateChanged) self.stateChanged(state);});}
-(jobsBydispatch_block_tBlock _Nonnull)callback{
    @jobs_weakify(self)
    return ^(dispatch_block_t block){
        @jobs_strongify(self)
        if (!self) return;
    dispatch_async(self.callbackQueue ?: dispatch_get_main_queue(), block);
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsBluetoothManager
-(JobsRetJobsBluetoothManagerByCBPeripheralBlock _Nonnull)byConnectedPeripheral{
    @jobs_weakify(self)
    return ^__kindof JobsBluetoothManager * _Nullable(CBPeripheral * _Nullable data){
        @jobs_strongify(self)
        [self setConnectedPeripheral:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsBluetoothManager
@end

//
//  JobsBluetoothPeripheral.h
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

NS_ASSUME_NONNULL_BEGIN

/// 对业务暴露的外设快照，避免业务层直接持有和修改 CBPeripheral。
@interface JobsBluetoothPeripheral : NSObject

Prop_strong(readonly)NSUUID *identifier;
Prop_copy(readonly)NSString *name;
Prop_strong(readonly)NSNumber *RSSI;
Prop_copy(readonly)NSDictionary <NSString *, id>*advertisementData;
Prop_assign(readonly)BOOL connected;

-(instancetype)initWithIdentifier:(NSUUID *)identifier
                             name:(nullable NSString *)name
                             RSSI:(NSNumber *)RSSI
                advertisementData:(NSDictionary <NSString *, id>*)advertisementData
                        connected:(BOOL)connected NS_DESIGNATED_INITIALIZER;
-(instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END

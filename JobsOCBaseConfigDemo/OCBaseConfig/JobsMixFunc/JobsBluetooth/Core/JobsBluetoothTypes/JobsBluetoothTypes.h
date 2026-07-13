//
//  JobsBluetoothTypes.h
//  JobsBluetooth
//
//  Created by Jobs on 2026年7月13日，星期一.
//

#import <CoreBluetooth/CoreBluetooth.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSErrorDomain const JobsBluetoothErrorDomain;

typedef NS_ENUM(NSInteger, JobsBluetoothState) {
    JobsBluetoothStateUnknown = 0,
    JobsBluetoothStateUnavailable,
    JobsBluetoothStateIdle,
    JobsBluetoothStateScanning,
    JobsBluetoothStateConnecting,
    JobsBluetoothStateDiscovering,
    JobsBluetoothStateReady,
    JobsBluetoothStateDisconnecting,
    JobsBluetoothStateReconnecting,
    JobsBluetoothStateFailed
};

typedef NS_ENUM(NSInteger, JobsBluetoothErrorCode) {
    JobsBluetoothErrorBluetoothUnavailable = 1000,
    JobsBluetoothErrorPeripheralNotFound,
    JobsBluetoothErrorConnectionTimeout,
    JobsBluetoothErrorCharacteristicNotFound,
    JobsBluetoothErrorCommandTimeout,
    JobsBluetoothErrorCancelled,
    JobsBluetoothErrorInvalidPacket,
    JobsBluetoothErrorTransportUnavailable
};

typedef NSData * _Nullable (^JobsBluetoothEncodeBlock)(id _Nullable payload, NSError **error);
typedef id _Nullable (^JobsBluetoothDecodeBlock)(NSData *data, NSError **error);
typedef BOOL (^JobsBluetoothResponseMatcherBlock)(NSData *data);

NS_ASSUME_NONNULL_END

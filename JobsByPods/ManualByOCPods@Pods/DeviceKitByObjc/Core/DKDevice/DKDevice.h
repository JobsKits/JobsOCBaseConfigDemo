#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, DKBatteryStateKind) {
    DKBatteryStateKindUnknown = 0,
    DKBatteryStateKindFull,
    DKBatteryStateKindCharging,
    DKBatteryStateKindUnplugged,
};

@interface DKBatteryState : NSObject
@property (nonatomic, assign) DKBatteryStateKind kind;
@property (nonatomic, assign) float level; // 0.0 ~ 1.0, charging/unplugged only
+ (instancetype)unknown;
+ (instancetype)full;
+ (instancetype)charging:(float)level;
+ (instancetype)unplugged:(float)level;
@end

typedef NS_OPTIONS(NSUInteger, DKApplePencilSupport) {
    DKApplePencilSupportNone = 0,
    DKApplePencilSupportFirstGeneration  = 1 << 0,
    DKApplePencilSupportSecondGeneration = 1 << 1,
    DKApplePencilSupportUSB_C            = 1 << 2,
    DKApplePencilSupportPro              = 1 << 3,
};

@class DKDevice;

@interface DKDevice : NSObject <NSCopying>

/// Backed by generated DKDeviceType enum
@property (nonatomic, assign) NSInteger type;

/// Swift: simulator(Device)
@property (nonatomic, strong, nullable) DKDevice *simulatedDevice;

/// Swift: unknown(String)
@property (nonatomic, copy, nullable) NSString *unknownIdentifier;

/// Swift: identifier (machine)
@property (nonatomic, copy, readonly) NSString *identifier;

/// Swift: description
@property (nonatomic, copy, readonly) NSString *deviceDescription;

+ (instancetype)current;
+ (instancetype)deviceWithIdentifier:(NSString *)identifier;

+ (instancetype)simulatorWithSimulatedDevice:(DKDevice *)device;
+ (instancetype)unknownWithIdentifier:(NSString *)identifier;

@end

NS_ASSUME_NONNULL_END

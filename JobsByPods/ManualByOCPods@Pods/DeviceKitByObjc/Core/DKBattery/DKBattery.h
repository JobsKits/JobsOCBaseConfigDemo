#import <Foundation/Foundation.h>
#import "DKDevice.h"

NS_ASSUME_NONNULL_BEGIN

@interface DKBattery : NSObject
+ (DKBatteryState *)batteryState;
@end

NS_ASSUME_NONNULL_END

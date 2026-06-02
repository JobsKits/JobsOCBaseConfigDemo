#import "DKApplePencil.h"
#import "DKDeviceType.h"

@implementation DKApplePencil

+ (DKApplePencilSupport)applePencilSupportForDevice:(DKDevice *)device {
    // Implemented in generated code (currently placeholder until generator extended)
    return (DKApplePencilSupport)DKApplePencilSupportForType((DKDeviceType)device.type, device.simulatedDevice, device.unknownIdentifier);
}

@end

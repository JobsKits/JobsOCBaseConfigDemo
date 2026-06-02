#import <Foundation/Foundation.h>
#import "DKDevice.h"

NS_ASSUME_NONNULL_BEGIN

@interface DKApplePencil : NSObject
+ (DKApplePencilSupport)applePencilSupportForDevice:(DKDevice *)device;
@end

NS_ASSUME_NONNULL_END

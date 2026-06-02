#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DKDiskSpace : NSObject
+ (nullable NSDictionary<NSString *, NSNumber *> *)volumes;
@end

NS_ASSUME_NONNULL_END

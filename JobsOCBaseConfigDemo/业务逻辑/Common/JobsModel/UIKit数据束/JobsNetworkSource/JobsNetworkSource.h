//
//  JobsNetworkSource.h
//  JobsNetWorkTools
//
//  Created by Jobs on 2026/5/23.
//

#import <Foundation/Foundation.h>
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsNetworkSource : NSObject <BaseProtocol>

Prop_assign()JobsNetworkSourceType type;
Prop_copy(nullable)NSString *displayName;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsNetworkSource *_Nonnull
jobsMakeNetworkSource(jobsByNetworkSourceBlock _Nonnull block){
    JobsNetworkSource *data = JobsNetworkSource.alloc.init;
    if (block) block(data);
    return data;
}

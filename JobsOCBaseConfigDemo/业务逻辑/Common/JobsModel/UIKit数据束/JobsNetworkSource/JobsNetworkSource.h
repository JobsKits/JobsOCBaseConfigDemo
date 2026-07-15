//
//  JobsNetworkSource.h
//  JobsNetWorkTools
//
//  Created by Jobs on 2026/5/23.
//

#ifndef JobsNetworkSource_h
#define JobsNetworkSource_h

#import <Foundation/Foundation.h>
#import "JobsBaseProtocolHeader.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

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

#endif /* JobsNetworkSource_h */

//
//  JobsNetworkSource.h
//  JobsNetWorkTools
//
//  Created by Jobs on 2026/5/23.
//

#ifndef JobsNetworkSource_h
#define JobsNetworkSource_h

#import <Foundation/Foundation.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

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

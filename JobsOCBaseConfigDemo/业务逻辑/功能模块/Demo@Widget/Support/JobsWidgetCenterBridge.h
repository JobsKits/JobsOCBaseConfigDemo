//
//  JobsWidgetCenterBridge.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月22日，星期三.
//

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
NS_ASSUME_NONNULL_BEGIN

@interface JobsWidgetCenterBridge : NSObject

+(JobsRetNSIntegerByVoidBlock _Nonnull)jobsCounter;
+(jobsByNSIntegerBlock _Nonnull)jobsSaveCounter;
+(jobsByVoidBlock _Nonnull)jobsReloadTimelines;

@end

NS_ASSUME_NONNULL_END

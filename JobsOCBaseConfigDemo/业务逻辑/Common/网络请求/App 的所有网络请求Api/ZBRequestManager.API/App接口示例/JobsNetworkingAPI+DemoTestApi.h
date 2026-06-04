//
//  JobsNetworkingAPI+DemoTestApi.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsNetworkingAPI.h"

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

@interface JobsNetworkingAPI (DemoTestApi)
/*

    ❤️这里选用通用性较强的 jobsByIDBlock 的目的，而不是直接对【typedef void(^jobsByIDBlock)(id data)】进行确定类型 JobsResponseModel 的原因：
    防止个别接口不按套路（msg、code、data）出牌
 */
+(void)appInterfaceTesting:(id)parameters
              successBlock:(jobsByIDBlock _Nullable)successBlock
              failureBlock:(jobsByIDBlock _Nullable)failureBlock;

@end

NS_ASSUME_NONNULL_END


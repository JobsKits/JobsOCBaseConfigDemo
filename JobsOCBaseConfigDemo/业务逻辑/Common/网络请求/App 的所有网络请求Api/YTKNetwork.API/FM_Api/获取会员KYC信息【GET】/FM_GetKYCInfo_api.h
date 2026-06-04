//
//  FM_GetKYCInfo_api.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if __has_include(<JobsAPIs/JobsBaseApi.h>)
#import <JobsAPIs/JobsBaseApi.h>
#else
#import "JobsBaseApi.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface FM_GetKYCInfo_api : JobsBaseApi
/// 在链式请求中，下一个请求的参数来源于上一个请求的结果
-(NSString *_Nonnull)kyc;

@end

NS_ASSUME_NONNULL_END

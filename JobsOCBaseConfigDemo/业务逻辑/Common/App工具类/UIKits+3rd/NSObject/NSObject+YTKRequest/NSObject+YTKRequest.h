//
//  NSObject+YTKRequest.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 猿题库网络框架的集成
@interface NSObject (YTKRequest) <YTKChainRequestDelegate>

@end

NS_ASSUME_NONNULL_END

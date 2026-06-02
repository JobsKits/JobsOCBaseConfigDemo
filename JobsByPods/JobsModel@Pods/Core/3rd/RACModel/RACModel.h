//
//  RACModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef RACModel_h
#define RACModel_h

#import <Foundation/Foundation.h>

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

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
/// 在 ReactiveObjC 中，RACDisposable 是用来管理订阅生命周期的，但 RACDisposable 本身不能提供对信号的直接访问
@interface RACModel : NSObject<RACProtocol>

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof RACModel *_Nonnull jobsMakeRACModel(jobsByRACModelBlock _Nonnull block){
    RACModel *data = RACModel.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* RACModel_h */

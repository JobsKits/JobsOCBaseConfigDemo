//
//  RACModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef RACModel_h

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#define RACModel_h

#import <Foundation/Foundation.h>

#import "JobsBaseProtocolHeader.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

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

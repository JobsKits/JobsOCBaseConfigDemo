//
//  JobsKeyValueModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsKeyValueModel_h
#define JobsKeyValueModel_h

#import <Foundation/Foundation.h>
#import <JobsModel/BaseModel.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsKeyValueModel <__covariant KeyType, __covariant ObjectType> : BaseModel<BaseProtocol>

Prop_copy()KeyType key;
Prop_strong()ObjectType value;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsKeyValueModel *_Nonnull jobsMakeKeyValueModel(jobsByKeyValueModelBlock _Nonnull block){
    JobsKeyValueModel *data = JobsKeyValueModel.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* JobsKeyValueModel_h */

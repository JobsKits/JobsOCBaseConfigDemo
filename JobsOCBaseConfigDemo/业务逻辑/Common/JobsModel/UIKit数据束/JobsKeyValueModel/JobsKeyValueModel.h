//
//  JobsKeyValueModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsKeyValueModel_h
#define JobsKeyValueModel_h

#import <Foundation/Foundation.h>
#import "BaseModel.h"
#import "JobsBaseProtocolHeader.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

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

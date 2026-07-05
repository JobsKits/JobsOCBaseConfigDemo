//
//  JobsGestureModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsGestureModel_h
#define JobsGestureModel_h

#import <Foundation/Foundation.h>
#import "BaseModel.h"

#import "JobsBaseProtocolHeader.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsGestureModel : BaseModel <GestureProtocol>

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsGestureModel *_Nonnull jobsMakeGestureModel(jobsByGestureModelBlock _Nonnull block){
    JobsGestureModel *data = JobsGestureModel.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* JobsGestureModel_h */

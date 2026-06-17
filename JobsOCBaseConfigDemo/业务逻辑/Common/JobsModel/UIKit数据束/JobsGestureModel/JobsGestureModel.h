//
//  JobsGestureModel.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
#import "JobsDefineProperty.h"
#import "GestureProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsGestureModel : BaseModel <GestureProtocol>

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsGestureModel *_Nonnull jobsMakeGestureModel(jobsByGestureModelBlock _Nonnull block){
    JobsGestureModel *data = JobsGestureModel.alloc.init;
    if (block) block(data);
    return data;
}

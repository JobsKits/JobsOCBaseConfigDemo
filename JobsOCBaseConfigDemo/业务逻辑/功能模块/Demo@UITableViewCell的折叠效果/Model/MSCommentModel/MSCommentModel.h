//
//  MSCommentModel.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
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

@interface MSCommentDetailModel : BaseModel

Prop_copy()NSString *rowTitle;

@end

@interface MSCommentModel : BaseModel

Prop_copy()NSString *sectionTitle;
Prop_strong()NSMutableArray <MSCommentDetailModel *>*commentDataMutArr;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof MSCommentDetailModel *_Nonnull jobsMakeMSCommentDetailModel(jobsByMSCommentDetailModelBlock _Nonnull block){
    MSCommentDetailModel *data = MSCommentDetailModel.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof MSCommentModel *_Nonnull jobsMakeMSCommentModel(jobsByMSCommentModelBlock _Nonnull block){
    MSCommentModel *data = MSCommentModel.alloc.init;
    if (block) block(data);
    return data;
}

//
//  JobsImageModel+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSIMAGEMODEL_DSL_CD3D070AEE1CC5F
#define JOBS_HEADER_GUARD_JOBSIMAGEMODEL_DSL_CD3D070AEE1CC5F

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsImageModel (DSL)

-(JobsRetJobsImageModelByImageBlock _Nonnull)byImage;
-(JobsRetJobsImageModelByDicBlock _Nonnull)byInfo;
-(JobsRetJobsImageModelByDicBlock _Nonnull)byTimeDic;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSIMAGEMODEL_DSL_CD3D070AEE1CC5F */

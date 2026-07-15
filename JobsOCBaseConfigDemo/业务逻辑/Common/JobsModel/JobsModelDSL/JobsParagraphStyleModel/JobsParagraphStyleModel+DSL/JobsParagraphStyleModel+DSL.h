//
//  JobsParagraphStyleModel+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSPARAGRAPHSTYLEMODEL_DSL_220978DA485DE3F
#define JOBS_HEADER_GUARD_JOBSPARAGRAPHSTYLEMODEL_DSL_220978DA485DE3F

#import "JobsModel.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsParagraphStyleModel (DSL)

-(JobsRetJobsParagraphStyleModelByIDBlock _Nonnull)byValue;
-(JobsRetJobsParagraphStyleModelByNSRangeBlock _Nonnull)byRange;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSPARAGRAPHSTYLEMODEL_DSL_220978DA485DE3F */

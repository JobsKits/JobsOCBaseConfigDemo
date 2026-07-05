//
//  FileNameModel+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_FILENAMEMODEL_DSL_2ED488847615A388
#define JOBS_HEADER_GUARD_FILENAMEMODEL_DSL_2ED488847615A388

#import "JobsModel.h"

#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface FileNameModel (DSL)

-(JobsRetFileNameModelByStrBlock _Nonnull)byName;
-(JobsRetFileNameModelByStrBlock _Nonnull)byType;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_FILENAMEMODEL_DSL_2ED488847615A388 */

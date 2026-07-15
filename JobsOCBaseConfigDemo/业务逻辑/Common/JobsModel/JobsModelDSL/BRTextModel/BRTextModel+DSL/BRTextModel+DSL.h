//
//  BRTextModel+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_BRTEXTMODEL_DSL_6165BE4729A6F3D
#define JOBS_HEADER_GUARD_BRTEXTMODEL_DSL_6165BE4729A6F3D

#import "JobsModel.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface BRTextModel (DSL)

-(JobsRetBRTextModelByStrBlock _Nonnull)byCode;
-(JobsRetBRTextModelByStrBlock _Nonnull)byText;
-(JobsRetBRTextModelByArrBlock _Nonnull)byChildren;
-(JobsRetBRTextModelByStrBlock _Nonnull)byParentCode;
-(JobsRetBRTextModelByIDBlock _Nonnull)byExtras;
-(JobsRetBRTextModelByNSIntegerBlock _Nonnull)byIndex;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_BRTEXTMODEL_DSL_6165BE4729A6F3D */

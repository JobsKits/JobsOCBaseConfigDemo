//
//  SDWebImageModel+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_SDWEBIMAGEMODEL_DSL_F2AC39C0220E72E
#define JOBS_HEADER_GUARD_SDWEBIMAGEMODEL_DSL_F2AC39C0220E72E

#import "JobsModel.h"

#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface SDWebImageModel (DSL)

-(JobsRetSDWebImageModelByURLBlock _Nonnull)byUrl;
-(JobsRetSDWebImageModelByImageBlock _Nonnull)byPlaceholder;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_SDWEBIMAGEMODEL_DSL_F2AC39C0220E72E */

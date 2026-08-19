//
//  MasonryModel+DSL.h
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_MASONRYMODEL_DSL_707ECC8ADCAF0DB
#define JOBS_HEADER_GUARD_MASONRYMODEL_DSL_707ECC8ADCAF0DB

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

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface MasonryModel (DSL)

-(JobsRetMasonryModelByCGFloatBlock _Nonnull)byFixedSpacing;
-(JobsRetMasonryModelByCGFloatBlock _Nonnull)byFixedItemLength;
-(JobsRetMasonryModelByCGFloatBlock _Nonnull)byLeadSpacing;
-(JobsRetMasonryModelByCGFloatBlock _Nonnull)byTailSpacing;
-(JobsRetMasonryModelByCGFloatBlock _Nonnull)byTop;
-(JobsRetMasonryModelByCGFloatBlock _Nonnull)byBottom;
-(JobsRetMasonryModelByCGFloatBlock _Nonnull)byLeft;
-(JobsRetMasonryModelByCGFloatBlock _Nonnull)byRight;
-(JobsRetMasonryModelByCGFloatBlock _Nonnull)byHeight;
-(JobsRetMasonryModelByCGFloatBlock _Nonnull)byWidth;
-(JobsRetMasonryModelByCGFloatBlock _Nonnull)byCenterX;
-(JobsRetMasonryModelByCGFloatBlock _Nonnull)byCenterY;
-(JobsRetMasonryModelByBOOLBlock _Nonnull)byIs_mas_makeConstraints;
-(JobsRetMasonryModelByUIViewPointerBlock _Nonnull)byView;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN MasonryModel
-(JobsRetMasonryModelByMASAxisTypeBlock _Nonnull)byAxisType;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END MasonryModel
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_MASONRYMODEL_DSL_707ECC8ADCAF0DB */

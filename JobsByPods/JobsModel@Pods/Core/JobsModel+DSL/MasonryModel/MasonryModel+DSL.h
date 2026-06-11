//
//  MasonryModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_MASONRYMODEL_DSL_17867F1AEAF92A16
#define JOBS_HEADER_GUARD_MASONRYMODEL_DSL_17867F1AEAF92A16

#if __has_include(<JobsModel/MasonryModel.h>)
#import <JobsModel/MasonryModel.h>
#else
#import "MasonryModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface MasonryModel (DSL)

#pragma mark —— 来自 MasonryModel
-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(MASAxisType data))byAxisType;
-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(CGFloat data))byFixedSpacing;
-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(CGFloat data))byFixedItemLength;
-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(CGFloat data))byLeadSpacing;
-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(CGFloat data))byTailSpacing;
-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(CGFloat data))byTop;
-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(CGFloat data))byBottom;
-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(CGFloat data))byLeft;
-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(CGFloat data))byRight;
-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(CGFloat data))byHeight;
-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(CGFloat data))byWidth;
-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(CGFloat data))byCenterX;
-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(CGFloat data))byCenterY;
-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(BOOL data))byIs_mas_makeConstraints;
-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(__kindof UIView * data))byView;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_MASONRYMODEL_DSL_17867F1AEAF92A16 */

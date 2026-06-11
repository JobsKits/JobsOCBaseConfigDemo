//
//  BRTextModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_BRTEXTMODEL_DSL_40514C3570343C7C
#define JOBS_HEADER_GUARD_BRTEXTMODEL_DSL_40514C3570343C7C

#if __has_include(<JobsModel/BRTextModel.h>)
#import <JobsModel/BRTextModel.h>
#else
#import "BRTextModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface BRTextModel (DSL)

#pragma mark —— 来自 BRTextModel
-(__kindof BRTextModel *_Nonnull (^ _Nonnull)(NSString * data))byCode;
-(__kindof BRTextModel *_Nonnull (^ _Nonnull)(NSString * data))byText;
-(__kindof BRTextModel *_Nonnull (^ _Nonnull)(NSArray <BRTextModel *> * data))byChildren;
-(__kindof BRTextModel *_Nonnull (^ _Nonnull)(NSString * data))byParentCode;
-(__kindof BRTextModel *_Nonnull (^ _Nonnull)(id data))byExtras;
-(__kindof BRTextModel *_Nonnull (^ _Nonnull)(NSInteger data))byIndex;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_BRTEXTMODEL_DSL_40514C3570343C7C */

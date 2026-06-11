//
//  CasinoGetiOSNewestVersionModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_CASINOGETIOSNEWESTVERSIONMODEL_DSL_BA39D9EAE52B6739
#define JOBS_HEADER_GUARD_CASINOGETIOSNEWESTVERSIONMODEL_DSL_BA39D9EAE52B6739

#if __has_include(<JobsModel/CasinoGetiOSNewestVersionModel.h>)
#import <JobsModel/CasinoGetiOSNewestVersionModel.h>
#else
#import "CasinoGetiOSNewestVersionModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface CasinoGetiOSNewestVersionModel (DSL)

#pragma mark —— 来自 CasinoGetiOSNewestVersionModel
-(__kindof CasinoGetiOSNewestVersionModel *_Nonnull (^ _Nonnull)(NSString * data))byCreateBy;
-(__kindof CasinoGetiOSNewestVersionModel *_Nonnull (^ _Nonnull)(NSString * data))byCreateTime;
-(__kindof CasinoGetiOSNewestVersionModel *_Nonnull (^ _Nonnull)(NSString * data))byDownloadUrl;
-(__kindof CasinoGetiOSNewestVersionModel *_Nonnull (^ _Nonnull)(NSNumber * data))byID;
-(__kindof CasinoGetiOSNewestVersionModel *_Nonnull (^ _Nonnull)(JobsUpdateType data))byIsForced;
-(__kindof CasinoGetiOSNewestVersionModel *_Nonnull (^ _Nonnull)(NSString * data))byName;
-(__kindof CasinoGetiOSNewestVersionModel *_Nonnull (^ _Nonnull)(NSString * data))byRemark;
-(__kindof CasinoGetiOSNewestVersionModel *_Nonnull (^ _Nonnull)(JobsOperationType data))byTerminalType;
-(__kindof CasinoGetiOSNewestVersionModel *_Nonnull (^ _Nonnull)(NSNumber * data))byUpdateBy;
-(__kindof CasinoGetiOSNewestVersionModel *_Nonnull (^ _Nonnull)(NSString * data))byUpdateTime;
-(__kindof CasinoGetiOSNewestVersionModel *_Nonnull (^ _Nonnull)(NSString * data))byVersionNumber;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_CASINOGETIOSNEWESTVERSIONMODEL_DSL_BA39D9EAE52B6739 */

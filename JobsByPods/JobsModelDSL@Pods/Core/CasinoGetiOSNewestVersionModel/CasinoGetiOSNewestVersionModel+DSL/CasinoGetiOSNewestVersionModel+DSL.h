//
//  CasinoGetiOSNewestVersionModel+DSL.h
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_CASINOGETIOSNEWESTVERSIONMODEL_DSL_1318C01F3DD9E1D6
#define JOBS_HEADER_GUARD_CASINOGETIOSNEWESTVERSIONMODEL_DSL_1318C01F3DD9E1D6

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

@interface CasinoGetiOSNewestVersionModel (DSL)

-(JobsRetCasinoGetiOSNewestVersionModelByStrBlock _Nonnull)byCreateBy;
-(JobsRetCasinoGetiOSNewestVersionModelByStrBlock _Nonnull)byCreateTime;
-(JobsRetCasinoGetiOSNewestVersionModelByStrBlock _Nonnull)byDownloadUrl;
-(JobsRetCasinoGetiOSNewestVersionModelByNumberBlock _Nonnull)byID;
-(JobsRetCasinoGetiOSNewestVersionModelByJobsUpdateTypeBlock _Nonnull)byIsForced;
-(JobsRetCasinoGetiOSNewestVersionModelByStrBlock _Nonnull)byName;
-(JobsRetCasinoGetiOSNewestVersionModelByStrBlock _Nonnull)byRemark;
-(JobsRetCasinoGetiOSNewestVersionModelByJobsOperationTypeBlock _Nonnull)byTerminalType;
-(JobsRetCasinoGetiOSNewestVersionModelByNumberBlock _Nonnull)byUpdateBy;
-(JobsRetCasinoGetiOSNewestVersionModelByStrBlock _Nonnull)byUpdateTime;
-(JobsRetCasinoGetiOSNewestVersionModelByStrBlock _Nonnull)byVersionNumber;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_CASINOGETIOSNEWESTVERSIONMODEL_DSL_1318C01F3DD9E1D6 */

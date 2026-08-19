//
//  JobsOCPatchMgr.h
//  JobsOCPatch
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <objc/runtime.h>
#import "JobsOCPatchModel.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@class JobsOCPatchMgr;
typedef JobsOCPatchMgr *_Nullable(^JobsRetJobsOCPatchMgrByVoidBlock)(void);

@interface JobsOCPatchMgr : NSObject

+(JobsRetJobsOCPatchMgrByVoidBlock _Nonnull)shared;

-(JobsRetBOOLByJobsOCPatchModelBlock _Nonnull)installPayloadPatch;
-(JobsRetBOOLByStrBlock _Nonnull)rollbackPatchByIdentifier;
-(jobsByVoidBlock _Nonnull)rollbackAllPatches;
-(JobsRetBOOLByStrBlock _Nonnull)containsPatchByIdentifier;

@end

NS_ASSUME_NONNULL_END

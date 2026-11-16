//
//  JobsOCPatchMgr.h
//  JobsOCPatch
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import "JobsBlock.h"
#else
#import "JobsBlock.h"
#endif
#import "JobsOCPatchModel.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import "JobsDefines.h"
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@class JobsOCPatchMgr;
typedef JobsOCPatchMgr *_Nullable(^JobsRetJobsOCPatchMgrByVoidBlock)(void);

@interface JobsOCPatchMgr : NSObject

+(JobsRetJobsOCPatchMgrByVoidBlock _Nonnull)shared;

-(JobsRetBOOLByJobsOCPatchModelBlock _Nonnull)installPayloadPatch;
/// 同 class + selector 仅一个 identifier；同 identifier 可原位更新 payload。
/// 仅接受无参数的对象返回方法；继承方法在目标类隔离 override，回滚不释放 C trampoline。
-(JobsRetBOOLByStrBlock _Nonnull)rollbackPatchByIdentifier;
-(jobsByVoidBlock _Nonnull)rollbackAllPatches;
-(JobsRetBOOLByStrBlock _Nonnull)containsPatchByIdentifier;

@end

NS_ASSUME_NONNULL_END

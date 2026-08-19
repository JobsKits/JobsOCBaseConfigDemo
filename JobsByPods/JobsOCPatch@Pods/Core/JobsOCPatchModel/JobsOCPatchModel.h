//
//  JobsOCPatchModel.h
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

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCPatchModel : NSObject

Prop_copy()NSString *identifier;
Prop_assign()Class targetCls;
Prop_assign()SEL selector;
Prop_strong()NSDictionary *payload;

-(JobsRetJobsOCPatchModelByStrBlock _Nonnull)byIdentifier;
-(JobsRetJobsOCPatchModelByIDBlock _Nonnull)byTargetCls;
-(JobsRetJobsOCPatchModelBySELBlock _Nonnull)bySelector;
-(JobsRetJobsOCPatchModelByDicBlock _Nonnull)byPayload;

+(__kindof JobsOCPatchModel *)patchWithIdentifier:(NSString *)identifier
                                       targetCls:(Class)targetCls
                                        selector:(SEL)selector
                                         payload:(NSDictionary *)payload;

@end

NS_ASSUME_NONNULL_END

//
//  JobsOCPatchModel.h
//  JobsOCPatch
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

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

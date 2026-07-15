//
//  JobsOCPatchModel.m
//  JobsOCPatch
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "JobsOCPatchModel.h"

@implementation JobsOCPatchModel
+(__kindof JobsOCPatchModel *)patchWithIdentifier:(NSString *)identifier
                                       targetCls:(Class)targetCls
                                        selector:(SEL)selector
                                         payload:(NSDictionary *)payload{
    JobsOCPatchModel *model = JobsOCPatchModel.new;
    model.identifier = identifier;
    model.targetCls = targetCls;
    model.selector = selector;
    model.payload = payload;
    return model;
}

@end

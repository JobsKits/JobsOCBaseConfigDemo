//
//  JobsOCPatchModel.m
//  JobsOCPatch
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "JobsOCPatchModel.h"

@implementation JobsOCPatchModel

-(JobsRetJobsOCPatchModelByStrBlock _Nonnull)byIdentifier{
    @jobs_weakify(self)
    return ^__kindof JobsOCPatchModel *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.identifier = data;
        return self;
    };
}

-(JobsRetJobsOCPatchModelByIDBlock _Nonnull)byTargetCls{
    @jobs_weakify(self)
    return ^__kindof JobsOCPatchModel *_Nullable(Class _Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.targetCls = data;
        return self;
    };
}

-(JobsRetJobsOCPatchModelBySELBlock _Nonnull)bySelector{
    @jobs_weakify(self)
    return ^__kindof JobsOCPatchModel *_Nullable(SEL _Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.selector = data;
        return self;
    };
}

-(JobsRetJobsOCPatchModelByDicBlock _Nonnull)byPayload{
    @jobs_weakify(self)
    return ^__kindof JobsOCPatchModel *_Nullable(NSDictionary *_Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.payload = data;
        return self;
    };
}

+(__kindof JobsOCPatchModel *)patchWithIdentifier:(NSString *)identifier
                                       targetCls:(Class)targetCls
                                        selector:(SEL)selector
                                         payload:(NSDictionary *)payload{
    return JobsOCPatchModel.new
        .byIdentifier(identifier)
        .byTargetCls(targetCls)
        .bySelector(selector)
        .byPayload(payload);
}

@end

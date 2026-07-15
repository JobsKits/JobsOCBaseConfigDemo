//
//  JobsImageModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "JobsImageModel+DSL.h"

@implementation JobsImageModel (DSL)
-(JobsRetJobsImageModelByImageBlock _Nonnull)byImage{
    @jobs_weakify(self)
    return ^__kindof JobsImageModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.image = data;
        return self;
    };
}

-(JobsRetJobsImageModelByDicBlock _Nonnull)byInfo{
    @jobs_weakify(self)
    return ^__kindof JobsImageModel *_Nullable(NSDictionary * _Nullable data) {
        @jobs_strongify(self)
        self.info = data;
        return self;
    };
}

-(JobsRetJobsImageModelByDicBlock _Nonnull)byTimeDic{
    @jobs_weakify(self)
    return ^__kindof JobsImageModel *_Nullable(NSDictionary * _Nullable data) {
        @jobs_strongify(self)
        self.timeDic = data;
        return self;
    };
}

@end

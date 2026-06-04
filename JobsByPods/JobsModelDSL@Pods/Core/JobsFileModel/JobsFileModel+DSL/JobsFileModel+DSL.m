//
//  JobsFileModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "JobsFileModel+DSL.h"

@implementation JobsFileModel (DSL)

-(JobsRetJobsFileModelByNSIntegerBlock _Nonnull)byID{
    @jobs_weakify(self)
    return ^__kindof JobsFileModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.ID = data;
        return self;
    };
}

-(JobsRetJobsFileModelByStrBlock _Nonnull)byFileName{
    @jobs_weakify(self)
    return ^__kindof JobsFileModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.fileName = data;
        return self;
    };
}

-(JobsRetJobsFileModelByDataBlock _Nonnull)byFile{
    @jobs_weakify(self)
    return ^__kindof JobsFileModel *_Nullable(NSData * _Nullable data) {
        @jobs_strongify(self)
        self.file = data;
        return self;
    };
}
@end

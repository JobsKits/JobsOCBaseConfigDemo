//
//  JobsFileModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "JobsFileModel+DSL.h"

@implementation JobsFileModel (DSL)

#pragma mark —— 来自 JobsFileModel
-(__kindof JobsFileModel *_Nonnull (^ _Nonnull)(NSInteger data))byID{
    @jobs_weakify(self)
    return ^__kindof JobsFileModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.ID = data;
        return self;
    };
}

-(__kindof JobsFileModel *_Nonnull (^ _Nonnull)(NSString * data))byFileName{
    @jobs_weakify(self)
    return ^__kindof JobsFileModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.fileName = data;
        return self;
    };
}

-(__kindof JobsFileModel *_Nonnull (^ _Nonnull)(NSData * data))byFile{
    @jobs_weakify(self)
    return ^__kindof JobsFileModel *_Nonnull(NSData * data) {
        @jobs_strongify(self)
        self.file = data;
        return self;
    };
}

@end

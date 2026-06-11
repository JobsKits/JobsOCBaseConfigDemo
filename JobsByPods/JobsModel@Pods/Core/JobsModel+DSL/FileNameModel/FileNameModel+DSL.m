//
//  FileNameModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "FileNameModel+DSL.h"

@implementation FileNameModel (DSL)

#pragma mark —— 来自 FileNameModel
-(__kindof FileNameModel *_Nonnull (^ _Nonnull)(NSString * data))byName{
    @jobs_weakify(self)
    return ^__kindof FileNameModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.name = data;
        return self;
    };
}

-(__kindof FileNameModel *_Nonnull (^ _Nonnull)(NSString * data))byType{
    @jobs_weakify(self)
    return ^__kindof FileNameModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.type = data;
        return self;
    };
}

@end

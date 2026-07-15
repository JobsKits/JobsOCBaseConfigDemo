//
//  FileNameModel+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "FileNameModel+DSL.h"

@implementation FileNameModel (DSL)
-(JobsRetFileNameModelByStrBlock _Nonnull)byName{
    @jobs_weakify(self)
    return ^__kindof FileNameModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.name = data;
        return self;
    };
}

-(JobsRetFileNameModelByStrBlock _Nonnull)byType{
    @jobs_weakify(self)
    return ^__kindof FileNameModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.type = data;
        return self;
    };
}

@end

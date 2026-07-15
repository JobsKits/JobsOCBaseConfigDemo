//
//  URLManagerModel+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "URLManagerModel+DSL.h"

@implementation URLManagerModel (DSL)
-(JobsRetURLManagerModelByStrBlock _Nonnull)byUrl{
    @jobs_weakify(self)
    return ^__kindof URLManagerModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.url = data;
        return self;
    };
}

-(JobsRetURLManagerModelByStrBlock _Nonnull)byFuncName{
    @jobs_weakify(self)
    return ^__kindof URLManagerModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.funcName = data;
        return self;
    };
}

@end

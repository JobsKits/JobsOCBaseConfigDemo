//
//  URLManagerModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "URLManagerModel+DSL.h"

@implementation URLManagerModel (DSL)

#pragma mark —— 来自 URLManagerModel
-(__kindof URLManagerModel *_Nonnull (^ _Nonnull)(NSString * data))byUrl{
    @jobs_weakify(self)
    return ^__kindof URLManagerModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.url = data;
        return self;
    };
}

-(__kindof URLManagerModel *_Nonnull (^ _Nonnull)(NSString * data))byFuncName{
    @jobs_weakify(self)
    return ^__kindof URLManagerModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.funcName = data;
        return self;
    };
}

@end

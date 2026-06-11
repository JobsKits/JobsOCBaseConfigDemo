//
//  JobsHeaderFooterViewModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "JobsHeaderFooterViewModel+DSL.h"

@implementation JobsHeaderFooterViewModel (DSL)

#pragma mark —— 来自 JobsHeaderFooterViewModel
-(__kindof JobsHeaderFooterViewModel *_Nonnull (^ _Nonnull)(BOOL data))byUseHeaderView{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.useHeaderView = data;
        return self;
    };
}

-(__kindof JobsHeaderFooterViewModel *_Nonnull (^ _Nonnull)(BOOL data))byUseFooterView{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.useFooterView = data;
        return self;
    };
}

@end

//
//  UILabel+DSL.m
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UILabel+DSL.h"

@implementation UILabel (DSL)

-(JobsRetLabelByTextAlignmentBlock _Nonnull)byTextAlignment{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(NSTextAlignment textAlignment) {
        @jobs_strongify(self)
        self.textAlignment = textAlignment;
        return self;
    };
}

@end

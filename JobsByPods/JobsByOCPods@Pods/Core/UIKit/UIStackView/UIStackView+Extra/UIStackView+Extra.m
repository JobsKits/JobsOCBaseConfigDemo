//
//  UIStackView+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIStackView+Extra.h"

@implementation UIStackView (Extra)

-(JobsRetViewByViewBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nullable subView) {
        @jobs_strongify(self)
        [self addArrangedSubview:subView];
        return subView;
    };
}

@end

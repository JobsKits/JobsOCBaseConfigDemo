//
//  UIView+MasonryDSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "UIView+MasonryDSL.h"

@implementation UIView (MasonryDSL)

- (JobsOCDSLRetViewBySuperviewMasonryBlock _Nonnull)byAddTo {
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nonnull superview, jobsByMASConstraintMakerBlock _Nullable block) {
        @jobs_strongify(self)
        if (superview && self.superview != superview) {
            [superview addSubview:self];
        }
        if (block) {
            [self mas_makeConstraints:block];
        }return self;
    };
}

- (JobsReturnViewByMasonryConstraintsBlocks _Nonnull)byMakeConstraints {
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(jobsByMASConstraintMakerBlock _Nullable block) {
        @jobs_strongify(self)
        if (block) {
            [self mas_makeConstraints:block];
        }return self;
    };
}

- (JobsReturnViewByMasonryConstraintsBlocks _Nonnull)byUpdateConstraints {
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(jobsByMASConstraintMakerBlock _Nullable block) {
        @jobs_strongify(self)
        if (block) {
            [self mas_updateConstraints:block];
        }return self;
    };
}

- (JobsReturnViewByMasonryConstraintsBlocks _Nonnull)byRemakeConstraints {
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(jobsByMASConstraintMakerBlock _Nullable block) {
        @jobs_strongify(self)
        if (block) {
            [self mas_remakeConstraints:block];
        }return self;
    };
}

- (JobsRetViewByVoidBlock _Nonnull)byRemoveConstraints {
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(void) {
        @jobs_strongify(self)
        [self mas_remakeConstraints:^(MASConstraintMaker *make) {}];
        return self;
    };
}

@end

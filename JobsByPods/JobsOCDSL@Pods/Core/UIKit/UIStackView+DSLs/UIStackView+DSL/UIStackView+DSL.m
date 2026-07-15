//
//  UIStackView+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#import "UIStackView+DSL.h"

@implementation UIStackView (DSL)
-(JobsRetStackViewByAxisBlock _Nonnull)byAxis{
    @jobs_weakify(self)
    return ^__kindof UIStackView *_Nullable(UILayoutConstraintAxis data){
        @jobs_strongify(self)
        self.axis = data;
        return self;
    };
}

-(JobsRetStackViewByDistributionBlock _Nonnull)byDistribution{
    @jobs_weakify(self)
    return ^__kindof UIStackView *_Nullable(UIStackViewDistribution data){
        @jobs_strongify(self)
        self.distribution = data;
        return self;
    };
}

-(JobsRetStackViewByAlignmentBlock _Nonnull)byAlignment{
    @jobs_weakify(self)
    return ^__kindof UIStackView *_Nullable(UIStackViewAlignment data){
        @jobs_strongify(self)
        self.alignment = data;
        return self;
    };
}

-(JobsRetStackViewByCGFloatBlock _Nonnull)bySpacing{
    @jobs_weakify(self)
    return ^__kindof UIStackView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.spacing = data;
        return self;
    };
}

-(JobsRetStackViewByBOOLBlock _Nonnull)byBaselineRelativeArrangement{
    @jobs_weakify(self)
    return ^__kindof UIStackView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.baselineRelativeArrangement = data;
        return self;
    };
}

-(JobsRetStackViewByBOOLBlock _Nonnull)byLayoutMarginsRelativeArrangement{
    @jobs_weakify(self)
    return ^__kindof UIStackView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.layoutMarginsRelativeArrangement = data;
        return self;
    };
}

-(JobsRetStackViewByViewBlock _Nonnull)byAddArrangedSubview{
    @jobs_weakify(self)
    return ^__kindof UIStackView *_Nullable(__kindof UIView *_Nullable data){
        @jobs_strongify(self)
        if (data) [self addArrangedSubview:data];
        return self;
    };
}

-(JobsRetStackViewByViewBlock _Nonnull)byRemoveArrangedSubview{
    @jobs_weakify(self)
    return ^__kindof UIStackView *_Nullable(__kindof UIView *_Nullable data){
        @jobs_strongify(self)
        if (data) [self removeArrangedSubview:data];
        return self;
    };
}

@end

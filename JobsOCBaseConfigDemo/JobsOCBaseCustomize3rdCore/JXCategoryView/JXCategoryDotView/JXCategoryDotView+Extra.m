//
//  JXCategoryDotView+Extra.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JXCategoryDotView+Extra.h"

@implementation JXCategoryDotView (Extra)

-(JobsRetCategoryDotViewByNumbersBlock _Nonnull)byDotStates{
    @jobs_weakify(self)
    return ^__kindof JXCategoryDotView *_Nullable(__kindof NSArray <__kindof NSNumber *>* _Nullable numbers){
        @jobs_strongify(self)
        self.dotStates = numbers;
        return self;
    };
}

-(JobsRetCategoryDotViewByRelativePositionBlock _Nonnull)byRelativePosition{
    @jobs_weakify(self)
    return ^__kindof JXCategoryDotView *_Nullable(JXCategoryDotRelativePosition relativePosition){
        @jobs_strongify(self)
        self.relativePosition = relativePosition;
        return self;
    };
}

-(JobsRetCategoryDotViewBySizeBlock _Nonnull)byDotSize{
    @jobs_weakify(self)
    return ^__kindof JXCategoryDotView *_Nullable(CGSize size){
        @jobs_strongify(self)
        self.dotSize = size;
        return self;
    };
}

-(JobsRetCategoryDotViewByCorBlock _Nonnull)byDotColor{
    @jobs_weakify(self)
    return ^__kindof JXCategoryDotView *_Nullable(__kindof UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.dotColor = cor;
        return self;
    };
}

-(JobsRetCategoryDotViewByCGFloatBlock _Nonnull)byDotCornerRadius{
    @jobs_weakify(self)
    return ^__kindof JXCategoryDotView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.dotCornerRadius = data;
        return self;
    };
}

-(JobsRetCategoryDotViewByPointBlock _Nonnull)byDotOffset{
    @jobs_weakify(self)
    return ^__kindof JXCategoryDotView *_Nullable(CGPoint point){
        @jobs_strongify(self)
        self.dotOffset = point;
        return self;
    };
}

@end

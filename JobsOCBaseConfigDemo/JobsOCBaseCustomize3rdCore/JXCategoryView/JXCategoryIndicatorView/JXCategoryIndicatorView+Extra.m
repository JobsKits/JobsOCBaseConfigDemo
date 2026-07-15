//
//  JXCategoryIndicatorView+Extra.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JXCategoryIndicatorView+Extra.h"

@implementation JXCategoryIndicatorView (Extra)
-(JobsRetCategoryIndicatorViewByViewsBlock _Nonnull)byIndicators{
    @jobs_weakify(self)
    return ^__kindof JXCategoryBaseView *_Nullable(__kindof NSArray <__kindof UIView <JXCategoryIndicatorProtocol>*>* _Nullable arr){
        @jobs_strongify(self)
        self.indicators = arr;
        return self;
    };
}

@end

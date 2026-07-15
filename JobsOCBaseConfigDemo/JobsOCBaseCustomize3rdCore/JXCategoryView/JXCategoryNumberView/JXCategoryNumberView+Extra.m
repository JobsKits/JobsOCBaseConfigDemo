//
//  JXCategoryNumberView+Extra.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JXCategoryNumberView+Extra.h"

@implementation JXCategoryNumberView (Extra)
-(JobsRetCategoryNumberViewByNumbersBlock _Nonnull)byCounts{
    @jobs_weakify(self)
    return ^__kindof JXCategoryNumberView *_Nullable(__kindof NSArray <__kindof NSNumber *>* _Nullable numbers){
        @jobs_strongify(self)
        self.counts = numbers;
        return self;
    };
}

-(JobsRetCategoryNumberViewByCGPointBlock _Nonnull)byNumberLabelOffset{
    @jobs_weakify(self)
    return ^__kindof JXCategoryNumberView *_Nullable(CGPoint point){
        @jobs_strongify(self)
        self.numberLabelOffset = point;
        return self;
    };
}

-(JobsRetCategoryNumberViewByRetStringByIntegerBlocks _Nonnull)byNumberStringFormatterBlock{
    @jobs_weakify(self)
    return ^__kindof JXCategoryNumberView *_Nullable(JobsRetStrByIntegerBlock _Nullable block){
        @jobs_strongify(self)
        self.numberStringFormatterBlock = block;
        return self;
    };
}

@end

//
//  UIView+Extra.m
//  JobsViewNavigator
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+Extra.h"

@implementation UIView (Extra)

-(jobsByVoidBlock _Nonnull)refresh{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self setNeedsLayout];
        [self layoutIfNeeded];
    };
}

-(JobsRetViewByViewBlock _Nonnull)addSubview{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nullable subView) {
        @jobs_strongify(self)
        if(!subView) return nil;
        [self addSubview:subView];
        if(subView.masonryBlock){
            [subView mas_makeConstraints:subView.masonryBlock];
            self.refresh();
        }return subView;
    };
}
#pragma mark —— Prop_copy()jobsByMASConstraintMakerBlock masonryBlock;
JobsKey(_masonryBlock)
@dynamic masonryBlock;
-(jobsByMASConstraintMakerBlock)masonryBlock{
    return Jobs_getAssociatedObject(_masonryBlock);
}

-(void)setMasonryBlock:(jobsByMASConstraintMakerBlock)masonryBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_masonryBlock, masonryBlock)
}

@end

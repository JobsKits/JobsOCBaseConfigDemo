//
//  UIView+Measure.m
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+Measure.h"

@implementation UIView (Measure)
/// 依据偏移量重塑 Frame。
///
/// 注意：resetOriginXByOffset / resetOriginYByOffset / resetWidthByOffset / resetHeightByOffset
/// 已由 JobsOCDSL/UIView+DSL 提供，这里只保留 UIViewModel 适配层。
-(JobsRetViewByViewModelBlock _Nonnull)offsetForView{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIViewModel *_Nonnull viewModel) {
        @jobs_strongify(self)
        if(viewModel.offsetXForEach) self.resetOriginXByOffset(viewModel.offsetXForEach);
        if(viewModel.offsetYForEach) self.resetOriginYByOffset(viewModel.offsetYForEach);
        if(viewModel.offsetWidth) self.resetWidthByOffset(viewModel.offsetWidth);
        if(viewModel.offsetHeight) self.resetHeightByOffset(viewModel.offsetHeight);
        return self;
    };
}

@end

//
//  NSObject+AppTools.m
//  JobsAppTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+AppTools.h"

#import "NSObject+Image.h"
#import "UIColor+Extra.h"

@implementation NSObject (AppTools)
-(JobsRetUIButtonModelByVoidBlock _Nonnull)jobsMakeBackBtnModel{
    @jobs_weakify(self)
    return ^UIButtonModel *{
        @jobs_strongify(self)
        if (!self) return nil;
        @jobs_weakify(self)
        return jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
            @jobs_strongify(self)
            UITextModel *backBtnTitleModel = self.viewModel.backBtnTitleModel;
            data.byHighlightBackgroundImage(@"返回".img)
                .byHighlightImage(@"返回".img)
                .byNormalImage(@"返回".img)
                .byBaseBackgroundColor(JobsClearColor.colorWithAlphaComponentBy(0))
                .byTitle(backBtnTitleModel.text)
                .byFont(backBtnTitleModel.font)
                .byTitleCor(JobsLabelColor)
                .bySelectedTitleCor(JobsLabelColor)
                .byRoundingCorners(UIRectCornerAllCorners)
                .byImagePlacement(NSDirectionalRectEdgeLeading)
                .byImagePadding(JobsWidth(5));
        });
    };
}

@end

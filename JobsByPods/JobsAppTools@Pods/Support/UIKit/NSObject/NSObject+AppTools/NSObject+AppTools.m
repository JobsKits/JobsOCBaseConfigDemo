//
//  NSObject+AppTools.m
//  JobsAppTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+AppTools.h"
#import <JobsAppTools/NSObject+Image.h>
#import <JobsAppTools/UIColor+Extra.h>

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

@implementation NSObject (AppTools)

-(UIButtonModel *)makeBackBtnModel{
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
            .byTitleCor(JobsBlackColor)
            .bySelectedTitleCor(JobsBlackColor)
            .byRoundingCorners(UIRectCornerAllCorners)
            .byImagePlacement(NSDirectionalRectEdgeLeading)
            .byImagePadding(JobsWidth(5));
    });
}

@end

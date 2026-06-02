//
//  NSObject+AppTools.m
//  JobsAppTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+AppTools.h"
#import <JobsAppTools/NSObject+Image.h>
#import <JobsAppTools/UIColor+Extra.h>

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
#endif

@implementation NSObject (AppTools)

-(UIButtonModel *)makeBackBtnModel{
    @jobs_weakify(self)
    return jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
        @jobs_strongify(self)

        UITextModel *backBtnTitleModel = self.viewModel.backBtnTitleModel;

        data.highlightBackgroundImage = @"返回".img;
        data.highlightImage = @"返回".img;
        data.normalImage = @"返回".img;
        data.baseBackgroundColor = JobsClearColor.colorWithAlphaComponentBy(0);
        data.title = backBtnTitleModel.text;
        data.font = backBtnTitleModel.font;
        data.titleCor = JobsBlackColor;
        data.selectedTitleCor = JobsBlackColor;
        data.roundingCorners = UIRectCornerAllCorners;
        data.imagePlacement = NSDirectionalRectEdgeLeading;
        data.imagePadding = JobsWidth(5);
    });
}

@end

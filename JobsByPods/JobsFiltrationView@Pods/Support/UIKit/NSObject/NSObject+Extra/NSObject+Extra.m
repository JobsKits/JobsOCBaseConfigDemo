//
//  NSObject+Extra.m
//  JobsFiltrationView
//
//  Created by Jobs on 2026年5月23日，星期六.
//

#import "NSObject+Extra.h"

@implementation NSObject (Extra)

-(UIButtonModel *)makeBackBtnModel{
    @jobs_weakify(self)
    return jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
        @jobs_strongify(self)
        UIImage *backImage = [UIImage imageNamed:@"返回"];
        data.byHighlightBackgroundImage(backImage)
            .byHighlightImage(backImage)
            .byNormalImage(backImage)
            .byBaseBackgroundColor(JobsClearColor);
        if ([self respondsToSelector:@selector(viewModel)] &&
            [self valueForKey:@"viewModel"]) {
            UIViewModel *viewModel = [self valueForKey:@"viewModel"];
            data.byTitle(viewModel.backBtnTitleModel.text)
                .byFont(viewModel.backBtnTitleModel.font);
        }
        data.byTitleCor(JobsBlackColor)
            .bySelectedTitleCor(JobsBlackColor)
            .byRoundingCorners(UIRectCornerAllCorners)
            .byImagePlacement(NSDirectionalRectEdgeLeading)
            .byImagePadding(JobsWidth(5));
    });
}

-(jobsByBtnBlock _Nonnull)jobsBackBtnClickEvent{
    @jobs_weakify(self)
    return ^(__kindof UIButton *_Nullable sender) {
        @jobs_strongify(self)
        if ([self respondsToSelector:@selector(jobsBackBlock)]) {
            typedef JobsRetIDByIDBlock _Nullable (*JobsMsgSendBlockByVoid)(id, SEL);
            JobsRetIDByIDBlock block = ((JobsMsgSendBlockByVoid)objc_msgSend)(self, @selector(jobsBackBlock));
            if (block) block(sender);
        }
    };
}

@end

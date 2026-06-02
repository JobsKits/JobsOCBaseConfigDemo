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
        data.highlightBackgroundImage = backImage;
        data.highlightImage = backImage;
        data.normalImage = backImage;
        data.baseBackgroundColor = JobsClearColor;
        if ([self respondsToSelector:@selector(viewModel)] &&
            [self valueForKey:@"viewModel"]) {
            UIViewModel *viewModel = [self valueForKey:@"viewModel"];
            data.title = viewModel.backBtnTitleModel.text;
            data.font = viewModel.backBtnTitleModel.font;
        }
        data.titleCor = JobsBlackColor;
        data.selectedTitleCor = JobsBlackColor;
        data.roundingCorners = UIRectCornerAllCorners;
        data.imagePlacement = NSDirectionalRectEdgeLeading;
        data.imagePadding = JobsWidth(5);
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

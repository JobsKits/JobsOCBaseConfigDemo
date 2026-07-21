//
//  UIViewController+BackBtn.m
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIViewController+BackBtn.h"

@implementation UIViewController (BackBtn)
/// GKNavigationBar 返回按钮点击方法
///【子类需要覆写 】创建返回键的点击事件
-(jobsByBtnBlock _Nonnull)backBtnClickEvent{
    @jobs_weakify(self)
    return ^(UIButton *_Nullable sender) {
        @jobs_strongify(self)
        self.jobsBackBtnClickEvent(sender);
    };
}
#pragma mark —— Prop_strong()BaseButton *backBtnCategory;
JobsKey(_backBtnCategory)
@dynamic backBtnCategory;
-(BaseButton *)backBtnCategory{
    BaseButton *BackBtnCategory = Jobs_getAssociatedObject(_backBtnCategory);
    if (!BackBtnCategory) {
        @jobs_weakify(self)
        UIColor *backButtonColor = self.viewModel.backBtnTitleModel.textCor ? : JobsLabelColor;
        UIImage *backButtonImage = self.viewModel.backBtnIMG ? : @"全局返回箭头".img;
        BackBtnCategory = BaseButton.jobsInit()
            .bgColorBy(JobsClearColor.colorWithAlphaComponentBy(0))
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetImagePadding(1)
            .jobsResetBtnImage([backButtonImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate])
            .jobsResetBtnBgImage(@"APPLY NOW".img)
            .jobsResetBtnTitleCor(backButtonColor)
            .jobsResetBtnTitleFont(self.viewModel.backBtnTitleModel.font)
            .jobsResetBtnTitle(self.viewModel.backBtnTitleModel.text)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                self.backBtnClickEvent(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
        BackBtnCategory.byTintColor(backButtonColor);
        Jobs_setAssociatedRETAIN_NONATOMIC(_backBtnCategory, BackBtnCategory)
    };return BackBtnCategory;
}

-(void)setBackBtnCategory:(UIButton *)backBtnCategory{
    Jobs_setAssociatedRETAIN_NONATOMIC(_backBtnCategory, backBtnCategory)
}
#pragma mark —— Prop_strong()UIBarButtonItem *backBtnCategoryItem;
JobsKey(_backBtnCategoryItem)
@dynamic backBtnCategoryItem;
-(UIBarButtonItem *)backBtnCategoryItem{
    UIBarButtonItem *BackBtnCategoryItem = Jobs_getAssociatedObject(_backBtnCategoryItem);
    if (!BackBtnCategoryItem) {
        BackBtnCategoryItem = UIBarButtonItem.initBy(self.backBtnCategory);
        Jobs_setAssociatedRETAIN_NONATOMIC(_backBtnCategoryItem, BackBtnCategoryItem)
    };return BackBtnCategoryItem;
}

-(void)setBackBtnCategoryItem:(UIBarButtonItem *)backBtnCategoryItem{
    Jobs_setAssociatedRETAIN_NONATOMIC(_backBtnCategoryItem, backBtnCategoryItem)
}

@end

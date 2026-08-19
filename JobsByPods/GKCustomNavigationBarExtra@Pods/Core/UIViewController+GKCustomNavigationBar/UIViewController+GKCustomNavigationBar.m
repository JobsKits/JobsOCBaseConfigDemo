//
//  UIViewController+GKCustomNavigationBar.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIViewController+GKCustomNavigationBar.h"

#import <GKCustomNavigationBarExtra/UIButton+SimplyMake.h>

static NSString *JobsGKNavigationTitleText(UITextModel *textModel) {
    NSString *title = textModel.attributedTitle.string;
    return title.length ? title : textModel.text;
}

static void JobsGKConfigureNavigationTitleLabel(UILabel *label,
                                                UITextModel *textModel,
                                                UIFont *defaultFont,
                                                UIColor *defaultColor) {
    if (textModel.attributedTitle.length) {
        label.byAttributedString(textModel.attributedTitle);
    } else {
        label.byText(textModel.text);
    }
    label
        .byTextCor(textModel.textCor ? : defaultColor)
        .byFont(textModel.font ? : defaultFont)
        .byTextAlignment(NSTextAlignmentCenter)
        .byNumberOfLines(1)
        .byAdjustsFontSizeToFitWidth(YES)
        .byMinimumScaleFactor(0.72f)
        .byLineBreakMode(NSLineBreakByClipping);
}

@implementation UIViewController (GKCustomNavigationBar)
#pragma mark —— 一些公有方法
-(JobsRetGKNavBarByButtonModelBlock _Nonnull)gk_navTitleBtnBy{
    @jobs_weakify(self)
    return ^__kindof GKCustomNavigationBar *_Nullable(__kindof UIButtonModel *_Nullable model){
        @jobs_strongify(self)
        self.gk_navTitleBtnModel = model;
        if(model) self.gk_navTitleBtn.alpha = 1;
        return self.gk_navigationBar;
    };
}

-(JobsRetViewByViewModelBlock _Nonnull)gk_navTitleViewBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIViewModel *_Nullable data){
        @jobs_strongify(self)
        if (!data || !JobsGKNavigationTitleText(data.textModel).length) return nil;
        NSString *mainTitle = JobsGKNavigationTitleText(data.textModel);
        NSString *subTitle = JobsGKNavigationTitleText(data.subTextModel);
        CGFloat titleViewWidth = MIN(JobsWidth(240),
                                     MAX(JobsWidth(180),
                                         JobsMainScreen_WIDTH() - JobsWidth(120)));
        UIView *titleView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byFrame(CGRectMake(0,
                                    0,
                                    titleViewWidth,
                                    40));
        });
        self.gk_navMainTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            JobsGKConfigureNavigationTitleLabel(label,
                                                data.textModel,
                                                UIFontWeightSemiboldSize(15),
                                                JobsLabelColor);
            label
                .addOn(titleView)
                .byAdd(^(MASConstraintMaker *make) {
                    if (subTitle.length) {
                        make.top.left.right.equalTo(titleView);
                        make.height.mas_equalTo(23);
                    } else {
                        make.edges.equalTo(titleView);
                    }
                });
        });
        self.gk_navSubTitleLab = nil;
        if (subTitle.length) {
            self.gk_navSubTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
                JobsGKConfigureNavigationTitleLabel(label,
                                                    data.subTextModel,
                                                    UIFontWeightRegularSize(11),
                                                    JobsSecondaryLabelColor);
                label
                    .addOn(titleView)
                    .byAdd(^(MASConstraintMaker *make) {
                        make.top.equalTo(self.gk_navMainTitleLab.mas_bottom).offset(-2);
                        make.left.right.bottom.equalTo(titleView);
                    });
            });
        }
        titleView.accessibilityLabel = subTitle.length ?
            [NSString stringWithFormat:@"%@，%@", mainTitle, subTitle] :
            mainTitle;
        self.gk_navTitleView = titleView;
        return titleView;
    };
}
#pragma mark —— Prop_strong(nullable)__kindof UIButtonModel *gk_navTitleBtnModel;
JobsKey(_gk_navTitleBtnModel)
@dynamic gk_navTitleBtnModel;
-(__kindof UIButtonModel *)gk_navTitleBtnModel{
    return Jobs_getAssociatedObject(_gk_navTitleBtnModel);
}

-(void)setGk_navTitleBtnModel:(__kindof UIButtonModel *)gk_navTitleBtnModel{
    Jobs_setAssociatedRETAIN_NONATOMIC(_gk_navTitleBtnModel, gk_navTitleBtnModel)
}
#pragma mark —— Prop_strong(nullable)__kindof UIButton *gk_navTitleBtn;
JobsKey(_gk_navTitleBtn)
@dynamic gk_navTitleBtn;
-(__kindof UIButton *)gk_navTitleBtn{
    UIButton *navTitleBtn = Jobs_getAssociatedObject(_gk_navTitleBtn);
    if (!navTitleBtn && self.gk_navTitleBtnModel) {
        navTitleBtn = UIButton.initByButtonModel(self.gk_navTitleBtnModel);
        Jobs_setAssociatedRETAIN_NONATOMIC(_gk_navTitleBtn, navTitleBtn)
        /// 父控件不能是self.gk_navigationBar。否则会造成约束与预想的出现偏差
        @jobs_weakify(self)
        self.view.addSubview(navTitleBtn)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                if(self.gk_navLeftBarButtonItem){
                    make.centerX.equalTo(self.gk_navigationBar);
                    make.bottom.equalTo(self.gk_navigationBar).offset(JobsWidth(-5));
                }else{
                    make.center.equalTo(self.gk_navigationBar);
                }make.size.mas_equalTo(self.gk_navTitleBtnModel.jobsSize);
            });
    };return navTitleBtn;
}

-(void)setGk_navTitleBtn:(__kindof UIButton *)gk_navTitleBtn{
    Jobs_setAssociatedRETAIN_NONATOMIC(_gk_navTitleBtn, gk_navTitleBtn)
}
#pragma mark —— Prop_strong(nullable)__kindof UILabel *gk_navMainTitleLab;
JobsKey(_gk_navMainTitleLab)
@dynamic gk_navMainTitleLab;
-(__kindof UILabel *)gk_navMainTitleLab{
    return Jobs_getAssociatedObject(_gk_navMainTitleLab);
}

-(void)setGk_navMainTitleLab:(__kindof UILabel *)gk_navMainTitleLab{
    Jobs_setAssociatedRETAIN_NONATOMIC(_gk_navMainTitleLab, gk_navMainTitleLab)
}
#pragma mark —— Prop_strong(nullable)__kindof UILabel *gk_navSubTitleLab;
JobsKey(_gk_navSubTitleLab)
@dynamic gk_navSubTitleLab;
-(__kindof UILabel *)gk_navSubTitleLab{
    return Jobs_getAssociatedObject(_gk_navSubTitleLab);
}

-(void)setGk_navSubTitleLab:(__kindof UILabel *)gk_navSubTitleLab{
    Jobs_setAssociatedRETAIN_NONATOMIC(_gk_navSubTitleLab, gk_navSubTitleLab)
}

@end

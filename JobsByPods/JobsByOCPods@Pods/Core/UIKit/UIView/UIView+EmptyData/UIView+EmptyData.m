//
//  UIView+EmptyData.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+EmptyData.h"

@implementation UIView (EmptyData)

-(jobsByVoidBlock _Nonnull)cleanSubview{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        for (UIView *subview in self.subviews) {
            [subview removeFromSuperview];
        }
    };
}

-(jobsByClsBlock _Nonnull)cleanSubviewBy{
    @jobs_weakify(self)
    return ^(Class _Nonnull cls){
        @jobs_strongify(self)
        for (UIView *subview in self.subviews) {
            if([subview isKindOfClass:cls]){
                [subview removeFromSuperview];
            }
        }
    };
}

-(void)ifEmptyData{
#ifdef DEBUG
    //光板返回YES，有其他控件返回NO
    @jobs_weakify(self)
    BOOL (^checkSubviews)(void) = ^(){
        @jobs_strongify(self)
        if (self.subviews.count) {// 有控件
            /// return YES;//除了self.tipsLab就没有了，光板;return NO;//有其他控件
            return [self.subviews[0] isEqual:self.tipsLab];
        }return YES;//光板
    };
    self.tipsLab.alpha = checkSubviews();
#endif
}
#pragma mark —— Prop_strong()UILabel *tipsLab;
JobsKey(_tipsLab)
@dynamic tipsLab;
-(UILabel *)tipsLab{
    UILabel *TipsLab = Jobs_getAssociatedObject(_tipsLab);
    if (!TipsLab) {
        @jobs_weakify(self)
        TipsLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byText(self.tipsTitle);
            label.byTextAlignment(NSTextAlignmentCenter);
                label.byTextCor(self.backgroundColor == JobsBlueColor ? JobsRedColor : JobsBlueColor);// 防止某些VC在调试阶段，设置view.backgroundColor为随机色
            label.byFont(UIFontWeightBoldSize(20));
            label.byNumberOfLines(0);
            label.makeLabelByShowingType(UILabelShowingType_03);
            [self addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(self);
            }];
        });Jobs_setAssociatedRETAIN_NONATOMIC(_tipsLab, TipsLab)
    }return TipsLab;
}

-(void)setTipsLab:(UILabel *)tipsLab{
    Jobs_setAssociatedRETAIN_NONATOMIC(_tipsLab, tipsLab)
}
#pragma mark —— Prop_copy()NSString *tipsTitle;
JobsKey(_tipsTitle)
@dynamic tipsTitle;
-(NSString *)tipsTitle{
    NSString *TipsTitle = Jobs_getAssociatedObject(_tipsTitle);
    if (isNull(TipsTitle)) {
        TipsTitle = @"快来将我填满吧".tr;
        Jobs_setAssociatedCOPY_NONATOMIC(_tipsTitle, TipsTitle)
    }return TipsTitle;
}

-(void)setTipsTitle:(NSString *)tipsTitle{
    Jobs_setAssociatedCOPY_NONATOMIC(_tipsTitle, tipsTitle)
}

@end

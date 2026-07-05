//
//  ZMJCell+CustomView.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ZMJCell+CustomView.h"

@implementation ZMJCell (CustomView)
#pragma mark —— Prop_strong()UIButton *btn;
JobsKey(_btn)
@dynamic btn;
-(void)setBtn:(UIButton *)btn{
    Jobs_setAssociatedRETAIN_NONATOMIC(_btn, btn);
}

-(UIButton *)btn{
    UIButton *Btn = Jobs_getAssociatedObject(_btn);
    if (!Btn) {
        Btn = (UIButton *)UIButton.alloc.init
            .byTitleLabel(^(UILabel *label) {
                label
                    .byFont([UIFont boldSystemFontOfSize:10.f])
                    .byTextAlignment(NSTextAlignmentCenter)
                    .byNumberOfLines(0);
            })
            .byFrame(self.bounds)
            .byUserInteractionEnabled(NO)/// cell上加button，要相应cell协议就要关闭button的userInteractionEnabled，如果要相应Button则需要打开
            .byAutoresizingMask(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth)
            .addOn(self.contentView);
        Jobs_setAssociatedRETAIN_NONATOMIC(_btn, Btn);
    };return Btn;
}
#pragma mark —— Prop_strong()UIView *colorBarView;
JobsKey(_colorBarView)
@dynamic colorBarView;
-(void)setColorBarView:(UIView *)colorBarView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_colorBarView, colorBarView);
}

-(UIView *)colorBarView{
    UIView *ColorBarView = Jobs_getAssociatedObject(_colorBarView);
    if (!ColorBarView) {
        @jobs_weakify(self)
        ColorBarView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view
                .byBgColor(self.color)
                .byFrame(CGRectInset(self.bounds, 2, 2))
                .addOn(self.contentView);
        });Jobs_setAssociatedRETAIN_NONATOMIC(_colorBarView, ColorBarView);
    };return ColorBarView;
}
#pragma mark —— Prop_strong()UIColor *color;
JobsKey(_color)
@dynamic color;
-(void)setColor:(UIColor *)color{
    Jobs_setAssociatedRETAIN_NONATOMIC(_color, color);
}

-(UIColor *)color{
    UIColor *Color = Jobs_getAssociatedObject(_color);
    if (!Color) {
        Color = UIColor.blueColor;
        Jobs_setAssociatedRETAIN_NONATOMIC(_color, Color);
    };return Color;
}

@end

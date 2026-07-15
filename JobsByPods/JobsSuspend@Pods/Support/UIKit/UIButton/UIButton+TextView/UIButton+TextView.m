//
//  UIButton+TextView.m
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIButton+TextView.h"

@implementation UIButton (TextView)
#pragma mark —— Prop_strong()BaseTextView *titleTextView;
JobsKey(_titleTextView)
@dynamic titleTextView;
-(BaseTextView *)titleTextView{
    BaseTextView *textView = Jobs_getAssociatedObject(_titleTextView);
    if (!textView) {
        textView = jobsMakeBaseTextView(^(__kindof BaseTextView * _Nullable textView) {
            textView
                .byEditable(NO)
                .byScrollEnabled(NO)
                .byBgColor(UIColor.clearColor)
                .addOn(self);
        });
        Jobs_setAssociatedRETAIN_NONATOMIC(_titleTextView, textView)
    };return textView;
}

-(void)setTitleTextView:(BaseTextView *)titleTextView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_titleTextView, titleTextView)
}

#pragma mark —— Prop_strong()BaseTextView *subtitleTextView;
JobsKey(_subtitleTextView)
@dynamic subtitleTextView;
-(BaseTextView *)subtitleTextView{
    BaseTextView *textView = Jobs_getAssociatedObject(_subtitleTextView);
    if (!textView) {
        textView = jobsMakeBaseTextView(^(__kindof BaseTextView * _Nullable textView) {
            textView
                .byEditable(NO)
                .byScrollEnabled(NO)
                .byBgColor(UIColor.clearColor)
                .addOn(self);
        });
        Jobs_setAssociatedRETAIN_NONATOMIC(_subtitleTextView, textView)
    };return textView;
}

-(void)setSubtitleTextView:(BaseTextView *)subtitleTextView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_subtitleTextView, subtitleTextView)
}

@end

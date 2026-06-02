//
//  UIButton+TextView.m
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIButton+TextView.h"

@implementation UITextView (JobsSuspendExtra)

-(JobsRetTextViewByAttributedStringBlock _Nonnull)byAttributedText{
    @jobs_weakify(self)
    return ^__kindof UITextView *_Nullable(__kindof NSAttributedString *_Nullable attributedString) {
        @jobs_strongify(self)
        self.attributedText = attributedString;
        return self;
    };
}

@end

@implementation UIButton (TextView)

#pragma mark —— Prop_strong()BaseTextView *titleTextView;
JobsKey(_titleTextView)
@dynamic titleTextView;
-(BaseTextView *)titleTextView{
    BaseTextView *textView = Jobs_getAssociatedObject(_titleTextView);
    if (!textView) {
        textView = BaseTextView.new;
        textView.editable = NO;
        textView.scrollEnabled = NO;
        textView.backgroundColor = UIColor.clearColor;
        [self addSubview:textView];
        Jobs_setAssociatedRETAIN_NONATOMIC(_titleTextView, textView)
    }return textView;
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
        textView = BaseTextView.new;
        textView.editable = NO;
        textView.scrollEnabled = NO;
        textView.backgroundColor = UIColor.clearColor;
        [self addSubview:textView];
        Jobs_setAssociatedRETAIN_NONATOMIC(_subtitleTextView, textView)
    }return textView;
}

-(void)setSubtitleTextView:(BaseTextView *)subtitleTextView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_subtitleTextView, subtitleTextView)
}

@end

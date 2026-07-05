//
//  UIButton+TextView.m
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIButton+TextView.h"

@implementation UIButton (TextView)
#pragma mark —— 一些私有方法
-(jobsByTextViewBlock _Nonnull)configTextView{
    @jobs_weakify(self)
    return ^(__kindof UITextView *_Nullable textView){
        @jobs_strongify(self)

        textView.byDelegate(self);
        textView.byEditable(NO);
        textView.bySelectable(YES);
        textView.byDataDetectorTypes(UIDataDetectorTypeLink);
        textView.byTextAlignment(NSTextAlignmentCenter);
        textView.byLinkTextAttributes(@{
            NSForegroundColorAttributeName: UIColor.yellowColor,
            NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle),
            NSUnderlineColorAttributeName: UIColor.yellowColor
        });
        textView.byScrollEnabled(NO);
        textView.byUserInteractionEnabled(YES);
        textView.byBgColor(JobsClearColor);
        /// 将 textView 添加到当前视图
        self.addSubview(textView);
    };
}
#pragma mark —— UITextViewDelegate
-(nullable UIAction *)textView:(UITextView *)textView
      primaryActionForTextItem:(UITextItem *)textItem
                 defaultAction:(UIAction *)defaultAction API_AVAILABLE(ios(17.0)){
    textItem.textView = textView;
    if(self.objBlock) self.objBlock(textItem);
    return defaultAction; // 默认行为
}
#pragma mark —— Prop_strong()JobsBasePopupTextView *titleTextView;
JobsKey(_titleTextView)
@dynamic titleTextView;
-(JobsBasePopupTextView *)titleTextView{
    JobsBasePopupTextView *textView = Jobs_getAssociatedObject(_titleTextView);
    if(!textView){
        @jobs_weakify(self)
        textView = jobsMakeJobsBasePopupTextView(^(__kindof JobsBasePopupTextView * _Nullable textView) {
            @jobs_strongify(self)
            textView.byFrame(self.titleLabel.frame);
//            textView.linkTextAttributes = self.makeLinkTextAttributes;
            self.configTextView(textView);
          });Jobs_setAssociatedRETAIN_NONATOMIC(_titleTextView, textView);
    };return textView;
}

-(void)setTitleTextView:(JobsBasePopupTextView *)titleTextView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_titleTextView, titleTextView)
}
#pragma mark —— Prop_strong()UITextView *subtitleTextView;
JobsKey(_subtitleTextView)
@dynamic subtitleTextView;
-(JobsBasePopupTextView *)subtitleTextView{
    JobsBasePopupTextView *textView = Jobs_getAssociatedObject(_subtitleTextView);
    if(!textView){
        @jobs_weakify(self)
        textView = jobsMakeJobsBasePopupTextView(^(__kindof JobsBasePopupTextView * _Nullable textView) {
            @jobs_strongify(self)
            textView.byFrame(self.titleLabel.frame);
            self.configTextView(textView);
          });Jobs_setAssociatedRETAIN_NONATOMIC(_subtitleTextView, textView);
    };return textView;
}

-(void)setSubtitleTextView:(JobsBasePopupTextView *)subtitleTextView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_subtitleTextView, subtitleTextView)
}

@end

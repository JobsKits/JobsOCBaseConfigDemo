//
//  UIButton+TextView.m
//  JobsBaseUI
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
        textView.byDelegate(self)
        .byEditable(NO)// UITextView 即使是不可编辑的情况下，也会处理点击事件，如链接检测和文本选择
        .byTextAlignment(NSTextAlignmentCenter)
        .bySelectable(YES)// 确保可以选择
        .byDataDetectorTypes(UIDataDetectorTypeLink)// 启用链接检测
        .byScrollEnabled(NO)
        .byUserInteractionEnabled(YES)// 需要处理点击事件，比如：链接检测和文本选择
        .byBgColor(JobsClearColor)
            /// 对于 textView，只有通过下面的方法，才可以完整修改超链接的文字 + 下划线颜色
//            .byLinkTextAttributes(@{
//                NSForegroundColorAttributeName: UIColor.yellowColor,
//                NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle),
//                NSUnderlineColorAttributeName: UIColor.yellowColor
//            })
        .addOn(self);
    };
}
#pragma mark —— UITextViewDelegate
-(nullable UIAction *)textView:(UITextView *)textView
      primaryActionForTextItem:(UITextItem *)textItem
                 defaultAction:(UIAction *)defaultAction API_AVAILABLE(ios(17.0)){
    textItem.byTextView(textView);
    if(self.objBlock) self.objBlock(textItem);
    return defaultAction; // 默认行为
}
#pragma mark —— Prop_strong()BaseTextView *titleTextView;
JobsKey(_titleTextView)
@dynamic titleTextView;
-(BaseTextView *)titleTextView{
    BaseTextView *textView = Jobs_getAssociatedObject(_titleTextView);
    if(!textView){
        @jobs_weakify(self)
        textView = jobsMakeBaseTextView(^(__kindof BaseTextView * _Nullable textView) {
            @jobs_strongify(self)
            textView.byFrame(self.titleLabel.frame);
//            textView.linkTextAttributes = self.makeLinkTextAttributes;
            self.configTextView(textView);
          });Jobs_setAssociatedRETAIN_NONATOMIC(_titleTextView, textView);
    };return textView;
}

-(void)setTitleTextView:(UITextView *)titleTextView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_titleTextView, titleTextView)
}
#pragma mark —— Prop_strong()UITextView *subtitleTextView;
JobsKey(_subtitleTextView)
@dynamic subtitleTextView;
-(BaseTextView *)subtitleTextView{
    BaseTextView *textView = Jobs_getAssociatedObject(_subtitleTextView);
    if(!textView){
        @jobs_weakify(self)
        textView = jobsMakeBaseTextView(^(__kindof BaseTextView * _Nullable textView) {
            @jobs_strongify(self)
            textView.byFrame(self.titleLabel.frame);
            self.configTextView(textView);
          });Jobs_setAssociatedRETAIN_NONATOMIC(_subtitleTextView, textView);
    };return textView;
}

-(void)setSubtitleTextView:(UITextView *)subtitleTextView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_subtitleTextView, subtitleTextView)
}

@end

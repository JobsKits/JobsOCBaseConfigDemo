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
        textView.backgroundColor = JobsClearColor;
        textView.delegate = self;
        textView.userInteractionEnabled = YES; // 需要处理点击事件（比如：链接检测和文本选择）
        textView.editable = NO;// UITextView 即使是不可编辑的情况下（editable = NO），也会处理点击事件（如链接检测和文本选择）。这会阻止事件向父视图传递。
        textView.scrollEnabled = NO;
        textView.textAlignment = NSTextAlignmentCenter;
        textView.selectable = YES; // 确保可以选择
        textView.dataDetectorTypes = UIDataDetectorTypeLink; // 启用链接检测
        /// 对于 textView ，只有通过下面的方法，才可以完整的修改超链接的（文字+下划线）的颜色
//        textView.linkTextAttributes = @{
//            NSForegroundColorAttributeName: UIColor.yellowColor,
//            NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle),
//            NSUnderlineColorAttributeName: UIColor.yellowColor
//        };
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
            textView.frame = self.titleLabel.frame;
//            textView.linkTextAttributes = self.makeLinkTextAttributes;
            self.configTextView(textView);
          });Jobs_setAssociatedRETAIN_NONATOMIC(_titleTextView, textView);
    }return textView;
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
            textView.frame = self.titleLabel.frame;
            self.configTextView(textView);
          });Jobs_setAssociatedRETAIN_NONATOMIC(_subtitleTextView, textView);
    }return textView;
}

-(void)setSubtitleTextView:(JobsBasePopupTextView *)subtitleTextView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_subtitleTextView, subtitleTextView)
}

@end

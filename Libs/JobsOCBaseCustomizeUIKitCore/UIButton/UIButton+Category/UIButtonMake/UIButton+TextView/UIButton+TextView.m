//
//  UIButton+TextView.m
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIButton+TextView.h"

@interface UIButton (JobsMJRefreshOptionalTextView)

-(Class _Nullable)jobs_mjRefreshTextViewClass;
-(UITextView *_Nullable)jobs_mjRefreshCreateTextView;

@end

@implementation UIButton (TextView)

#pragma mark —— 一些私有方法
-(Class _Nullable)jobs_mjRefreshTextViewClass{
    return NSClassFromString(@"JobsBasePopupTextView") ?: NSClassFromString(@"BaseTextView");
}

-(UITextView *_Nullable)jobs_mjRefreshCreateTextView{
    Class textViewClass = [self jobs_mjRefreshTextViewClass];
    if (!textViewClass || ![textViewClass isSubclassOfClass:UITextView.class]) {
        return nil;
    }
    UITextView *textView = [[textViewClass alloc] init];
    if (![textView isKindOfClass:UITextView.class]) {
        return nil;
    }
    textView.byLinkTextAttributes(NSObject.linkTextAttributes());
    return textView;
}

-(jobsByTextViewBlock _Nonnull)configTextView{
    @jobs_weakify(self)
    return ^(__kindof UITextView *_Nullable textView){
        @jobs_strongify(self)
        textView
            .byDelegate(self)
            .byEditable(NO)
            .bySelectable(YES)
            .byDataDetectorTypes(UIDataDetectorTypeLink)
            .byTextAlignment(NSTextAlignmentCenter)
            .byLinkTextAttributes(NSObject.linkTextAttributes())
            .byScrollEnabled(NO)
            .byUserInteractionEnabled(YES)
            .byBgColor(JobsClearColor);
        /// 将 textView 添加到当前视图
        self.addSubview(textView);
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
#pragma mark —— Prop_strong()JobsBasePopupTextView *titleTextView;
JobsKey(_titleTextView)
@dynamic titleTextView;
-(JobsBasePopupTextView *_Nullable)titleTextView{
    JobsBasePopupTextView *textView = Jobs_getAssociatedObject(_titleTextView);
    if (!textView) {
        textView = (JobsBasePopupTextView *)[self jobs_mjRefreshCreateTextView];
        if (!textView) {
            return nil;
        }
        textView.byFrame(self.titleLabel.frame);
        self.configTextView(textView);
        Jobs_setAssociatedRETAIN_NONATOMIC(_titleTextView, textView);
    }
    return textView;
}

-(void)setTitleTextView:(JobsBasePopupTextView *_Nullable)titleTextView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_titleTextView, titleTextView)
}
#pragma mark —— Prop_strong()UITextView *subtitleTextView;
JobsKey(_subtitleTextView)
@dynamic subtitleTextView;
-(JobsBasePopupTextView *_Nullable)subtitleTextView{
    JobsBasePopupTextView *textView = Jobs_getAssociatedObject(_subtitleTextView);
    if (!textView) {
        textView = (JobsBasePopupTextView *)[self jobs_mjRefreshCreateTextView];
        if (!textView) {
            return nil;
        }
        textView.byFrame(self.titleLabel.frame);
        self.configTextView(textView);
        Jobs_setAssociatedRETAIN_NONATOMIC(_subtitleTextView, textView);
    }
    return textView;
}

-(void)setSubtitleTextView:(JobsBasePopupTextView *_Nullable)subtitleTextView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_subtitleTextView, subtitleTextView)
}

@end

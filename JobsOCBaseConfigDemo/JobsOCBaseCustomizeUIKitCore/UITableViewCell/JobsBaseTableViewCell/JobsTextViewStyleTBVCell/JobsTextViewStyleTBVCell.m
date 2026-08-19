//
//  JobsTextViewStyleTBVCell.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsTextViewStyleTBVCell.h"

#import "NSString+Sys.h"
#import "NSObject+Extra.h"
#import "SZTextView+Extra.h"
#import "UITableView+RegisterClass.h"
#import "UIView+Extra.h"

@interface JobsTextViewStyleTBVCell ()

@end

@implementation JobsTextViewStyleTBVCell
/// UIViewModelProtocol
UIViewModelProtocol_synthesize_part1
UIViewModelProtocol_synthesize_part2
/// BaseLayerProtocol
BaseLayerProtocol_synthesize_part3
/// BaseViewProtocol
BaseViewProtocol_synthesize
-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTextViewStyleTBVCell.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
    };
}
#pragma mark —— BaseCellProtocol
/// UITableViewCell
+(JobsRetTableViewCellByTableViewBlock _Nonnull)cellStyleDefaultByTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsTextViewStyleTBVCell *cell = JobsRegisterDequeueTableViewDefaultCell(JobsTextViewStyleTBVCell);
        return cell;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UIViewModel __kindof *_Nullable model) {
        @jobs_strongify(self)
        self.byViewModel(model);
        self.textView.byAlpha(1);
        return self;
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(55);
    };
}
#pragma mark —— BaseViewProtocol
/// 获取绑定的数据源
-(UIViewModel *_Nullable)getViewModel{
    JobsRetViewModelByVoidBlock action = ((JobsRetViewModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTextViewStyleTBVCell.class, @selector(jobsGetViewModel)))(self, @selector(jobsGetViewModel));
    return action ? action() : nil;
}

-(JobsRetViewModelByVoidBlock _Nonnull)jobsGetViewModel{
    @jobs_weakify(self)
    return ^UIViewModel *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.viewModel;
    };
}
//-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
//    [UIMenuController.sharedMenuController update];
//    return YES;
//}
////-(BOOL)textViewShouldEndEditing:(UITextView *)textView;
//-(void)textViewDidBeginEditing:(UITextView *)textView{
////    textView.text = _textData2;
//    JobsLog(@"333");
//}
////-(void)textViewDidEndEditing:(UITextView *)textView;
//-(BOOL)textView:(UITextView *)textView
//shouldChangeTextInRange:(NSRange)range
//replacementText:(NSString *)text{
//    JobsLog(@"21");
//    return YES;
//}
//-(void)textViewDidChange:(UITextView *)textView{
//
//}
//-(void)textViewDidChangeSelection:(UITextView *)textView{
//
//}
//-(nullable UIMenu *)textView:(UITextView *)textView editMenuForTextInRange:(NSRange)range suggestedActions:(NSArray<UIMenuElement *> *)suggestedActions API_AVAILABLE(ios(16.0));
//-(void)textView:(UITextView *)textView willPresentEditMenuWithAnimator:(id<UIEditMenuInteractionAnimating>)animator API_AVAILABLE(ios(16.0)) API_UNAVAILABLE(tvos, watchos);
//-(void)textView:(UITextView *)textView willDismissEditMenuWithAnimator:(id<UIEditMenuInteractionAnimating>)animator API_AVAILABLE(ios(16.0)) API_UNAVAILABLE(tvos, watchos);
//-(nullable UIAction *)textView:(UITextView *)textView primaryActionForTextItem:(UITextItem *)textItem defaultAction:(UIAction *)defaultAction API_AVAILABLE(ios(17.0)) API_UNAVAILABLE(tvos, watchos);
//-(nullable UITextItemMenuConfiguration *)textView:(UITextView *)textView menuConfigurationForTextItem:(UITextItem *)textItem defaultMenu:(UIMenu *)defaultMenu API_AVAILABLE(ios(17.0)) API_UNAVAILABLE(watchos, tvos);
//-(void)textView:(UITextView *)textView textItemMenuWillDisplayForTextItem:(UITextItem *)textItem animator:(id<UIContextMenuInteractionAnimating>)animator API_AVAILABLE(ios(17.0)) API_UNAVAILABLE(watchos, tvos);
//-(void)textView:(UITextView *)textView textItemMenuWillEndForTextItem:(UITextItem *)textItem animator:(id<UIContextMenuInteractionAnimating>)animator API_AVAILABLE(ios(17.0)) API_UNAVAILABLE(watchos, tvos);
//-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction API_DEPRECATED("Replaced by primaryActionForTextItem: and menuConfigurationForTextItem: for additional customization options.", ios(10.0, 17.0), visionos(1.0, 1.0));
//-(BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction API_DEPRECATED("Replaced by primaryActionForTextItem: and menuConfigurationForTextItem: for additional customization options.", ios(10.0, 17.0), visionos(1.0, 1.0));
//-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange API_DEPRECATED_WITH_REPLACEMENT("textView:shouldInteractWithURL:inRange:interaction:", ios(7.0, 10.0)) API_UNAVAILABLE(visionos);
//-(BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange API_DEPRECATED_WITH_REPLACEMENT("textView:shouldInteractWithTextAttachment:inRange:interaction:", ios(7.0, 10.0)) API_UNAVAILABLE(visionos);
#pragma mark —— lazyLoad
/// 如果需要用其他的自定义的TextView，继承此类并重写-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy;
-(__kindof UITextView *)textView{
    if (!_textView) {
        @jobs_weakify(self)
        _textView = jobsMakeTextView(^(__kindof UITextView * _Nullable textView) {
            @jobs_strongify(self)
            textView
                .byDelegate(self)
                .byDataDetectorTypes(UIDataDetectorTypeLink)
                .byEditable(NO)
                .bySelectable(YES);
            /// 富文本的优先级大于普通文本
            if(self.viewModel.attributedTitle){
                textView.byAttributedText(self.viewModel.attributedTitle);
            }else{
                textView.byText(self.viewModel.text);
                textView.byTextAlignment(self.viewModel.textAlignment);
                textView.byTextColor(self.viewModel.textCor);
                textView.byFont(self.viewModel.font);
            }textView.addOn(self.contentView).byAdd(self.masonryBlock);
        });
    };return _textView;
}

-(__kindof SZTextView *)szTextView{
    if (!_szTextView) {
        @jobs_weakify(self)
        _szTextView = jobsMakeSZTextView(^(SZTextView * _Nonnull textView) {
            @jobs_strongify(self)
            textView
                .byPlaceholder(@"请输入充值金额".jobsTr())
                .byFont(UIFontWeightMediumSize(18))
                .byPlaceholderFont(textView.font)
                .byPlaceholderColor(JobsPlaceholderTextColor)
                .byTextColor(JobsLabelColor)
                .byDelegate(self)
                .byReturnKeyType(UIReturnKeyDefault)
                .byKeyboardAppearance(UIKeyboardAppearanceDefault)
                .byKeyboardType(UIKeyboardTypeNumberPad)
                .byBgColor(JobsSecondarySystemBackgroundColor);
            [textView jobsTextViewFilterBlock:^BOOL(id  _Nullable data) {
//                @jobs_strongify(self)
                return YES;
            } subscribeNextBlock:^(id _Nullable x) {
//                @jobs_strongify(self)
            }];textView.addOn(self.contentView).byAdd(self.masonryBlock);
        });
    };return _szTextView;
}

-(__kindof JobsTextView *)jobsTextView{
    if(!_jobsTextView){
        @jobs_weakify(self)
        _jobsTextView = makeJobsTextView(^(__kindof JobsTextView * _Nullable textView) {
            @jobs_strongify(self)
            textView.szTextView
                .byTextColor(JobsLabelColor)
                .byDelegate(self);
            textView
                .byReturnKeyType_(UIReturnKeyDefault)
                .byKeyboardAppearance_(UIKeyboardAppearanceDefault)
                .byKeyboardType_(UIKeyboardTypeNumberPad)
                .byPlaceholder(@"请输入充值金额".jobsTr())
                .byFont(UIFontWeightMediumSize(18))
                .byPlaceholderFont(textView.font)
                .byPlaceholderColor(JobsPlaceholderTextColor)
                .byBgColor(JobsSecondarySystemBackgroundColor);
            [textView.szTextView jobsTextViewFilterBlock:^BOOL(id _Nullable data) {
//                @jobs_strongify(self)
                return YES;
            } subscribeNextBlock:^(id _Nullable x) {
//                @jobs_strongify(self)
            }];textView.addOn(self.contentView).byAdd(self.masonryBlock);
        });
    };return _jobsTextView;
}

-(jobsByMASConstraintMakerBlock _Nullable)masonryBlock{
    @jobs_weakify(self)
    return ^(MASConstraintMaker *_Nonnull make){
        @jobs_strongify(self)
        make.edges.equalTo(self.contentView);
    };
}

@end

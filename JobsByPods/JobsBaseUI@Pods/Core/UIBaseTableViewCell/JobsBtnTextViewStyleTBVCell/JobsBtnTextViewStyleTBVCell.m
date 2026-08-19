//
//  JobsBtnTextViewStyleTBVCell.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsBtnTextViewStyleTBVCell.h"

#import <JobsBaseUI/UITextView+Extra.h>
#import <JobsBaseUI/NSString+Sys.h>
#import <JobsBaseUI/NSObject+Extra.h>
#import <SZTextViewExtra/SZTextView+Extra.h>
#import <JobsBaseUI/UIButton+SimplyMake.h>
#import <JobsBaseUI/UIButton+UI.h>
#import <JobsBaseUI/UITableView+RegisterClass.h>
#import <JobsBaseUI/UIView+Extra.h>

@interface JobsBtnTextViewStyleTBVCell ()

@end

@implementation JobsBtnTextViewStyleTBVCell
/// UIViewModelProtocol
UIViewModelProtocol_synthesize_part1
UIViewModelProtocol_synthesize_part2
/// BaseLayerProtocol
BaseLayerProtocol_synthesize_part3
/// BaseViewProtocol
BaseViewProtocol_synthesize
/// AppToolsProtocol
AppToolsProtocol_synthesize
-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsBtnTextViewStyleTBVCell.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
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
    return ^__kindof UITableViewCell *_Nullable(UITableView * _Nonnull tableView) {
        JobsBtnTextViewStyleTBVCell *cell = JobsRegisterDequeueTableViewDefaultCell(JobsBtnTextViewStyleTBVCell);
        return cell;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        if([data isKindOfClass:UIViewModel.class]) {
            self.byViewModel(data);
            self.button.bgColorBy(self.viewModel.bgCor)
                .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
                .jobsResetImagePadding(self.viewModel.imagePadding)
                .jobsResetBtnImage(self.viewModel.image)
                .jobsResetBtnBgImage(self.viewModel.bgImage)
                .jobsResetBtnTitleCor(self.viewModel.titleCor)
                .jobsResetBtnTitleFont(self.viewModel.titleFont)
                .jobsResetBtnTitle(self.viewModel.title ? : @"");
            /// 富文本的优先级大于普通文本
            if(self.viewModel.attributedTitle){
                self.textView.byAttributedText(self.viewModel.attributedTitle);
            }else{
                self.textView
                    .byText(self.viewModel.text)
                    .byTextCor(self.viewModel.textCor)
                    .byFont(self.viewModel.font);
                self.textView.byTextAlignment(self.viewModel.textAlignment);
            }if(!self.viewModel.selectedImage_) self.viewModel.selectedImage_ = self.viewModel.image;
        }
        if([data isKindOfClass:UIButtonModel.class]) {
            self.byButtonModel(data);
            self.button.bgColorBy(self.buttonModel.baseBackgroundColor)
                .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
                .jobsResetImagePadding(self.buttonModel.imagePadding)
                .jobsResetBtnImage(self.buttonModel.normalImage)
                .jobsResetBtnBgImage(self.buttonModel.backgroundImage)
                .jobsResetBtnTitleCor(self.buttonModel.titleCor)
                .jobsResetBtnTitleFont(self.buttonModel.titleFont)
                .jobsResetBtnTitle(self.buttonModel.title ? : @"");
            /// 富文本的优先级大于普通文本
            if(self.buttonModel.attributedTitle){
                self.textView.byAttributedText(self.buttonModel.attributedTitle);
            }else{
                self.textView.byText(self.buttonModel.title);
                self.textView.byTextAlignment(self.buttonModel.textAlignment);
                /// 从 iOS 16 起，UITextView 使用新的文本渲染系统，会使用 UITextLayoutFragmentView。
                /// 它默认在某些情况下会将内容垂直居中，比如文本少、没有足够内容填满 UITextView 的高度时。
                /// 所以一下操作就是在关闭这个新特性
                self.textView.switchs();
                self.textView
                    .byTextCor(self.buttonModel.titleCor)
                    .byFont(self.buttonModel.titleFont);
            }if(!self.buttonModel.highlightImage) self.buttonModel.highlightImage = self.buttonModel.normalImage;
        };return self;
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(55);
    };
}
#pragma mark —— UITextViewDelegate
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
//    [textView setContentOffset:CGPointZero animated:NO];
//}
//-(void)textViewDidChangeSelection:(UITextView *)textView{
//
//}
//-(nullable UIMenu *)textView:(UITextView *)textView editMenuForTextInRange:(NSRange)range suggestedActions:(NSArray<UIMenuElement *> *)suggestedActions API_AVAILABLE(ios(16.0));
//-(void)textView:(UITextView *)textView willPresentEditMenuWithAnimator:(id<UIEditMenuInteractionAnimating>)animator API_AVAILABLE(ios(16.0)) API_UNAVAILABLE(tvos, watchos);
//-(void)textView:(UITextView *)textView willDismissEditMenuWithAnimator:(id<UIEditMenuInteractionAnimating>)animator API_AVAILABLE(ios(16.0)) API_UNAVAILABLE(tvos, watchos);
/// API_AVAILABLE(ios(17.0)) API_UNAVAILABLE(tvos, watchos);
-(nullable UIAction *)textView:(UITextView *)textView
      primaryActionForTextItem:(UITextItem *)textItem
                 defaultAction:(UIAction *)defaultAction{
    NSString *url = @"";
    if(self.viewModel) url = self.viewModel.url.absoluteString;
    if(self.buttonModel) url = self.buttonModel.url.absoluteString;
    /// 检查文本项是否为链接类型
    if (textItem.link.absoluteString.containsString(url)) {
        /// 创建一个自定义的 UIAction
        return jobsMakeAction(@"自定义操作".jobsTr(),
                              nil,
                              nil,
                              ^(__kindof UIAction * _Nonnull action) {
            if(self.objBlock) self.objBlock(action);
        }, nil);
    };return defaultAction;/// 如果没有匹配到自定义条件，返回默认的动作
}
//-(nullable UITextItemMenuConfiguration *)textView:(UITextView *)textView menuConfigurationForTextItem:(UITextItem *)textItem defaultMenu:(UIMenu *)defaultMenu API_AVAILABLE(ios(17.0)) API_UNAVAILABLE(watchos, tvos);
//-(void)textView:(UITextView *)textView textItemMenuWillDisplayForTextItem:(UITextItem *)textItem animator:(id<UIContextMenuInteractionAnimating>)animator API_AVAILABLE(ios(17.0)) API_UNAVAILABLE(watchos, tvos);
//-(void)textView:(UITextView *)textView textItemMenuWillEndForTextItem:(UITextItem *)textItem animator:(id<UIContextMenuInteractionAnimating>)animator API_AVAILABLE(ios(17.0)) API_UNAVAILABLE(watchos, tvos);
//-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction API_DEPRECATED("Replaced by primaryActionForTextItem: and menuConfigurationForTextItem: for additional customization options.", ios(10.0, 17.0), visionos(1.0, 1.0));
//-(BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction API_DEPRECATED("Replaced by primaryActionForTextItem: and menuConfigurationForTextItem: for additional customization options.", ios(10.0, 17.0), visionos(1.0, 1.0));
//-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange API_DEPRECATED_WITH_REPLACEMENT("textView:shouldInteractWithURL:inRange:interaction:", ios(7.0, 10.0)) API_UNAVAILABLE(visionos);
//-(BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange API_DEPRECATED_WITH_REPLACEMENT("textView:shouldInteractWithTextAttachment:inRange:interaction:", ios(7.0, 10.0)) API_UNAVAILABLE(visionos);
#pragma mark —— lazyLoad
-(__kindof UIButton *)button{
    if(!_button){
        @jobs_weakify(self)
        _button = UIButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetImagePadding(1)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                x.byToggleSelected();
                if(self.objBlock) self.objBlock(x);
                if(self.viewModel){
                    if(self.viewModel.selectedImage_) x.jobsResetBtnImage(x.jobs_isSelected ? self.viewModel.selectedImage_ : self.viewModel.image);
                }
                if(self.buttonModel){
                    if(self.buttonModel.normalImage) x.jobsResetBtnImage(x.jobs_isSelected ? self.buttonModel.highlightImage : self.buttonModel.normalImage);
                }
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
        _button.addOn(self.contentView).byAdd(^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(20), JobsWidth(20)));
            make.left.equalTo(self.contentView).offset(JobsWidth(13));
            make.top.equalTo(self.contentView);
        });
    };return _button;
}
/// 如果需要用其他的自定义的TextView，继承此类并重写-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy;
-(__kindof BaseTextView *)textView{
    if (!_textView) {
        @jobs_weakify(self)
        _textView = jobsMakeBaseTextView(^(__kindof BaseTextView * _Nullable textView) {
            @jobs_strongify(self)
            textView
                .byDataDetectorTypes(UIDataDetectorTypeLink)
                .byEditable(NO)
                .bySelectable(YES)
                .byLinkTextAttributes(self.makeLinkTextAttributes())
                .byDelegate(self)
                .byScrollEnabled(NO)
                .byBgColor(JobsClearColor)
                .addOn(self.contentView).byAdd(self.masonryBlock);
        });
    };return _textView;
}

-(__kindof SZTextView *)szTextView{
    if (!_szTextView) {
        @jobs_weakify(self)
        _szTextView = jobsMakeSZTextView(^(SZTextView * _Nonnull textView) {
            @jobs_strongify(self)
            textView
                .byTextCor(JobsLabelColor)
                .byFont(UIFontWeightMediumSize(18))
                .byPlaceholder(@"请输入充值金额".jobsTr())
                .byPlaceholderFont(textView.font)
                .byPlaceholderColor(JobsPlaceholderTextColor)
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
                .byTextCor(JobsLabelColor)
                .byDelegate(self)
                .byBgColor(JobsClearColor);
            textView
                .byReturnKeyType_(UIReturnKeyDefault)
                .byKeyboardAppearance_(UIKeyboardAppearanceDefault)
                .byKeyboardType_(UIKeyboardTypeNumberPad)
                .byPlaceholder(@"请输入充值金额".jobsTr())
                .byFont(UIFontWeightMediumSize(18))
                .byPlaceholderFont(textView.font)
                .byPlaceholderColor(JobsPlaceholderTextColor)
                .byBgColor(JobsClearColor);
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
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.button.mas_right).offset(JobsWidth(10));
        make.right.bottom.equalTo(self.contentView);
    };
}

@end

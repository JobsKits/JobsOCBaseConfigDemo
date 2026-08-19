//
//  JobsTextViewStyleCVCell.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsTextViewStyleCVCell.h"

#import "CALayer+Extra.h"
#import "UICollectionView+JobsRegisterClass.h"
#import "SZTextView+Extra.h"
#import "UITextField+Extra.h"
#import "NSString+Sys.h"
#import "NSObject+Extra.h"

@interface JobsTextViewStyleCVCell ()

@end

@implementation JobsTextViewStyleCVCell
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
/// UIViewModelProtocol
UIViewModelProtocol_synthesize_part1
UIViewModelProtocol_synthesize_part2
/// BaseLayerProtocol
BaseLayerProtocol_synthesize_part3
/// BaseViewProtocol
BaseViewProtocol_synthesize
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    };return self;
}
#pragma mark —— BaseViewProtocol
-(UIViewModel *_Nullable)getViewModel{
    JobsRetViewModelByVoidBlock action = ((JobsRetViewModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTextViewStyleCVCell.class, @selector(jobsGetViewModel)))(self, @selector(jobsGetViewModel));
    return action ? action() : nil;
}

-(JobsRetViewModelByVoidBlock _Nonnull)jobsGetViewModel{
    @jobs_weakify(self)
    return ^UIViewModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.viewModel;
    };
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    JobsTextViewStyleCVCell *cell = JobsRegisterDequeueCollectionViewCell(JobsTextViewStyleCVCell);
    return (JobsTextViewStyleCVCell *)cell
        .byContentView(^(__kindof UIView * _Nullable view) {
            view.byLayer(^(CALayer * _Nullable layer) {
                layer
                    .cornerRadiusBy(JobsWidth(8))
                    .borderWidthBy(JobsWidth(1))
                    .borderColorBy(RGBA_COLOR(255, 225, 144, 1))
                    .masksToBoundsBy(YES);
            });
        })
        .byIndexPath(indexPath)
        .byLayer(^(CALayer * _Nullable layer) {
            layer
                .cornerRadiusBy(JobsWidth(8))
                .borderWidthBy(JobsWidth(1))
                .borderColorBy(RGBA_COLOR(255, 225, 144, 1))
                .masksToBoundsBy(YES);
        });
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.byViewModel(model);
        self.textField.byAlpha(1);
        return self;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)cellSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(327), JobsWidth(48));
    };
}
#pragma mark —— 一些公有方法
-(ZYTextField *)getTextField{
    JobsRetZYTextFieldByVoidBlock action = ((JobsRetZYTextFieldByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTextViewStyleCVCell.class, @selector(jobsGetTextField)))(self, @selector(jobsGetTextField));
    return action ? action() : nil;
}

-(JobsRetZYTextFieldByVoidBlock _Nonnull)jobsGetTextField{
    @jobs_weakify(self)
    return ^ZYTextField *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.textField;
    };
}
#pragma mark —— 一些私有方法
/// TODO
#pragma mark —— lazyLoad
/// 如果需要用其他的自定义的TextView，继承此类并重写-(JobsRetCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy;
-(__kindof UITextView *)textView{
    if (!_textView) {
        @jobs_weakify(self)
        _textView = self.contentView.addSubview(jobsMakeTextView(^(__kindof UITextView * _Nullable textView) {
            @jobs_strongify(self)
            textView
                .byDelegate(self)
                .byDataDetectorTypes(UIDataDetectorTypeLink)
                .byEditable(NO)
                .bySelectable(YES)
                .byLinkTextAttributes(self.makeLinkTextAttributes());
            /// 富文本的优先级大于普通文本
            if(self.viewModel.attributedTitle){
                textView.byAttributedText(self.viewModel.attributedTitle);
                textView.byLinkTextAttributes(self.makeLinkTextAttributes());
            }else{
                textView.byText(self.viewModel.text);
                textView.byTextAlignment(self.viewModel.textAlignment);
                textView.byTextColor(self.viewModel.textCor);
                textView.byFont(self.viewModel.font);
            }
        })).byAdd(self.masonryBlock);
    };return _textView;
}

-(__kindof SZTextView *)szTextView{
    if (!_szTextView) {
        @jobs_weakify(self)
        _szTextView = self.contentView.addSubview(jobsMakeSZTextView(^(SZTextView * _Nonnull textView) {
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
                .byLinkTextAttributes(self.makeLinkTextAttributes())
                .byBgColor(JobsSecondarySystemBackgroundColor);
            [textView jobsTextViewFilterBlock:^BOOL(id  _Nullable data) {
//                @jobs_strongify(self)
                return YES;
            } subscribeNextBlock:^(id _Nullable x) {
//                @jobs_strongify(self)
            }];
        })).byAdd(self.masonryBlock);
    };return _szTextView;
}

-(__kindof JobsTextView *)jobsTextView{
    if(!_jobsTextView){
        @jobs_weakify(self)
        _jobsTextView = self.contentView.addSubview(makeJobsTextView(^(__kindof JobsTextView * _Nullable textView) {
            @jobs_strongify(self)
            textView.szTextView
                .byTextColor(JobsLabelColor)
                .byDelegate(self)
                .byLinkTextAttributes(self.makeLinkTextAttributes());
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
            }];
        })).byAdd(self.masonryBlock);
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

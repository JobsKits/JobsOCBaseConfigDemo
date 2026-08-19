//
//  JobsTextFieldStyleCVCell.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsTextFieldStyleCVCell.h"

#import "CALayer+Extra.h"
#import "NSString+Sys.h"
#import "NSObject+Extra.h"
#import "UICollectionView+JobsRegisterClass.h"
#import "UITextField+Extra.h"

@interface JobsTextFieldStyleCVCell ()

@end

@implementation JobsTextFieldStyleCVCell
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    };return self;
}
#pragma mark —— BaseViewProtocol
-(UIViewModel *_Nullable)getViewModel{
    JobsRetViewModelByVoidBlock action = ((JobsRetViewModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTextFieldStyleCVCell.class, @selector(jobsGetViewModel)))(self, @selector(jobsGetViewModel));
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
    JobsTextFieldStyleCVCell *cell = JobsRegisterDequeueCollectionViewCell(JobsTextFieldStyleCVCell);
    return (JobsTextFieldStyleCVCell *)cell
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
    JobsRetZYTextFieldByVoidBlock action = ((JobsRetZYTextFieldByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTextFieldStyleCVCell.class, @selector(jobsGetTextField)))(self, @selector(jobsGetTextField));
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
-(void)textFieldBlock:(ZYTextField *)textField
       textFieldValue:(NSString *)value{
//    self.textFieldInputModel.resString = value;
//    self.textFieldInputModel.PlaceHolder = self.doorInputViewBaseStyleModel.placeHolderStr;
//    textField.requestParams = self.textFieldInputModel;
//
    if (self.objBlock) self.objBlock(textField);// 对外统一传出TF
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize textField = _textField;
-(ZYTextField *)textField{
    if (!_textField) {
        @jobs_weakify(self)
        _textField = self.contentView.addSubview(jobsMakeZYTextField(^(ZYTextField * _Nullable textField) {
            @jobs_strongify(self)
            textField
                .byDelegate(self)
                .byReturnKeyType(UIReturnKeyDefault)
                .byKeyboardAppearance(UIKeyboardAppearanceDefault)
                .byKeyboardType(UIKeyboardTypeNumberPad)
                .byPlaceholder(@"请输入充值金额".jobsTr())
                .byPlaceholderFont(UIFontWeightMediumSize(18))
                .byPlaceholderColor(JobsPlaceholderTextColor)
                .byTextCor(JobsLabelColor)
                .byFont(UIFontWeightMediumSize(18))
                .byBgColor(JobsSecondarySystemBackgroundColor);
            [textField jobsTextFieldEventFilterBlock:^BOOL(id data) {
    //            @jobs_strongify(self)
                return YES;
            } subscribeNextBlock:^(NSString * _Nullable x) {
                @jobs_strongify(self)
                [self textFieldBlock:textField textFieldValue:x];
            }];
        })).byAdd(^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.edges.equalTo(self.contentView);
        });
    };return _textField;
}

@end

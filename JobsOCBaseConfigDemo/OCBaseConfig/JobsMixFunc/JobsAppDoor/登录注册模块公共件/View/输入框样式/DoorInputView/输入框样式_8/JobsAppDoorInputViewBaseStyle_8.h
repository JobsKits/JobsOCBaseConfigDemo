//
//  JobsAppDoorInputViewBaseStyle_8.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSAPPDOORINPUTVIEWBASESTYLE_8_FA17C60162
#define JOBS_HEADER_GUARD_JOBSAPPDOORINPUTVIEWBASESTYLE_8_FA17C60162

#import <UIKit/UIKit.h>
#import "JobsAppDoorConfig.h"
#import "JobsAppDoorInputViewBaseStyle.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif


#import "JobsOCDSL.h"

#import "JobsBaseProtocolHeader.h"

#import "JobsLanMgr.h"

#import "JobsMakes.h"

#import "JobsDefines.h"

#import "JobsModelDSL.h"

#import "JobsBaseUI.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsAppDoorInputViewBaseStyle_8 : JobsAppDoorInputViewBaseStyle
/**
 
 * 其实并不建议用init方法,而是期望带参数初始化，比如对应BaseViewProtocol里面的 - (instancetype)initWithSize:(CGSize)thisViewSize
 * 因为本类在大多数情况下是依附于一个父视图执行的，这样可以有效的避免过程值对环境的影响
 * 因为父视图在没有进行展开的时候，子视图是不展开的。那么存在生命周期的过程，会影响布局结果
    
 * 如果以后需要强行禁用init或者new，那么:
 - (instancetype)init NS_UNAVAILABLE;
 - (instancetype)new NS_UNAVAILABLE;
 */
@end

NS_ASSUME_NONNULL_END
/**

     调用示例：
     -(JobsAppDoorInputViewBaseStyle_8 *)inputView{
         if (!_inputView) {
             _inputView = [JobsAppDoorInputViewBaseStyle_8.alloc initWithSize:self.inputViewSize];
             _inputView.byBgColor(HEXCOLOR(0xFFFCF7));

             @jobs_weakify(self)
             [_inputView actionObjBlock:^(UITextField *data) {
     //            JobsAppDoorInputViewTFModel *textFieldInputModel = (JobsAppDoorInputViewTFModel *)data.requestParams;
                 @jobs_strongify(self)
             }];

             _inputView.jobsRichViewByModel(self.inputViewDataModel;)
             _inputView.addOn(self).byAdd(^(MASConstraintMaker *make) {
                 make.size.mas_equalTo(self.inputViewSize);
                 make.left.equalTo(self);
                 make.bottom.equalTo(self.mas_bottom);
             });

             [self layoutIfNeeded];
             _inputView.cornerCutToCircleWithCornerRadius(JobsWidth(self.inputViewSize.height / 2));
         };return _inputView;
     }

     -(JobsAppDoorInputViewBaseStyleModel *)inputViewDataModel{
         if (!_inputViewDataModel) {
             _inputViewDataModel = JobsAppDoorInputViewBaseStyleModel.new;
             _inputViewDataModel.leftViewIMG = @"搜索".img;
             _inputViewDataModel.textModel.text = @"".tr;
             _inputViewDataModel.placeHolderStr = @"搜索".tr;
             _inputViewDataModel.isShowDelBtn = YES;
             _inputViewDataModel.isShowSecurityBtn = NO;
             _inputViewDataModel.returnKeyType = UIReturnKeyDone;
             _inputViewDataModel.keyboardAppearance = UIKeyboardAppearanceAlert;
             _inputViewDataModel.leftViewMode = UITextFieldViewModeAlways;
             _inputViewDataModel.placeholderColor = HEXCOLOR(0x6D655D);
             _inputViewDataModel.titleStrCor = HEXCOLOR(0x6D655D);
             _inputViewDataModel.placeHolderOffset = JobsWidth(35);
             _inputViewDataModel.textModel.textCor = HEXCOLOR(0xFFE8D1);
         };return _inputViewDataModel;
     }
 */
#endif /* JOBS_HEADER_GUARD_JOBSAPPDOORINPUTVIEWBASESTYLE_8_FA17C60162 */

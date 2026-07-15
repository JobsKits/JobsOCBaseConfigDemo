//
//  JobsAppDoorInputViewBaseStyle_5.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

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
#import "JobsByOCPods.h"
#import "JobsMakes.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

#ifndef InputViewStyle_5_h
#define InputViewStyle_5_h
typedef NS_ENUM(NSUInteger, InputViewStyle_5) {
    InputViewStyle_5_1 = 0,
    InputViewStyle_5_2,
    InputViewStyle_5_3
};
#endif /* InputViewStyle_5_h */

@interface JobsAppDoorInputViewBaseStyle_5 : JobsAppDoorInputViewBaseStyle

Prop_assign()InputViewStyle_5 style_5;
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
 
     -(JobsAppDoorInputViewBaseStyle_5 *)inputView{
         if (!_inputView) {
             _inputView = [JobsAppDoorInputViewBaseStyle_5.alloc initWithSize:[BaiShaETProjAddVirtualCurrencyAddressInputTBVCell cellSizeByModel:nil]];
             if (self.indexPath.row == 4) {
                 _inputView.style_5 = InputViewStyle_5_1;
             }else if(self.indexPath.row == 3){
                 _inputView.style_5 = InputViewStyle_5_3;
             }else{
                 _inputView.style_5 = InputViewStyle_5_2;
             }

             _inputView.addOn(self.contentView).byAdd(^(MASConstraintMaker *make) {
                 make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, JobsWidth(16), 0, JobsWidth(-16)));
             });

             _inputView.jobsRichViewByModel(self.inputViewStyleModel);
             @jobs_weakify(self)
             [_inputView actionObjBlock:^(id data) {
                 @jobs_strongify(self)
             }];
         };return _inputView;
     }

     -(JobsAppDoorInputViewBaseStyleModel *)inputViewStyleModel{
         if (!_inputViewStyleModel) {
             _inputViewStyleModel = JobsAppDoorInputViewBaseStyleModel.new;
             _inputViewStyleModel.placeHolderStr = self.viewModel.subTextModel.text;
             _inputViewStyleModel.titleLabStr = self.viewModel.textModel.text;
             _inputViewStyleModel.placeHolderAlignment = NSTextAlignmentLeft;
             _inputViewStyleModel.leftViewOffsetX = 0.1;
             _inputViewStyleModel.offset = 0.1;
             _inputViewStyleModel.titleStrCor = self.viewModel.textModel.textCor;
             _inputViewStyleModel.ZYtextColor = self.viewModel.subTextModel.textCor ? : JobsLightGrayColor;
         };return _inputViewStyleModel;
     }
 */

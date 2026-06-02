//
//  JobsAppDoorInputViewBaseStyleModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsAppDoorInputViewBaseStyleModel_h
#define JobsAppDoorInputViewBaseStyleModel_h

#import <UIKit/UIKit.h>
#import <JobsModel/UIViewModel.h>

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN
@interface JobsAppDoorInputViewBaseStyleModel : UIViewModel
#pragma mark —— 关于左右的标识图
Prop_strong(nullable)UIImage *leftViewIMG;
Prop_strong(nullable)UIImage *selectedSecurityBtnIMG;
Prop_strong(nullable)UIImage *unSelectedSecurityBtnIMG;
Prop_assign()BOOL isShowDelBtn;/// 是否显示删除按钮,默认不显示
Prop_assign()BOOL isShowSecurityBtn;/// 是否显示安全按钮（眼睛）,默认不显示
Prop_assign()BOOL useCustomClearButton;/// 是否使用自定义的删除按钮 ,默认不使用
#pragma mark —— 关于 placeHolder
/// placeholder
/// placeholderFont
/// placeholderColor
/// attributedText
/// titleAttributedDataMutArr
#pragma mark —— 关于输入的文本字符
Prop_copy(nullable)NSString *nickNamePlaceHolderStr;
Prop_copy(nullable)NSString *titleLabStr;
Prop_strong(nullable)UIFont *titleStrFont;
Prop_strong(nullable)UIColor *titleStrCor;
Prop_copy(nullable)NSString *inputStr;/// 输入框里面的实时内容
Prop_assign()NSInteger inputCharacterRestriction;/// 输入字符限制
#pragma mark —— 关于键盘⌨️配置
Prop_assign()UIReturnKeyType returnKeyType;
Prop_assign()UIKeyboardAppearance keyboardAppearance;
Prop_assign()UITextFieldViewMode leftViewMode;
Prop_assign()UIKeyboardType keyboardType;
Prop_assign()BOOL keyboardEnable;
#pragma mark —— 关于TextField
Prop_strong(nullable)UIColor *backgroundColor UI_APPEARANCE_SELECTOR;
Prop_strong(nullable)UIImage *disabledBackground;
Prop_strong(nullable)UIImage *background;
Prop_assign()CGSize tfSize;
#pragma mark —— 关于 ZYTextField
Prop_assign()CGFloat TFRiseHeight;/// 键盘在此手机上的最高弹起，区别于全面屏结合非全面屏，有一个安全区域34
Prop_assign()CGFloat placeHolderOffset;/// 左/右/居中 对齐的时候placeHolder的偏移量【传正值】
Prop_assign()CGFloat fieldEditorOffset; /// 因为设置了leftView后fieldEditor所需的偏移量
Prop_assign()NSTextAlignment placeHolderAlignment;/// PlaceHolder的位置（左/中/右）
Prop_assign()CGFloat offset;/// 光标的起始距离距离控件最左边(不包括leftView)的差值
Prop_assign()CGFloat leftViewOffsetX;/// leftView 距离控件最左边的差值
Prop_assign()CGFloat rightViewOffsetX;/// TextField的删除按钮距离控件最右边的差值
Prop_assign()BOOL ZYTextFieldMasksToBounds;
Prop_assign()UIColor *ZYTextFieldBorderColor;
Prop_strong()UIColor *ZYtextColor;/// 文本颜色
Prop_strong()UIColor *ZYtintColor;/// 光标颜色
Prop_strong()UIFont *ZYtextFont;/// 字体大小
Prop_assign()CGFloat ZYTextFieldCornerRadius;
Prop_assign()CGFloat ZYTextFieldBorderWidth;
#pragma mark —— 关于 JobsMagicTextField
Prop_assign(getter=isPlaceholdAnimationable)BOOL placeholdAnimationable;/// 是否开启动画
Prop_strong()UIColor *animationColor;/// 动画最终字颜色
Prop_strong()UIFont *animationFont;/// 动画最终字体
Prop_assign()CGFloat moveDistance;///  移动距离,默认为field高度的一半,设置0无效（关闭动画请使用isPlaceholdAnimationable）

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull jobsMakeAppDoorInputViewBaseStyleModel(jobsByAppDoorInputViewBaseStyleModelBlock _Nonnull block){
    JobsAppDoorInputViewBaseStyleModel *data = JobsAppDoorInputViewBaseStyleModel.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* JobsAppDoorInputViewBaseStyleModel_h */

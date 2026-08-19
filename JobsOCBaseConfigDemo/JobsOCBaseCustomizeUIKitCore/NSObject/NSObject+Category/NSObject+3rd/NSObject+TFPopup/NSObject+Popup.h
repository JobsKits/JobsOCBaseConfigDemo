//
//  NSObject+TFPopup.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2021/12/15.
//

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "AppDelegate+TabBarCtr.h"
#import "LoginView.h"
#import "SignUpView.h"
#import "PwdSettingView.h"
#import "PwdSettingByCodeView.h"
#import "JobsDefineProperty.h"

#if __has_include(<TFPopup/TFPopup.h>)
#import <TFPopup/TFPopup.h>
#else
#import "TFPopup.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 弹出一个弹窗
@interface NSObject (TFPopup)
/// Data
Prop_strong()TFPopupParam *popupParameter;
#pragma mark —— 创建缩放模式的View
/// 没有自定义 popupParam（缩放模式）
-(void)popupShowScaleWithView:(UIView *_Nonnull)view;
-(jobsByViewBlock _Nonnull)popupShowScaleWithView;
/// 有自定义popupParam（缩放模式）
-(void)popupShowScaleWithView:(UIView *_Nonnull)view
               popupParameter:(TFPopupParam *_Nullable)popupParam;
#pragma mark —— 创建滑动模式的View
/// 没有自定义 popupParam（滑动模式）
-(void)popupshowSlideWithView:(UIView *_Nonnull)view;
-(jobsByViewBlock _Nonnull)popupshowSlideWithView;
/// 有自定义popupParam（滑动模式）
-(void)popupshowSlideWithView:(UIView *_Nonnull)view
               popupParameter:(TFPopupParam *_Nullable)popupParam;
#pragma mark —— 创建数据源
/// 一般的数据源
-(JobsRetTFPopupParamByVoidBlock _Nonnull)makeNormalPopupParameter;
-(TFPopupParam *)makeSlidePopupParameterByViewHeight:(CGFloat)viewHeight;
-(JobsRetTFPopupParamByCGFloatBlock _Nonnull)makeSlidePopupParameterByViewHeight;
-(TFPopupParam *)makeSlidePopupParameterByViewSize:(CGSize)viewSize;
-(JobsRetTFPopupParamByCGSizeBlock _Nonnull)makeSlidePopupParameterByViewSize;
#pragma mark —— PopView
+(JobsRetJobsNoticePopupViewByVoidBlock _Nonnull)makeNoticePopupView;
+(JobsRetLoginViewByVoidBlock _Nonnull)makePopLoginView;
+(JobsRetSignUpViewByVoidBlock _Nonnull)makePopSignUpView;
+(JobsRetPwdSettingViewByVoidBlock _Nonnull)makePopPwdSettingView;
+(JobsRetPwdSettingByCodeViewByVoidBlock _Nonnull)makePwdSettingByCodeView;

@end

NS_ASSUME_NONNULL_END

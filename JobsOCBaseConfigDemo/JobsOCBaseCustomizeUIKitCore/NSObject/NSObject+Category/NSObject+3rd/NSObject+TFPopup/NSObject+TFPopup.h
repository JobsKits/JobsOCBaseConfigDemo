//
//  NSObject+TFPopup.h
//  TFPopupExtra
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_TFPOPUP_927BF968CA
#define JOBS_HEADER_GUARD_NSOBJECT_TFPOPUP_927BF968CA

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#if __has_include(<TFPopup/TFPopup.h>)
#import <TFPopup/TFPopup.h>
#else
#import "TFPopup.h"
#endif

#import "JobsByOCPods.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

#ifndef ShowView
#define ShowView(View) if(self) self.show_view(View);
#endif /* ShowView */

#ifndef ShowView2
#define ShowView2(View) if(self) self.show_view2(View);
#endif /* ShowView2 */

#ifndef ShowTips
#define ShowTips(View) if(self) self.show_tips(View);
#endif /* ShowTips */

#ifndef ShowViewByModel
#define ShowViewByModel(View,Data) if(self) self.showViewByModel(View,Data);
#endif /* ShowViewByModel */

#ifndef ShowViewByModel2
#define ShowViewByModel2(View,Data) if(self) self.showViewByModel2(View,Data);
#endif /* ShowViewByModel2 */

#ifndef ShowTipsByModel
#define ShowTipsByModel(View,Data) if(self) self.showTipsByModel(View,Data);
#endif /* ShowTipsByModel */

#pragma mark —— 创建数据源
NS_INLINE TFPopupParam * _Nonnull TFPopupBaseParam(void){
    TFPopupParam *popupParameter = TFPopupParam.alloc.init;
    popupParameter.duration = 0.3;
    popupParameter.showAnimationDelay = 0;
    popupParameter.hideAnimationDelay = 0;
    return popupParameter;
}

NS_INLINE TFPopupParam * _Nonnull makeSlidePopupParameterByViewHeight(CGFloat viewHeight){
    TFPopupParam *popupParameter = TFPopupParam.alloc.init;
    popupParameter.bubbleDirection = PopupDirectionBottom;
    popupParameter.popupSize = CGSizeMake(JobsMainScreen_WIDTH(), jobs3TO(viewHeight, JobsWidth(300)));
    popupParameter.dragEnable = YES;
    return popupParameter;
}

NS_INLINE TFPopupParam *_Nonnull makeNormalPopupParameter(void){
    TFPopupParam *popupParameter = TFPopupBaseParam();
    popupParameter.autoDissmissDuration = 0;
    popupParameter.dragEnable = NO;
    popupParameter.disuseBackgroundTouchHide = YES;
    return popupParameter;
}

NS_INLINE TFPopupParam *_Nonnull makeNormalTipsParameter(void){
    TFPopupParam *popupParameter = TFPopupBaseParam();
    popupParameter.autoDissmissDuration = 1;
    popupParameter.dragEnable = NO;
    popupParameter.disuseBackgroundTouchHide = YES;
    return popupParameter;
}

NS_INLINE TFPopupParam *_Nonnull makeSlidePopupParameterByViewSize(CGSize viewSize){
    TFPopupParam *popupParameter = TFPopupParam.alloc.init;
    popupParameter.bubbleDirection = PopupDirectionBottom;
    popupParameter.popupSize = jobs3TOSize(viewSize,CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(300)));
    popupParameter.dragEnable = YES;
    return popupParameter;
}
NS_ASSUME_NONNULL_BEGIN
/// 弹出一个弹窗
@interface NSObject (TFPopup)
/// Data
Prop_strong(nullable)TFPopupParam *popupParameter;
Prop_strong(nullable)TFPopupParam *tipsParameter;
#pragma mark —— 保证弹窗一定是被初始化
-(__kindof UIView *)checkByView:(UIView *)view action:(jobsByVoidBlock _Nullable)action;
#pragma mark —— 关闭所有的弹出提示框
-(jobsByViewBlock _Nonnull)tfHideAllPopupView;
#pragma mark —— 弹出提示框
-(jobsByStrBlock _Nonnull)toastMsg;
#pragma mark —— 创建缩放模式下的View
/// 没有自定义 popupParam（缩放模式）
-(jobsByViewBlock _Nonnull)popupShowScaleWithView;
/// 有自定义popupParam（缩放模式）
-(void)popupShowScaleWithView:(UIView __kindof *_Nonnull)view
               popupParameter:(TFPopupParam *_Nullable)popupParameter;
#pragma mark —— 创建滑动模式的View
/// 没有自定义 popupParam（滑动模式）
-(jobsByViewBlock _Nonnull)popupShowSlideWithView;
/// 有自定义popupParam（滑动模式）
-(void)popupShowSlideWithView:(UIView __kindof *_Nonnull)view
               popupParameter:(TFPopupParam *_Nullable)popupParameter;
#pragma mark —— PopView
/// 出现的弹窗（出现在屏幕中央）需要手动触发关闭——禁止点击背景消失弹框（不带数据）
-(jobsByViewBlock _Nonnull)show_view;
/// 出现的弹窗需要手动触发关闭——允许点击背景消失弹框（不带数据）
-(jobsByViewBlock _Nonnull)show_view2;
/// 出现的弹窗（出现在屏幕下方）需要手动触发关闭——禁止点击背景消失弹框（不带数据）
-(jobsByViewBlock _Nonnull)show_view3;
/// 出现的弹窗需要手动触发关闭——禁止点击背景消失弹框（带数据）
-(jobsByViewAndDataBlock _Nonnull)show_viewByModel;
/// 出现的弹窗需要手动触发关闭——禁止点击背景消失弹框（带数据）
-(jobsByViewAndDataBlock _Nonnull)showViewByModel;
/// 出现的弹窗需要手动触发关闭——允许点击背景消失弹框（带数据）
-(jobsByViewAndDataBlock _Nonnull)showViewByModel2;
/// 出现的弹窗自动触发关闭（不带数据）
-(jobsByViewBlock _Nonnull)show_tips;
/// 出现的弹窗自动触发关闭（带数据）
-(jobsByViewAndDataBlock _Nonnull)showTipsByModel;

@end

NS_ASSUME_NONNULL_END
/**
 
     @jobs_strongify(self)
     if (self.objBlock) self.objBlock(x);
     [self tf_hide:^{
         @jobs_strongify(self)
         ShowTips(AccBindSuccessTipView
                  .BySize(AccBindSuccessTipView.viewSizeByModel(nil))
                  .JobsRichViewByModel2(nil))
                  .JobsBlock1(^(UIButton *data) {
                      @jobs_strongify(self)

                  });
     }];
 */
#endif /* JOBS_HEADER_GUARD_NSOBJECT_TFPOPUP_927BF968CA */

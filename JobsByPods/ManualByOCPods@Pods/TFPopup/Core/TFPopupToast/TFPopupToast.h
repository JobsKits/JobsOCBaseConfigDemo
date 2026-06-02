//
//  TFPopupToast.h
//  TFPopup
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <TFPopup/TFPopupConst.h>
#import <TFPopup/UIView+TFPopup.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

@class TFPopupToast;
typedef void(^TFPopupToastBlock)(TFPopupToast *toast);

@interface TFPopupToast : UIView

Prop_assign()UIEdgeInsets edge;
Prop_strong()UILabel  *msgLabel;
//注释同下
+(void)tf_show:(UIView *)inView msg:(NSString *)msg animationType:(TFAnimationType)animationType;
/* toast展示,默认黑底白字,底80%黑色不透明度
 * inView 容器视图
 * msg：弹出string
 * offset,弹框偏移,offset.x正为右移,offset.y正为下移
 * duration,自动消失时间，值为0时默认被设置为最低为1.5s,根据字数计算消失时间最大5s
 * animationType,动画方式，渐隐和缩放，默认渐隐
 * customBlock,可在此回调内设置样式 */
+(void)tf_show:(UIView *)inView
           msg:(NSString *)msg
        offset:(CGPoint)offset
dissmissDuration:(NSTimeInterval)duration
 animationType:(TFAnimationType)animationType
   customBlock:(TFPopupToastBlock)customBlock;

@end


//
//  UIViewModelOthersProtocol.h
//  JobsOCProtocols
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWMODELOTHERSPROTOCOL_369DD6C6F4
#define JOBS_HEADER_GUARD_UIVIEWMODELOTHERSPROTOCOL_369DD6C6F4

#import <UIKit/UIKit.h>

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

@protocol UIViewModelOthersProtocol <NSObject>
@optional
/// 其他
#pragma mark —— UI
Prop_assign()CGFloat Alpha;
Prop_assign()BOOL opaque;
Prop_strong(nullable)UIColor *layerBorderCor;
Prop_assign()CGFloat layerBorderWidth;
Prop_assign()CGFloat layerCornerRadius;
Prop_assign()BOOL isTranslucent;// 是否取消tabBar的透明效果
Prop_assign()BOOL isVisible;// ❤️只是一个标记是否可见，如果需要设置请移步@interface UIView (Extra) ：-(BOOL)jobsVisible; 和 -(void)setJobsVisible:(BOOL)jobsVisible;
Prop_assign()BOOL isInvisible;// 此属性默认就是NO，即可见
Prop_assign()BOOL isMultiLineShows;// 是否多行行显示【默认单行显示】
Prop_assign()UILabelShowingType labelShowingType;
#pragma mark —— 定位
Prop_assign()NSUInteger jobsTag;
#pragma mark —— 展现控制器的方式
Prop_assign()ComingStyle pushOrPresent;
#pragma mark —— 点击
Prop_assign()BOOL jobsSelected;
Prop_assign()BOOL jobsEnabled;
Prop_strong(nullable)UIAction *primaryAction;// 新Api的点击事件
/// 一般用于 UIButtonModel
Prop_copy(nullable)JobsRetIDByIDBlock clickEventBlock;// 老Api的点击事件，利用RAC实现
Prop_copy(nullable)JobsRetIDByIDBlock longPressGestureEventBlock;// 按钮的长按事件
/// 一般用于 UIButton
Prop_copy(nullable)jobsByBtnBlock onClickBlock;
Prop_copy(nullable)jobsByBtnBlock onLongPressGestureEventBlock;
#pragma mark —— 挂载的对象
Prop_strong(nullable)UIView *VIEW; // 慎用：挂载的对象除非主动置空，否则生命周期于本对象同步消亡
Prop_strong(nullable)UIViewController *VC; // 慎用：挂载的对象除非主动置空，否则生命周期于本对象同步消亡
#pragma mark —— ZFDouYinCell
-(void)zf_douyinRotation;
-(jobsByVoidBlock _Nonnull)jobsZf_douyinRotation;

@end

typedef JobsRetIDByIDBlock _Nonnull (^JobsRetIDBlockByIDBlock)(id <UIViewModelOthersProtocol>_Nullable data);

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEWMODELOTHERSPROTOCOL_369DD6C6F4 */

//
//  BaseLabel.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASELABEL_60E101AA2D
#define JOBS_HEADER_GUARD_BASELABEL_60E101AA2D

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
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
///  1、自定义UILabel 实现显示偏移量和内边距
///  2、自定义UILabel 实现添加长按手势和点击手势
///  https://www.jianshu.com/p/541ef795a1f2
@interface BaseLabel : UILabel
<
UILocationProtocol,
GestureProtocol,
UIGestureRecognizerDelegate,
UIEditMenuInteractionDelegate
>

Prop_assign()UIEdgeInsets edgeInsets;

#pragma mark —— 一些公有方法
/// UILabel文字的复制
-(jobsByStrBlock _Nonnull)copyText;
/// 弹出系统菜单控件
-(jobsByStrBlock _Nonnull)makeMenuCtrl;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof BaseLabel *_Nonnull jobsMakeBaseLabel(jobsByBaseLabelBlock _Nonnull block){
    BaseLabel *data = BaseLabel.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_BASELABEL_60E101AA2D */

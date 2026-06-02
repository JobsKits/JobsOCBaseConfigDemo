//
//  UIButton+ImageTitleSpacing.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIBUTTON_IMAGETITLESPACING_B7AD46EB2C
#define JOBS_HEADER_GUARD_UIBUTTON_IMAGETITLESPACING_B7AD46EB2C

#import <UIKit/UIKit.h>
#import <JobsByOCPods/UIView+Measure.h>

#if __has_include(<JobsDeviceInfo/JobsDeviceInfo.h>)
#import <JobsDeviceInfo/JobsDeviceInfo.h>
#else
#import "JobsDeviceInfo.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#warning UIControlStateSelected 不要用 只锁定 UIControlStateNormal 因为不同的按钮状态会刷新按钮界面，导致self.titleLabel 和 self.imageView 位置大小错乱，很难以调整，看不懂他底层的调用方案
#warning 每一次因为selected不同而需要更换title和image 都必须调用layoutButtonWithEdgeInsetsStyle:imagePadding: 进行刷新

@interface UIButton (ImageTitleSpacing)

/**
 *  每次设置完新值都需要再重新走一遍，进行刷新
 *  设置button的titleLabel和imageView的布局样式，及间距
 *  这一句一定要放在有frame以后执行，否则界面错乱
 *  在设置完title以后写
 *  在title竖排模式情况下，frame一定要装得下整行字
 *  @param style titleLabel和imageView的布局样式
 *  @param imagePadding titleLabel和imageView的间距
 */
-(__kindof UIButton *)layoutButtonWithEdgeInsetsStyle:(NSDirectionalRectEdge)style
                                         imagePadding:(CGFloat)imagePadding;

@end
/// 有点问题，暂停同步

#endif /* JOBS_HEADER_GUARD_UIBUTTON_IMAGETITLESPACING_B7AD46EB2C */

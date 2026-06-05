//
//  UISwitch+UI.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UISWITCH_UI_5B6491D372
#define JOBS_HEADER_GUARD_UISWITCH_UI_5B6491D372

#import <UIKit/UIKit.h>

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
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
/// iOS系统内置了UISwithch控件的size，所以通过代码调整UISwithch的大小无效。默认大小：宽51.0f 、高31.0f
@interface UISwitch (UI)

-(RACDisposable *)jobsSwitchClickEventBlock:(jobsByIDBlock)subscribeNextBlock;

@end

NS_ASSUME_NONNULL_END

/**
 
     /// UI
     Prop_strong()UISwitch *switcher;
     /// Data
     Prop_strong()UIColor *cor;

     -(UISwitch *)switcher{
         if (!_switcher) {
             @jobs_weakify(self)
             _switcher = jobsMakeSwitch(^(__kindof UISwitch * _Nullable Switch) {
                 @jobs_strongify(self)
                 [self.view addSubview:Switch];
                 Switch.selected = NO;// 读取系统记录
                 Switch.thumbTintColor = _switcher.selected ? self.cor : HEXCOLOR(0xB0B0B0);
                 Switch.tintColor = JobsWhiteColor;
                 Switch.onTintColor = HEXCOLOR(0xFFFCF7);
                 Switch.backgroundColor = JobsWhiteColor;
                 Switch.cornerCutToCircleWithCornerRadius(31 / 2);
                 [Switch mas_makeConstraints:^(MASConstraintMaker *make) {
         //            make.top.equalTo(self.titleLab);
                     make.right.equalTo(self.view).offset(JobsWidth(-16));
                 }];
                 Switch.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
                     data.layerCor = Switch.selected ? self.cor : HEXCOLOR(0xB0B0B0)
                     data.byJobsWidth(1);
                 }));
                 [Switch jobsSwitchClickEventBlock:^(UISwitch *x) {
                     x.selected = !x.selected;
                     (x.selected ? @"打开解锁".tr:@"关闭解锁".tr).toast();
                     x.thumbTintColor = x.selected ? self.cor : HEXCOLOR(0xB0B0B0);
                     x.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
                         data.layerCor = Switch.selected ? self.cor : HEXCOLOR(0xB0B0B0)
                         data.byJobsWidth(1);
                     }));
                 }];
             })
         }return _switcher;
     }

     -(UIColor *)cor{
         if (!_cor) {
             _cor = [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[HEXCOLOR(0xE9C65D),HEXCOLOR(0xDDAA3A)]]
                                        startPoint:CGPointZero
                                          endPoint:CGPointZero
                                            opaque:NO
                                    targetViewRect:CGRectMake(0, 0, 51, 31)];
         }return _cor;
     }
 */
#endif /* JOBS_HEADER_GUARD_UISWITCH_UI_5B6491D372 */

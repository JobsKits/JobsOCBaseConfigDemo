//
//  NSArray+Extra.h
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSARRAY_EXTRA_FE9418D876
#define JOBS_HEADER_GUARD_NSARRAY_EXTRA_FE9418D876

#pragma once

#import <UIKit/UIKit.h>
#import <JobsCustomView/NSSet+Extra.h>
#import <JobsCustomView/NSMutableArray+Extra.h>
#import <JobsCustomView/UIView+Extra.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<JobsClass/JobsClass.h>)
#import <JobsClass/JobsClass.h>
#else
#import "JobsClass.h"
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

@interface NSArray (Extra)
/// 数组取值（无法关联数组的泛型）
-(JobsRetIDByUIntegerBlock _Nonnull)objectAt;
/// 数组取下标
-(JobsRetNSUIntegerByIDBlock _Nonnull)indexBy;
/// 数组里面是否包含某个元素
-(JobsRetBOOLByIDBlock _Nonnull)containsObject;
/// 数组转字符串
-(NSString *_Nonnull)string;
/// 数组比较
-(JobsRetBOOLByArrBlock _Nonnull)compareEqualArrElement;
/// 数组计算交集
-(JobsRetArrByArrBlock _Nonnull)arrayForIntersectionWithOtherArray;
/// 数据计算差集
-(JobsRetArrByArrBlock _Nonnull)arrayForMinusWithOtherArray;
-(jobsByBOOLBlock _Nonnull)jobsVisible;
-(JobsReturnArrByMasonryBlocks _Nonnull)installByMasonryBlock;
#pragma mark —— Masonry 均匀分布的布局方式封装
/// 在指定的轴方向上，按照固定的间距分布多个视图。每个视图之间的间距是固定的，而不是视图本身的尺寸固定。
-(JobsRetArrByMasonryModelBlock _Nonnull)installByMasonryModel1;
/// 将一组视图沿某个方向（水平或垂直）等间距分布，视图的宽度（或高度）是固定的，且视图与容器的两端没有间隔。
-(JobsRetArrByMasonryModelBlock _Nonnull)installByMasonryModel2;
/// 转成可变数组
-(JobsRetMutableArrayByVoidBlock _Nonnull)mutableArr;

@end

/**
 
     Prop_strong()NSMutableArray <UIImageView *>*subViewsMutArr;
     self.subViewsMutArr.jobsVisible(YES);

     -(NSMutableArray<__kindof UIView *> *)subViewsMutArr{
         if(!_subViewsMutArr){
             @jobs_weakify(self)
             _subViewsMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIView *>*_Nullable data) {
                 @jobs_strongify(self)
                 data.add(BaseButton.jobsInit()
                          .bgColorBy(JobsClearColor.colorWithAlphaComponentBy(0))
                          .jobsResetBtnBgImage(@"纸飞机账户绑定".img)
                          .onClickBy(^(UIButton *x){
                              toastBy(@"纸飞机");
                          }).onLongPressGestureBy(^(id data){
                              JobsLog(@"");
                          }));
                 data.add(BaseButton.jobsInit()
                          .bgColorBy(JobsClearColor.colorWithAlphaComponentBy(0))
                          .jobsResetBtnBgImage(@"脸书账户绑定".img)
                          .onClickBy(^(UIButton *x){
                              toastBy(@"脸书");
                          }).onLongPressGestureBy(^(id data){
                              JobsLog(@"");
                          }));
                 data.add(BaseButton.jobsInit()
                          .bgColorBy(JobsClearColor.colorWithAlphaComponentBy(0))
                          .jobsResetBtnBgImage(@"Viber账户绑定".img)
                          .onClickBy(^(UIButton *x){
                              toastBy(@"Viber");
                          }).onLongPressGestureBy(^(id data){
                              JobsLog(@"");
                          }));
                 for (UIView *view in data) {
                     self.addSubview(view);
                 }
             }).installByMasonryModel1(jobsMakeMasonryModel(^(__kindof MasonryModel * _Nullable data) {
                 data.axisType = MASAxisTypeHorizontal;
                 data.fixedSpacing = JobsWidth(17);
                 data.leadSpacing = JobsWidth(22);
                 data.tailSpacing = JobsWidth(22);
                 data.bottom = JobsWidth(-10);
                 data.height = JobsWidth(26);
                 data.is_mas_makeConstraints = YES;
             })).installByMasonryBlock(^(MASConstraintMaker *_Nonnull data){

             });
         }return _subViewsMutArr;
     }
 */
#endif /* JOBS_HEADER_GUARD_NSARRAY_EXTRA_FE9418D876 */

//
//  UIView+Masonry.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_MASONRY_7E43E2E24D
#define JOBS_HEADER_GUARD_UIVIEW_MASONRY_7E43E2E24D

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <MJRefreshExtra/NSMutableArray+Extra.h>
#import <MJRefreshExtra/UIView+Refresh.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
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

@interface UIView (Masonry)

Prop_copy()jobsByMASConstraintMakerBlock masonryBlock;
#pragma mark —— 一些Masonry算法
/// 制作一个带有n*m小矩形内容的大矩形（二次封装）
-(jobsByViewArrayRowsColumnsBlock _Nonnull)gridLayoutBy;
/// 制作一个带有n*m小矩形内容的大矩形（核心算法）
-(void)setupGridWithRows:(NSInteger)rows
                 columns:(NSInteger)columns
               itemViews:(NSArray<__kindof UIView *> *)views
                  margin:(CGFloat)margin
                 spacing:(CGFloat)spacing;
@end

NS_ASSUME_NONNULL_END
/**
 
     -(BaseButton *)forgotten_code_btn{
         if(!_forgotten_code_btn){
             @jobs_weakify(self)
             _forgotten_code_btn = self.addSubview(BaseButton.jobsInit()
                                                   .bgColorBy(JobsClearColor)
                                                   .jobsResetBtnTitleCor(@"#FF0000".cor)
                                                   .jobsResetBtnTitleFont(pingFangHKRegular(JobsWidth(13)))
                                                   .jobsResetBtnTitle(@"Forgot Password?".tr)
                                                   .onClickBy(^(UIButton *x){
                                                       @jobs_strongify(self)
                                                       self.getCurrentViewController.comingToPushVC(FMForgotPwdVC.new);
                                                   }).onLongPressGestureBy(^(id data){
                                                       JobsLog(@"");
                                                   })).setMasonryBy(^(MASConstraintMaker *_Nonnull make){
                                                       @jobs_strongify(self)
                                                       make.top.equalTo(self.textField_code.mas_bottom).offset(JobsWidth(5));
                                                       make.right.equalTo(self.textField_code);
                                                       make.size.mas_equalTo(CGSizeMake(JobsWidth(130), JobsWidth(15)));
                                                   }).on();
         };return _forgotten_code_btn;
     }
 */

/**

     /// 2 * 3 的矩形
     self.gridLayoutBy(jobsMakeMutArr(^(__kindof NSMutableArray<NSObject *> * _Nullable arr) {
         arr.add(BaseButton.jobsInit()
                 .bgColorBy(JobsClearColor)
                 .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
                 .jobsResetImagePadding(1)
                 .jobsResetBtnImage(@"Betslip".img))
                 .jobsResetBtnTitleCor(@"#666666".cor)
                 .jobsResetBtnTitleFont(pingFangHKLight(JobsWidth(12)))
                 .jobsResetBtnTitle(@"Betslip".tr)
                 .onClickBy(^(UIButton *x){
                     toastBy(@"Betslip".tr);
                 }).onLongPressGestureBy(^(id data){
                     JobsLog(@"");
                 }))
         .add(BaseButton.jobsInit()
             .bgColorBy(JobsClearColor)
             .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
             .jobsResetImagePadding(1)
             .jobsResetBtnImage(@"Statement".img))
             .jobsResetBtnTitleCor(@"#666666".cor)
             .jobsResetBtnTitleFont(pingFangHKLight(JobsWidth(12)))
             .jobsResetBtnTitle(@"Statement".tr)
             .onClickBy(^(UIButton *x){
                 toastBy(@"Statement".tr);
             }).onLongPressGestureBy(^(id data){
                 JobsLog(@"");
             }))
         .add(BaseButton.jobsInit()
             .bgColorBy(JobsClearColor)
             .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
             .jobsResetImagePadding(1)
             .jobsResetBtnImage(@"Promo".img))
             .jobsResetBtnTitleCor(@"#666666".cor)
             .jobsResetBtnTitleFont(pingFangHKLight(JobsWidth(12)))
             .jobsResetBtnTitle(@"Promo".tr)
             .onClickBy(^(UIButton *x){
                 toastBy(@"Promo".tr);
             }).onLongPressGestureBy(^(id data){
                 JobsLog(@"");
             }))
         .add(BaseButton.jobsInit()
             .bgColorBy(JobsClearColor)
             .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
             .jobsResetImagePadding(1)
             .jobsResetBtnImage(@"Security".img))
             .jobsResetBtnTitleCor(@"#666666".cor)
             .jobsResetBtnTitleFont(pingFangHKLight(JobsWidth(12)))
             .jobsResetBtnTitle(@"Security".tr)
             .onClickBy(^(UIButton *x){
                 toastBy(@"Security".tr);
             }).onLongPressGestureBy(^(id data){
                 JobsLog(@"");
             }))
         .add(BaseButton.jobsInit()
             .bgColorBy(JobsClearColor)
             .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
             .jobsResetImagePadding(1)
             .jobsResetBtnImage(@"Help Center".img))
             .jobsResetBtnTitleCor(@"#666666".cor)
             .jobsResetBtnTitleFont(pingFangHKLight(JobsWidth(12)))
             .jobsResetBtnTitle(@"Help Center".tr)
             .onClickBy(^(UIButton *x){
                 toastBy(@"Help Center".tr);
             }).onLongPressGestureBy(^(id data){
                 JobsLog(@"");
             }))
         .add(BaseButton.jobsInit()
             .bgColorBy(JobsClearColor)
             .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
             .jobsResetImagePadding(1)
             .jobsResetBtnImage(@"Feedback".img))
             .jobsResetBtnTitleCor(@"#666666".cor)
             .jobsResetBtnTitleFont(pingFangHKLight(JobsWidth(12)))
             .jobsResetBtnTitle(@"Feedback".tr)
             .onClickBy(^(UIButton *x){
                 toastBy(@"Feedback".tr);
             }).onLongPressGestureBy(^(id data){
                 JobsLog(@"");
             }));
     }),2,3);
 */
#endif /* JOBS_HEADER_GUARD_UIVIEW_MASONRY_7E43E2E24D */

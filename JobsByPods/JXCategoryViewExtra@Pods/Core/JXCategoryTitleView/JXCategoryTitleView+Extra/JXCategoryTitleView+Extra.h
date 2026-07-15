//
//  JXCategoryTitleView+Extra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif
#ifndef JOBS_HEADER_GUARD_JXCATEGORYTITLEVIEW_EXTRA_98C0DBB2A4
#define JOBS_HEADER_GUARD_JXCATEGORYTITLEVIEW_EXTRA_98C0DBB2A4

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
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

@interface JXCategoryTitleView (Extra)

-(JobsRetCategoryTitleViewByCorBlock _Nonnull)byTitleSelectedColor;
-(JobsRetCategoryTitleViewByCorBlock _Nonnull)byTitleColor;
-(JobsRetCategoryTitleViewByFontBlock _Nonnull)byTitleFont;
-(JobsRetCategoryTitleViewByFontBlock _Nonnull)byTitleSelectedFont;
-(JobsRetCategoryTitleViewByStringsBlock _Nonnull)byTitles;
-(JobsRetCategoryTitleViewByBOOLBlock _Nonnull)byTitleColorGradientEnabled;

@end

NS_ASSUME_NONNULL_END
/**
 
 -(JXCategoryTitleView *)categoryView{
     if(!_categoryView){
         @jobs_weakify(self)
         _categoryView = self.view.addSubview(jobsMakeCategoryTitleView(^(JXCategoryTitleView * _Nullable view) {
             @jobs_strongify(self)
             view.byTitleSelectedColor(JobsRedColor)
                 .byTitleColor(JobsGrayColor)
                 .byTitleFont(UIFontWeightRegularSize(JobsWidth(10)))
                 .byTitleSelectedFont(UIFontWeightRegularSize(JobsWidth(11)))
                 .byTitles(self.titles)
                 .byTitleColorGradientEnabled(YES)
                 .byIndicators(jobsMakeMutArr(^(__kindof NSMutableArray <JXCategoryIndicatorBackgroundView *>* _Nullable arr) {
                     arr.add(jobsMakeCategoryIndicatorLineView(^(JXCategoryIndicatorLineView * _Nullable indicator) {
                         indicator.indicatorColor = HEXCOLOR(0xFFEABA);
                         indicator.indicatorHeight = JobsWidth(4);
                         indicator.indicatorWidthIncrement = JobsWidth(10);
                         indicator.verticalMargin = 0;
                     }));
                 }))/// 跟随的指示器（二选一）
                 .byIndicators(jobsMakeMutArr(^(__kindof NSMutableArray <JXCategoryIndicatorBackgroundView *>* _Nullable arr) {
                     arr.add(jobsMakeCategoryIndicatorBackgroundView(^(JXCategoryIndicatorBackgroundView * _Nullable bgView) {
                         bgView.indicatorHeight = JobsWidth(30);
                         bgView.indicatorWidth = JobsWidth(76);
                         bgView.indicatorColor = HEXCOLOR(0xFFEABA);
                         bgView.indicatorCornerRadius = JXCategoryViewAutomaticDimension;
                     }));
                 }))/// 跟随的指示器（二选一）BackgroundView 椭圆形
                 .byDefaultSelectedIndex(1)/// 默认从第二个开始显示
                 .byCellSpacing(JobsWidth(-20))
                 .byContentScrollView(self.listContainerView.scrollView)/// 关联cotentScrollView，关联之后才可以互相联动！！！
                 .byDelegate(self)
                 .byBgColor(JobsClearColor);
         })).setMasonryBy(^(MASConstraintMaker *_Nonnull make){
             @jobs_strongify(self)
             make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(0);
             make.left.right.equalTo(self.view);
             make.height.mas_equalTo(listContainerViewDefaultOffset);
         }).on();
     };return _categoryView;
 }
 
 */
#endif /* JOBS_HEADER_GUARD_JXCATEGORYTITLEVIEW_EXTRA_98C0DBB2A4 */

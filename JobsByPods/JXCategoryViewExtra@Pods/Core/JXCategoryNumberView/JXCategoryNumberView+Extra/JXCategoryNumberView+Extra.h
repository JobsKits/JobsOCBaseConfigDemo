//
//  JXCategoryNumberView+Extra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//


#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif
#ifndef JOBS_HEADER_GUARD_JXCATEGORYNUMBERVIEW_EXTRA_74B711E4BE
#define JOBS_HEADER_GUARD_JXCATEGORYNUMBERVIEW_EXTRA_74B711E4BE

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

@interface JXCategoryNumberView (Extra)

-(JobsRetCategoryNumberViewByNumbersBlock _Nonnull)byCounts;
-(JobsRetCategoryNumberViewByCGPointBlock _Nonnull)byNumberLabelOffset;
-(JobsRetCategoryNumberViewByRetStringByIntegerBlocks _Nonnull)byNumberStringFormatterBlock;

@end

NS_ASSUME_NONNULL_END
/**
 
 -(JXCategoryNumberView *)categoryView{
     if (!_categoryView) {
         @jobs_weakify(self)
         _categoryView = self.view.addSubview(jobsMakeCategoryNumberView(^(JXCategoryNumberView * _Nullable view) {
             view.byNumberLabelOffset(CGPointMake(JobsWidth(5), JobsWidth(2)))
                 .byCounts(jobsMakeMutArr(^(__kindof NSMutableArray <NSNumber *>* _Nullable arr) {
                     arr.add(@1)
                         .add(@1)
                         .add(@1)
                         .add(@1)
                         .add(@1)
                         .add(@1);
                 }))
                 /// 内部默认不会格式化数字，直接转成字符串显示。比如业务需要数字超过999显示999+，可以通过该block实现。
                 .byNumberStringFormatterBlock(^NSString *(NSInteger number) {
                     if (number > 999) {
                         return @"999+";
                     };return [NSString stringWithFormat:@"%ld", (long)number];
                 })
                 .byTitles(self.titles)
                 .byTitleSelectedColor(HEXCOLOR(0xAE8330))
                 .byTitleColor(HEXCOLOR(0xC4C4C4))
                 .byTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
                 .byTitleSelectedFont(UIFontWeightBoldSize(JobsWidth(14)))
                 .byDefaultSelectedIndex(1)/// 默认从第二个开始显示
                 .byTitleColorGradientEnabled(YES)
                 .byIndicators(jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
                     arr.add(jobsMakeCategoryIndicatorLineView(^(JXCategoryIndicatorLineView * _Nullable view) {
                         view.indicatorColor = HEXCOLOR(0xFFEABA);
                         view.indicatorHeight = JobsWidth(4);
                         view.indicatorWidthIncrement = JobsWidth(10);
                         view.verticalMargin = 0;
                     }));
                 }))/// 二选一
                 .byIndicators(jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
                     arr.add(jobsMakeCategoryIndicatorBackgroundView(^(JXCategoryIndicatorBackgroundView * _Nullable view) {
                         view.indicatorHeight = JobsWidth(30);
                         view.indicatorWidth = JobsWidth(76);
                         view.indicatorColor = HEXCOLOR(0xFFEABA);
                         view.indicatorCornerRadius = JXCategoryViewAutomaticDimension;
                     }));
                 }))/// 二选一：BackgroundView 椭圆形
                 .byContentScrollView(self.listContainerView.scrollView) /// 关联cotentScrollView，关联之后才可以互相联动！！！
                 .byListContainer(self.listContainerView)
                 .reloadDatasWithoutListContainer()
                 .byDelegate(self)
                 .byBgColor(HEXCOLOR(0xFCFBFB));
         })).setMasonryBy(^(MASConstraintMaker *_Nonnull make){
             @jobs_strongify(self)
             make.top.equalTo(self.gk_navigationBar.mas_bottom);
             make.left.right.equalTo(self.view);
             make.height.mas_equalTo(listContainerViewDefaultOffset);
         }).on();
     };return _categoryView;
 }
 
 */
#endif /* JOBS_HEADER_GUARD_JXCATEGORYNUMBERVIEW_EXTRA_74B711E4BE */

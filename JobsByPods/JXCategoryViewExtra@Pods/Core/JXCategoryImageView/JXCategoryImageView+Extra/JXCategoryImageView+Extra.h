//
//  JXCategoryImageView+Extra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif
#ifndef JOBS_HEADER_GUARD_JXCATEGORYIMAGEVIEW_EXTRA_73B12DC65C
#define JOBS_HEADER_GUARD_JXCATEGORYIMAGEVIEW_EXTRA_73B12DC65C

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

@interface JXCategoryImageView (Extra)

-(JobsRetCategoryImageViewByStringsBlock _Nonnull)byImageNames;
-(JobsRetCategoryImageViewByStringsBlock _Nonnull)bySelectedImageNames;
-(JobsRetCategoryImageViewByStringsBlock _Nonnull)byImageInfoArray;
-(JobsRetCategoryImageViewByStringsBlock _Nonnull)bySelectedImageInfoArray;
-(JobsRetCategoryImageViewBySizeBlock _Nonnull)byImageSize;
-(JobsRetCategoryImageViewByCGFloatBlock _Nonnull)byImageCornerRadius;
-(JobsRetCategoryImageViewByBOOLBlock _Nonnull)byImageZoomEnabled;
-(JobsRetCategoryImageViewByNSIntegerBlock _Nonnull)byImageZoomScale;

@end

NS_ASSUME_NONNULL_END
/**
 
 -(JXCategoryImageView *)categoryView{
     if (!_categoryView) {
         @jobs_weakify(self)
         _categoryView = self.view.addSubview(jobsMakeCategoryImageView(^(JXCategoryImageView * _Nullable view) {
             view.byImageNames(jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>* _Nullable arr) {
                 arr.add(@"彩票_已选择")
                     .add(@"电子_已选择")
                     .add(@"棋牌_已选择")
                     .add(@"全部游戏_已选择")
                     .add(@"体育_已选择")
                     .add(@"真人直播_已选择");
             }))
             .bySelectedImageNames(jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>* _Nullable arr) {
                 arr.add(@"彩票_已选择")
                     .add(@"电子_已选择")
                     .add(@"棋牌_已选择")
                     .add(@"全部游戏_已选择")
                     .add(@"体育_已选择")
                     .add(@"真人直播_已选择");
             }))
             .byImageInfoArray(jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>* _Nullable arr) {
                 arr.add(@"彩票_已选择")
                     .add(@"电子_已选择")
                     .add(@"棋牌_已选择")
                     .add(@"全部游戏_已选择")
                     .add(@"体育_已选择")
                     .add(@"真人直播_已选择");
             }))
             .bySelectedImageInfoArray(jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>* _Nullable arr) {
                 arr.add(@"彩票_已选择")
                     .add(@"电子_已选择")
                     .add(@"棋牌_已选择")
                     .add(@"全部游戏_已选择")
                     .add(@"体育_已选择")
                     .add(@"真人直播_已选择");
             }))
             .byImageSize(CGSizeMake(JobsWidth(30), JobsWidth(30)))
             .byImageCornerRadius(JobsWidth(8))
             .byImageZoomEnabled(YES)
             .byImageZoomScale(2)
             .byDefaultSelectedIndex(1)/// 默认从第二个开始显示
             .byCellSpacing(JobsWidth(-20))
             .byContentScrollView(self.listContainerView.scrollView)/// 关联cotentScrollView，关联之后才可以互相联动！！！
             .byIndicators(jobsMakeMutArr(^(__kindof NSMutableArray <JXCategoryIndicatorLineView *>* _Nullable arr) {
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
             }))/// 二选一
             .byDelegate(self)
             .byBgColor(JobsClearColor);
         }))
         .setMasonryBy(^(MASConstraintMaker *_Nonnull make){
             @jobs_strongify(self)
             make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(0);
             make.left.right.equalTo(self.view);
             make.height.mas_equalTo(listContainerViewDefaultOffset);
         }).on();
     };return _categoryView;
 }
 
 */
#endif /* JOBS_HEADER_GUARD_JXCATEGORYIMAGEVIEW_EXTRA_73B12DC65C */

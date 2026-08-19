//
//  JobsOCExcelView.h
//  JobsOCExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsOCExcelStyle.h"
#import "JobsOCExcelColumn.h"
#import "JobsOCExcelRow.h"
#import "JobsOCExcelCellContext.h"

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

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@class JobsOCExcelView;

@protocol JobsOCExcelViewDelegate <NSObject>
@optional
-(void)excelView:(JobsOCExcelView *)excelView
   didSelectCell:(JobsOCExcelCellContext *)context;
-(void)excelView:(JobsOCExcelView *)excelView
didScrollHorizontallyToOffset:(CGFloat)offset;
@end

@interface JobsOCExcelView : UIView

Prop_weak(nullable)id<JobsOCExcelViewDelegate> delegate;
Prop_copy(readonly)NSArray<JobsOCExcelColumn *> *columns;
Prop_copy(readonly)NSArray<JobsOCExcelRow *> *rows;
/// NSNotFound 表示不冻结；N 表示冻结第 0...N 列。
Prop_assign(readonly)NSInteger freezeThroughColumn;
Prop_strong(readonly)JobsOCExcelStyle *style;
Prop_assign(readonly)CGFloat requiredHeight;
Prop_assign(readonly)CGFloat horizontalContentOffset;

-(JobsRetJobsOCExcelViewByIDBlock _Nonnull)byDelegate;
-(void)configureWithColumns:(NSArray<JobsOCExcelColumn *> *)columns
                       rows:(NSArray<JobsOCExcelRow *> *)rows
        freezeThroughColumn:(NSInteger)freezeThroughColumn
                      style:(nullable JobsOCExcelStyle *)style;
-(void)reloadData;
-(jobsByVoidBlock _Nonnull)jobsReloadData;
-(void)setHorizontalContentOffset:(CGFloat)offset
                         animated:(BOOL)animated;

-(JobsRetCGSizeByVoidBlock _Nonnull)jobsIntrinsicContentSize;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCExcelView
-(JobsRetJobsOCExcelViewByNSArrayJobsOCExcelColumnBlock _Nonnull)byColumns;
-(JobsRetJobsOCExcelViewByNSArrayJobsOCExcelRowBlock _Nonnull)byRows;
-(JobsRetJobsOCExcelViewByNSIntegerBlock _Nonnull)byFreezeThroughColumn;
-(JobsRetJobsOCExcelViewByNSMutableArrayUILabelBlock _Nonnull)byGeneratedLabels;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCExcelView
@end

NS_ASSUME_NONNULL_END

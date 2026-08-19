//
//  JobsOCExcelRow.h
//  JobsOCExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsOCExcelCell.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCExcelRow : NSObject

Prop_copy()NSArray<JobsOCExcelCell *> *cells;

+(JobsRetIDByNSArrayJobsOCExcelCellBlock _Nonnull)rowWithCells;
+(JobsRetIDByNSArrayNSStringBlock _Nonnull)rowWithValues;
+(instancetype)rowWithValues:(NSArray<NSString *> *)values
             textDisplayMode:(JobsLabelTextDisplayMode)textDisplayMode;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCExcelRow
-(JobsRetJobsOCExcelRowByNSArrayJobsOCExcelCellBlock _Nonnull)byCells;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCExcelRow
@end

NS_ASSUME_NONNULL_END

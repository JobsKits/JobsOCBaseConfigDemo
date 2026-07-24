//
//  JobsOCExcelRow.h
//  JobsOCExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import <Foundation/Foundation.h>
#import "JobsOCExcelCell.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCExcelRow : NSObject

Prop_copy()NSArray<JobsOCExcelCell *> *cells;

+(instancetype)rowWithCells:(NSArray<JobsOCExcelCell *> *)cells;
+(instancetype)rowWithValues:(NSArray<NSString *> *)values;
+(instancetype)rowWithValues:(NSArray<NSString *> *)values
             textDisplayMode:(JobsLabelTextDisplayMode)textDisplayMode;

@end

NS_ASSUME_NONNULL_END

//
//  JobsOCExcelDemoCell.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import <UIKit/UIKit.h>

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

#if __has_include(<JobsOCExcel/JobsOCExcel.h>)
#import <JobsOCExcel/JobsOCExcel.h>
#else
#import "JobsOCExcel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCExcelDemoCell : UITableViewCell

-(void)configureWithTitle:(NSString *)title
                  columns:(NSArray<JobsOCExcelColumn *> *)columns
                     rows:(NSArray<JobsOCExcelRow *> *)rows
      freezeThroughColumn:(NSInteger)freezeThroughColumn
                 delegate:(nullable id<JobsOCExcelViewDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END

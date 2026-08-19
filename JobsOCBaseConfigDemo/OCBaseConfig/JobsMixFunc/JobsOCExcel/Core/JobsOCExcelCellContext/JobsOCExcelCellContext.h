//
//  JobsOCExcelCellContext.h
//  JobsOCExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import <Foundation/Foundation.h>

#import "JobsBlock.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCExcelCellContext : NSObject

Prop_assign()NSInteger row;
Prop_assign()NSInteger column;
Prop_copy()NSString *value;

-(JobsRetJobsOCExcelCellContextByNSIntegerBlock _Nonnull)byRow;
-(JobsRetJobsOCExcelCellContextByNSIntegerBlock _Nonnull)byColumn;
-(JobsRetJobsOCExcelCellContextByStrBlock _Nonnull)byValue;

+(instancetype)contextWithRow:(NSInteger)row
                       column:(NSInteger)column
                        value:(NSString *)value;

@end

NS_ASSUME_NONNULL_END

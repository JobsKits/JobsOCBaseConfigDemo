//
//  JobsOCExcelCellContext.h
//  JobsOCExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import <Foundation/Foundation.h>

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

+(instancetype)contextWithRow:(NSInteger)row
                       column:(NSInteger)column
                        value:(NSString *)value;

@end

NS_ASSUME_NONNULL_END

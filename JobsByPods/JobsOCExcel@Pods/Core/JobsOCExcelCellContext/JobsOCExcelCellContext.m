//
//  JobsOCExcelCellContext.m
//  JobsOCExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import "JobsOCExcelCellContext.h"

@implementation JobsOCExcelCellContext
+(instancetype)contextWithRow:(NSInteger)row
                       column:(NSInteger)column
                        value:(NSString *)value{
    JobsOCExcelCellContext *context = JobsOCExcelCellContext.new;
    context.row = row;
    context.column = column;
    context.value = value ?: @"";
    return context;
}

@end

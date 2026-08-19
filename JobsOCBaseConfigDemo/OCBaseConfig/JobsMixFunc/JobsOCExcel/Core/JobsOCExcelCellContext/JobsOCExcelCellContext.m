//
//  JobsOCExcelCellContext.m
//  JobsOCExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import "JobsOCExcelCellContext.h"

@implementation JobsOCExcelCellContext
-(JobsRetJobsOCExcelCellContextByNSIntegerBlock _Nonnull)byRow{
    @jobs_weakify(self)
    return ^JobsOCExcelCellContext *(NSInteger row){
        @jobs_strongify(self)
        self.row = row;
        return self;
    };
}

-(JobsRetJobsOCExcelCellContextByNSIntegerBlock _Nonnull)byColumn{
    @jobs_weakify(self)
    return ^JobsOCExcelCellContext *(NSInteger column){
        @jobs_strongify(self)
        self.column = column;
        return self;
    };
}

-(JobsRetJobsOCExcelCellContextByStrBlock _Nonnull)byValue{
    @jobs_weakify(self)
    return ^JobsOCExcelCellContext *(NSString *value){
        @jobs_strongify(self)
        self.value = value;
        return self;
    };
}

+(instancetype)contextWithRow:(NSInteger)row
                       column:(NSInteger)column
                        value:(NSString *)value{
    JobsOCExcelCellContext *context = JobsOCExcelCellContext.new;
    return context
        .byRow(row)
        .byColumn(column)
        .byValue(value ?: @"");
}

@end

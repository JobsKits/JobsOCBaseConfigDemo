//
//  JobsOCExcelRow.m
//  JobsOCExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import "JobsOCExcelRow.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCExcelRow
@interface JobsOCExcelRow (JobsPropertyDSLSetterAutogen_d032fa3f80)
-(void)setCells:(NSArray<JobsOCExcelCell *> * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCExcelRow

@implementation JobsOCExcelRow
+(JobsRetIDByNSArrayJobsOCExcelCellBlock _Nonnull)rowWithCells{
    return ^id(NSArray<JobsOCExcelCell *> * cells){
        JobsOCExcelRow *row = JobsOCExcelRow.new;
        row.byCells(cells ?: NSArray.array);
        return row;
    };
}

+(JobsRetIDByNSArrayNSStringBlock _Nonnull)rowWithValues{
    return ^id(NSArray<NSString *> * values){
        return [self rowWithValues:values
                   textDisplayMode:JobsLabelTextDisplayModeSingleLineTailTruncation];
    };
}

+(instancetype)rowWithValues:(NSArray<NSString *> *)values
             textDisplayMode:(JobsLabelTextDisplayMode)textDisplayMode{
    NSMutableArray<JobsOCExcelCell *> *cells = NSMutableArray.array;
    for (NSString *value in values ?: NSArray.array) {
        [cells addObject:[JobsOCExcelCell cellWithText:value
                                      textDisplayMode:textDisplayMode]];
    }return self.rowWithCells(cells.copy);
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCExcelRow
-(JobsRetJobsOCExcelRowByNSArrayJobsOCExcelCellBlock _Nonnull)byCells{
    @jobs_weakify(self)
    return ^__kindof JobsOCExcelRow * _Nullable(NSArray<JobsOCExcelCell *> * _Nullable data){
        @jobs_strongify(self)
        [self setCells:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCExcelRow
@end

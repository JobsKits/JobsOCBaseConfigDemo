//
//  JobsOCExcelRow.m
//  JobsOCExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import "JobsOCExcelRow.h"

@implementation JobsOCExcelRow
+(instancetype)rowWithCells:(NSArray<JobsOCExcelCell *> *)cells{
    JobsOCExcelRow *row = JobsOCExcelRow.new;
    row.cells = cells ?: NSArray.array;
    return row;
}

+(instancetype)rowWithValues:(NSArray<NSString *> *)values{
    return [self rowWithValues:values
               textDisplayMode:JobsLabelTextDisplayModeSingleLineTailTruncation];
}

+(instancetype)rowWithValues:(NSArray<NSString *> *)values
             textDisplayMode:(JobsLabelTextDisplayMode)textDisplayMode{
    NSMutableArray<JobsOCExcelCell *> *cells = NSMutableArray.array;
    for (NSString *value in values ?: NSArray.array) {
        [cells addObject:[JobsOCExcelCell cellWithText:value
                                      textDisplayMode:textDisplayMode]];
    }return [self rowWithCells:cells.copy];
}

@end

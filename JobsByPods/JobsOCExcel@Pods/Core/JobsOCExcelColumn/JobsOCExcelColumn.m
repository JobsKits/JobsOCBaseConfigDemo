//
//  JobsOCExcelColumn.m
//  JobsOCExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import "JobsOCExcelColumn.h"

@implementation JobsOCExcelColumn

+(instancetype)columnWithTitle:(NSString *)title
                          width:(CGFloat)width{
    return [self columnWithTitle:title
                           width:width
                 textDisplayMode:JobsLabelTextDisplayModeSingleLineTailTruncation];
}

+(instancetype)columnWithTitle:(NSString *)title
                          width:(CGFloat)width
                textDisplayMode:(JobsLabelTextDisplayMode)textDisplayMode{
    return [self columnWithHeader:[JobsOCExcelCell cellWithText:title
                                                 textDisplayMode:textDisplayMode]
                            width:width];
}

+(instancetype)columnWithHeader:(JobsOCExcelCell *)header
                           width:(CGFloat)width{
    JobsOCExcelColumn *column = JobsOCExcelColumn.new;
    column.header = header ?: [JobsOCExcelCell cellWithText:@""];
    column.width = width;
    return column;
}

@end

//
//  JobsOCExcelColumn.m
//  JobsOCExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import "JobsOCExcelColumn.h"

@implementation JobsOCExcelColumn
-(JobsRetJobsOCExcelColumnByCellBlock _Nonnull)byHeader{
    @jobs_weakify(self)
    return ^JobsOCExcelColumn *(JobsOCExcelCell *header){
        @jobs_strongify(self)
        self.header = header;
        return self;
    };
}

-(JobsRetJobsOCExcelColumnByCGFloatBlock _Nonnull)byWidth{
    @jobs_weakify(self)
    return ^JobsOCExcelColumn *(CGFloat width){
        @jobs_strongify(self)
        self.width = width;
        return self;
    };
}

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
    return column
        .byHeader(header ?: JobsOCExcelCell.cellWithText(@""))
        .byWidth(width);
}

@end

//
//  JobsOCDemoSectionModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#import "JobsOCDemoSectionModel.h"

@implementation JobsOCDemoSectionModel

+(instancetype)sectionWithTitle:(NSString *)title{
    JobsOCDemoSectionModel *sectionModel = JobsOCDemoSectionModel.new;
    sectionModel.title = title;
    return sectionModel;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
    };return _dataMutArr;
}

@end

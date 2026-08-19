//
//  JobsOCDemoSectionModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#import "JobsOCDemoSectionModel.h"

@implementation JobsOCDemoSectionModel
+(JobsRetJobsOCDemoSectionModelByStrBlock _Nonnull)sectionWithTitle{
    return ^JobsOCDemoSectionModel *(NSString * title){
        return JobsOCDemoSectionModel.new.byTitle(title);
    };
}

-(JobsRetJobsOCDemoSectionModelByStrBlock _Nonnull)byTitle{
    @jobs_weakify(self)
    return ^JobsOCDemoSectionModel *(NSString *_Nullable title) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.title = title;
        return self;
    };
}

-(JobsRetJobsOCDemoSectionModelByStrBlock _Nonnull)bySectionDescription{
    @jobs_weakify(self)
    return ^JobsOCDemoSectionModel *(NSString *_Nullable sectionDescription) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.sectionDescription = sectionDescription;
        return self;
    };
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
    };return _dataMutArr;
}

@end

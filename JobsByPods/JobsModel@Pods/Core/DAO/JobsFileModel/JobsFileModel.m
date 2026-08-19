//
//  JobsFileModel.m
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsFileModel.h"
#import <JobsModel/NSDate+Extra.h>
#import <JobsModel/NSObject+Extra.h>

@implementation JobsFileModel
-(NSString *)fileName{
    if(!_fileName){
        _fileName = self.jobsCurrentDate().toReadableTime(nil);
    };return _fileName;
}

@end

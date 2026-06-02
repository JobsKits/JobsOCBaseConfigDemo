//
//  JobsFileModel.m
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsFileModel.h"
#import "NSDate+Extra.h"
#import "NSObject+Extras.h"

@implementation JobsFileModel

-(NSString *)fileName{
    if(!_fileName){
        _fileName = self.currentDate.toReadableTime(nil);
    }return _fileName;
}

@end

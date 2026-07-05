//
//  JobsOCVideoRecorderResult.m
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#import "JobsOCVideoRecorderResult.h"

@implementation JobsOCVideoRecorderResult

+(instancetype)resultWithFileURL:(NSURL *)fileURL
                         duration:(CMTime)duration{
    JobsOCVideoRecorderResult *result = JobsOCVideoRecorderResult.new;
    result.fileURL = fileURL;
    result.duration = duration;
    result.createdAt = NSDate.date;
    return result;
}

-(NSDate *)createdAt{
    if (!_createdAt) {
        _createdAt = NSDate.date;
    };return _createdAt;
}

@end

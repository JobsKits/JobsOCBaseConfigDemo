//
//  JobsOCVideoRecorderResult.m
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#import "JobsOCVideoRecorderResult.h"

@implementation JobsOCVideoRecorderResult
#define JobsOCVideoRecorderResultDSL(_name_, _blockType_, _dataType_, _property_) \
-(_blockType_ _Nonnull)by##_name_{ \
    @jobs_weakify(self) \
    return ^__kindof JobsOCVideoRecorderResult *_Nullable(_dataType_ data){ \
        @jobs_strongify(self) \
        self._property_ = data; \
        return self; \
    }; \
}
JobsOCVideoRecorderResultDSL(FileURL, JobsRetJobsOCVideoRecorderResultByURLBlock, NSURL *_Nullable, fileURL)
JobsOCVideoRecorderResultDSL(Duration, JobsRetJobsOCVideoRecorderResultByCMTimeBlock, CMTime, duration)
JobsOCVideoRecorderResultDSL(AssetLocalIdentifier, JobsRetJobsOCVideoRecorderResultByStrBlock, NSString *_Nullable, assetLocalIdentifier)
JobsOCVideoRecorderResultDSL(CreatedAt, JobsRetJobsOCVideoRecorderResultByDateBlock, NSDate *_Nullable, createdAt)
#undef JobsOCVideoRecorderResultDSL
+(instancetype)resultWithFileURL:(NSURL *)fileURL
                         duration:(CMTime)duration{
    return JobsOCVideoRecorderResult.new
        .byFileURL(fileURL)
        .byDuration(duration)
        .byCreatedAt(NSDate.date);
}

-(NSDate *)createdAt{
    if (!_createdAt) {
        _createdAt = NSDate.date;
    };return _createdAt;
}

@end

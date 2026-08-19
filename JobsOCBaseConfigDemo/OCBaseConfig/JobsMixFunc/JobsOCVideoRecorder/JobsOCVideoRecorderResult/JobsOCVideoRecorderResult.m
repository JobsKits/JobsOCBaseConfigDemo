//
//  JobsOCVideoRecorderResult.m
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#import "JobsOCVideoRecorderResult.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCVideoRecorderResult
@interface JobsOCVideoRecorderResult (JobsPropertyDSLSetterAutogen_30639e9921)
-(void)setAssetLocalIdentifier:(NSString * _Nullable)data;
-(void)setCreatedAt:(NSDate * _Nullable)data;
-(void)setDuration:(CMTime)data;
-(void)setFileURL:(NSURL * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCVideoRecorderResult

@implementation JobsOCVideoRecorderResult
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

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCVideoRecorderResult
-(JobsRetJobsOCVideoRecorderResultByDateBlock _Nonnull)byCreatedAt{
    @jobs_weakify(self)
    return ^__kindof JobsOCVideoRecorderResult * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        [self setCreatedAt:data];
        return self;
    };
}

-(JobsRetJobsOCVideoRecorderResultByStrBlock _Nonnull)byAssetLocalIdentifier{
    @jobs_weakify(self)
    return ^__kindof JobsOCVideoRecorderResult * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setAssetLocalIdentifier:data];
        return self;
    };
}

-(JobsRetJobsOCVideoRecorderResultByCMTimeBlock _Nonnull)byDuration{
    @jobs_weakify(self)
    return ^__kindof JobsOCVideoRecorderResult * _Nullable(CMTime data){
        @jobs_strongify(self)
        [self setDuration:data];
        return self;
    };
}

-(JobsRetJobsOCVideoRecorderResultByURLBlock _Nonnull)byFileURL{
    @jobs_weakify(self)
    return ^__kindof JobsOCVideoRecorderResult * _Nullable(NSURL * _Nullable data){
        @jobs_strongify(self)
        [self setFileURL:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCVideoRecorderResult
@end

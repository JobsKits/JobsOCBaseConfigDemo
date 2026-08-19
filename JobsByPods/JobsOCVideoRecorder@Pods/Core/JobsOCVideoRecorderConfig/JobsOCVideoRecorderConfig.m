//
//  JobsOCVideoRecorderConfig.m
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#import "JobsOCVideoRecorderConfig.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCVideoRecorderConfig
@interface JobsOCVideoRecorderConfig (JobsPropertyDSLSetterAutogen_3028529dd4)
-(void)setFilterProcessor:(id<JobsOCVideoRecorderFilterProtocol> _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCVideoRecorderConfig

@implementation JobsOCVideoRecorderConfig
+(JobsRetIDByVoidBlock _Nonnull)defaultConfig{
    return ^id{
        return JobsOCVideoRecorderConfig.new;
    };
}

-(instancetype)init{
    if (self = [super init]) {
        _maxDuration = 60.0;
        _minDuration = 3.0;
        _preferredCameraPosition = AVCaptureDevicePositionFront;
        _mirrorsFrontCameraPreview = YES;
        _videoBitrate = 4 * 1000 * 1000;
        _audioBitrate = 64 * 1000;
        _audioSampleRate = 44100;
        _audioChannels = 1;
        _outputFileType = AVFileTypeMPEG4;
    };return self;
}

-(JobsRetStrByVoidBlock _Nonnull)effectiveAlbumName{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        if (self.albumName.length) return self.albumName;
        NSString *displayName = NSBundle.mainBundle.infoDictionary[@"CFBundleDisplayName"];
        NSString *bundleName = NSBundle.mainBundle.infoDictionary[@"CFBundleName"];
        return displayName.length ? displayName : bundleName ?: @"JobsOCVideoRecorder";
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCVideoRecorderConfig
-(JobsRetJobsOCVideoRecorderConfigByIDJobsOCVideoRecorderFilterProtocolBlock _Nonnull)byFilterProcessor{
    @jobs_weakify(self)
    return ^__kindof JobsOCVideoRecorderConfig * _Nullable(id<JobsOCVideoRecorderFilterProtocol> _Nullable data){
        @jobs_strongify(self)
        [self setFilterProcessor:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCVideoRecorderConfig
@end

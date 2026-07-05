//
//  JobsOCVideoRecorderConfig.m
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#import "JobsOCVideoRecorderConfig.h"

@implementation JobsOCVideoRecorderConfig

+(instancetype)defaultConfig{
    return JobsOCVideoRecorderConfig.new;
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

-(NSString *)effectiveAlbumName{
    if (self.albumName.length) return self.albumName;
    NSString *displayName = NSBundle.mainBundle.infoDictionary[@"CFBundleDisplayName"];
    NSString *bundleName = NSBundle.mainBundle.infoDictionary[@"CFBundleName"];
    return displayName.length ? displayName : bundleName ?: @"JobsOCVideoRecorder";
}

@end

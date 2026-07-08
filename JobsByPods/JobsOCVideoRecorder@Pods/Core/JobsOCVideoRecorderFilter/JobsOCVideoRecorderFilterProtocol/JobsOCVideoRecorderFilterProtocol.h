//
//  JobsOCVideoRecorderFilterProtocol.h
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#ifndef JobsOCVideoRecorderFilterProtocol_h
#define JobsOCVideoRecorderFilterProtocol_h

#import <CoreMedia/CoreMedia.h>
#import <CoreVideo/CoreVideo.h>

NS_ASSUME_NONNULL_BEGIN

@protocol JobsOCVideoRecorderFilterProtocol <NSObject>

/// 预留滤镜处理口：返回原始 pixelBuffer 或新建的处理后 pixelBuffer；返回新 buffer 时调用方使用后负责释放。
-(CVPixelBufferRef _Nullable)processPixelBuffer:(CVPixelBufferRef)pixelBuffer
                               presentationTime:(CMTime)presentationTime;

@end

NS_ASSUME_NONNULL_END
#endif /* JobsOCVideoRecorderFilterProtocol_h */

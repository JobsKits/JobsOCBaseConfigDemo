//
//  JobsOCVideoRecorderResult.h
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#ifndef JobsOCVideoRecorderResult_h
#define JobsOCVideoRecorderResult_h

#import <Foundation/Foundation.h>
#import <CoreMedia/CoreMedia.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCVideoRecorderResult : NSObject

Prop_strong() NSURL *fileURL;
Prop_assign() CMTime duration;
Prop_copy(nullable) NSString *assetLocalIdentifier;
Prop_strong() NSDate *createdAt;

+(instancetype)resultWithFileURL:(NSURL *)fileURL
                         duration:(CMTime)duration;

@end

NS_ASSUME_NONNULL_END
#endif /* JobsOCVideoRecorderResult_h */

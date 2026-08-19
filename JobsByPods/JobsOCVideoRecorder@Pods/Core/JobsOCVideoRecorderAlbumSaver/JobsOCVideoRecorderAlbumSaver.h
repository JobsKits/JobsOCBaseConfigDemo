//
//  JobsOCVideoRecorderAlbumSaver.h
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#ifndef JobsOCVideoRecorderAlbumSaver_h
#define JobsOCVideoRecorderAlbumSaver_h

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef void(^JobsOCVideoRecorderAlbumSaveBlock)(NSString *_Nullable assetLocalIdentifier,
                                                 NSError *_Nullable error);

@interface JobsOCVideoRecorderAlbumSaver : NSObject

+(void)saveVideoAtURL:(NSURL *)videoURL
             albumName:(NSString *)albumName
            completion:(JobsOCVideoRecorderAlbumSaveBlock)completion;

@end

NS_ASSUME_NONNULL_END
#endif /* JobsOCVideoRecorderAlbumSaver_h */

//
//  JobsScreenshotCapturer.h
//  JobsScreenCapture
//
//  Created by Jobs on 2026年7月22日，星期三.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString * const JobsScreenshotCaptureErrorDomain;

typedef NS_ENUM(NSInteger, JobsScreenshotCaptureErrorCode) {
    JobsScreenshotCaptureErrorCodeInvalidBounds = 1,
    JobsScreenshotCaptureErrorCodeRenderFailed,
    JobsScreenshotCaptureErrorCodePhotoLibraryUnauthorized,
    JobsScreenshotCaptureErrorCodePhotoLibrarySaveFailed
};

@interface JobsScreenshotCapturer : NSObject

-(nullable UIImage *)captureView:(UIView *)view
              afterScreenUpdates:(BOOL)afterScreenUpdates;
-(void)captureAndSaveView:(UIView *)view
       afterScreenUpdates:(BOOL)afterScreenUpdates
                completion:(nullable jobsByErrBlock)completion;

@end

NS_ASSUME_NONNULL_END

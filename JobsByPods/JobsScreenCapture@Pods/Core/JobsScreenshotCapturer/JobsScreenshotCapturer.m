//
//  JobsScreenshotCapturer.m
//  JobsScreenCapture
//
//  Created by Jobs on 2026年7月22日，星期三.
//

#import "JobsScreenshotCapturer.h"

NSString * const JobsScreenshotCaptureErrorDomain = @"com.jobs.screen-capture";

@interface JobsScreenshotCapturer ()

-(JobsRetBOOLByPHAuthorizationStatusBlock _Nonnull)canAddToPhotoLibrary;
-(NSError *)errorByCode:(JobsScreenshotCaptureErrorCode)code
            description:(NSString *)description;
-(void)finish:(nullable jobsByErrBlock)completion
        error:(nullable NSError *)error;

@end

@implementation JobsScreenshotCapturer

-(UIImage *)captureView:(UIView *)view
      afterScreenUpdates:(BOOL)afterScreenUpdates{
    if (!NSThread.isMainThread) {
        __block UIImage *image = nil;
        dispatch_sync(dispatch_get_main_queue(), ^{
            image = [self captureView:view afterScreenUpdates:afterScreenUpdates];
        });return image;
    }
    if (CGRectIsEmpty(view.bounds)) return nil;
    [view layoutIfNeeded];
    __block BOOL didRender = NO;
    UIGraphicsImageRenderer *renderer = [UIGraphicsImageRenderer.alloc initWithBounds:view.bounds];
    UIImage *image = [renderer imageWithActions:^(__unused UIGraphicsImageRendererContext *rendererContext) {
        didRender = [view drawViewHierarchyInRect:view.bounds
                              afterScreenUpdates:afterScreenUpdates];
    }];return didRender ? image : nil;
}

-(void)captureAndSaveView:(UIView *)view
       afterScreenUpdates:(BOOL)afterScreenUpdates
                completion:(jobsByErrBlock)completion{
    if (!NSThread.isMainThread) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self captureAndSaveView:view
                  afterScreenUpdates:afterScreenUpdates
                           completion:completion];
        });
        return;
    }
    UIImage *image = [self captureView:view afterScreenUpdates:afterScreenUpdates];
    if (!image) {
        JobsScreenshotCaptureErrorCode code = CGRectIsEmpty(view.bounds) ?
            JobsScreenshotCaptureErrorCodeInvalidBounds : JobsScreenshotCaptureErrorCodeRenderFailed;
        NSString *description = code == JobsScreenshotCaptureErrorCodeInvalidBounds ?
            @"当前页面尚未完成布局，无法截屏。" : @"当前页面渲染失败，未生成截图。";
        [self finish:completion error:[self errorByCode:code description:description]];
        return;
    }
    void (^authorizationHandler)(PHAuthorizationStatus) = ^(PHAuthorizationStatus status) {
        if (!self.canAddToPhotoLibrary(status)) {
            [self finish:completion
                    error:[self errorByCode:JobsScreenshotCaptureErrorCodePhotoLibraryUnauthorized
                                    description:@"没有相册写入权限，无法保存截图。"]];
            return;
        }
        [PHPhotoLibrary.sharedPhotoLibrary performChanges:^{
            [PHAssetChangeRequest creationRequestForAssetFromImage:image];
        } completionHandler:^(BOOL success, NSError *error) {
            if (success) {
                [self finish:completion error:nil];
            }else{
                [self finish:completion
                        error:error ?: [self errorByCode:JobsScreenshotCaptureErrorCodePhotoLibrarySaveFailed
                                             description:@"截图已生成，但保存到相册失败。"]];
            }
        }];
    };
    if (@available(iOS 14.0, *)) {
        [PHPhotoLibrary requestAuthorizationForAccessLevel:PHAccessLevelAddOnly
                                                   handler:authorizationHandler];
    }else{
        [PHPhotoLibrary requestAuthorization:authorizationHandler];
    }
}

-(JobsRetBOOLByPHAuthorizationStatusBlock _Nonnull)canAddToPhotoLibrary{
    @jobs_weakify(self)
    return ^BOOL(PHAuthorizationStatus status){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        if (@available(iOS 14.0, *)) {
            return status == PHAuthorizationStatusAuthorized || status == PHAuthorizationStatusLimited;
        };return status == PHAuthorizationStatusAuthorized;
    };
}

-(NSError *)errorByCode:(JobsScreenshotCaptureErrorCode)code
            description:(NSString *)description{
    return [NSError errorWithDomain:JobsScreenshotCaptureErrorDomain
                               code:code
                           userInfo:@{NSLocalizedDescriptionKey: description}];
}

-(void)finish:(jobsByErrBlock)completion
        error:(NSError *)error{
    if (!completion) return;
    dispatch_async(dispatch_get_main_queue(), ^{
        completion(error);
    });
}

@end

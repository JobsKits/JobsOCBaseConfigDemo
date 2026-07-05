//
//  JobsOCVideoRecorderAlbumSaver.m
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#import "JobsOCVideoRecorderAlbumSaver.h"

@implementation JobsOCVideoRecorderAlbumSaver

+(void)saveVideoAtURL:(NSURL *)videoURL
             albumName:(NSString *)albumName
            completion:(JobsOCVideoRecorderAlbumSaveBlock)completion{
    if (!videoURL || ![NSFileManager.defaultManager fileExistsAtPath:videoURL.path]) {
        [self complete:completion assetLocalIdentifier:nil error:[self errorWithCode:-1 description:@"视频文件不存在"]];
        return;
    }
    NSString *targetAlbumName = albumName.length ? albumName : @"JobsOCVideoRecorder";
    PHAssetCollection *collection = [self assetCollectionWithTitle:targetAlbumName];
    if (!collection) {
        [self createAlbumWithTitle:targetAlbumName completion:^(PHAssetCollection *createdCollection, NSError *error) {
            if (error || !createdCollection) {
                [self complete:completion assetLocalIdentifier:nil error:error ?: [self errorWithCode:-2 description:@"创建相册失败"]];
                return;
            }
            [self saveVideoAtURL:videoURL
                       collection:createdCollection
                       completion:completion];
        }];
        return;
    }
    [self saveVideoAtURL:videoURL
              collection:collection
              completion:completion];
}

+(void)saveVideoAtURL:(NSURL *)videoURL
           collection:(PHAssetCollection *)collection
           completion:(JobsOCVideoRecorderAlbumSaveBlock)completion{
    __block NSString *localIdentifier = nil;
    [PHPhotoLibrary.sharedPhotoLibrary performChanges:^{
        PHAssetChangeRequest *assetRequest = [PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:videoURL];
        PHObjectPlaceholder *placeholder = assetRequest.placeholderForCreatedAsset;
        localIdentifier = placeholder.localIdentifier;
        PHAssetCollectionChangeRequest *collectionRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:collection];
        if (placeholder) [collectionRequest addAssets:@[placeholder]];
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        [self complete:completion
  assetLocalIdentifier:success ? localIdentifier : nil
                 error:success ? nil : error];
    }];
}

+(void)createAlbumWithTitle:(NSString *)title
                 completion:(void(^)(PHAssetCollection *_Nullable collection, NSError *_Nullable error))completion{
    __block NSString *collectionLocalIdentifier = nil;
    [PHPhotoLibrary.sharedPhotoLibrary performChanges:^{
        PHAssetCollectionChangeRequest *request = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:title];
        collectionLocalIdentifier = request.placeholderForCreatedAssetCollection.localIdentifier;
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        PHAssetCollection *collection = nil;
        if (success && collectionLocalIdentifier.length) {
            PHFetchResult<PHAssetCollection *> *result = [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:@[collectionLocalIdentifier]
                                                                                                                options:nil];
            collection = result.firstObject;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) completion(collection, success ? nil : error);
        });
    }];
}

+(PHAssetCollection *)assetCollectionWithTitle:(NSString *)title{
    PHFetchOptions *options = PHFetchOptions.new;
    options.predicate = [NSPredicate predicateWithFormat:@"title = %@", title];
    PHFetchResult<PHAssetCollection *> *result = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum
                                                                                         subtype:PHAssetCollectionSubtypeAlbumRegular
                                                                                         options:options];
    return result.firstObject;
}

+(void)complete:(JobsOCVideoRecorderAlbumSaveBlock)completion
assetLocalIdentifier:(NSString *)assetLocalIdentifier
          error:(NSError *)error{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (completion) completion(assetLocalIdentifier, error);
    });
}

+(NSError *)errorWithCode:(NSInteger)code
              description:(NSString *)description{
    return [NSError errorWithDomain:@"com.jobs.oc.video.recorder.album"
                               code:code
                           userInfo:@{NSLocalizedDescriptionKey: description ?: @"保存相册失败"}];
}

@end

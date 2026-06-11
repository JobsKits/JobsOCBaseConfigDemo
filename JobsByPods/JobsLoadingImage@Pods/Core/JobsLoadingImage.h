//
//  JobsLoadingImage.h
//  JobsLoadingImage
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSLOADINGIMAGE_85528F46B9
#define JOBS_HEADER_GUARD_JOBSLOADINGIMAGE_85528F46B9

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT double JobsLoadingImageVersionNumber;
FOUNDATION_EXPORT const unsigned char JobsLoadingImageVersionString[];

#pragma mark —— Core helpers
/// 判断对象是否为空值。
FOUNDATION_EXPORT BOOL JobsObjectIsNull(id _Nullable obj);
/// 判断对象是否为有效值。
FOUNDATION_EXPORT BOOL JobsObjectIsValue(id _Nullable obj);
/// 给文件名补后缀。这里是“文件名后缀”，不是路径拼接。
FOUNDATION_EXPORT NSString *JobsAppendExtensionIfNeeded(NSString * _Nullable name,
                                                        NSString * _Nullable fileExtension);

#pragma mark —— Upgraded APIs
/// 更明确的资源路径 API。
FOUNDATION_EXPORT NSString *JobsBundleResourcePath(NSString * _Nullable blueFolderName,
                                                   NSString * _Nullable bundleName,
                                                   NSString * _Nullable bundleFolderName,
                                                   NSString * _Nullable resourceType);

/// 更明确的 bundle 图片路径 API。
FOUNDATION_EXPORT NSString *JobsBundleImagePath(NSString * _Nullable blueFolderName,
                                                NSString * _Nullable bundleName,
                                                NSString * _Nullable bundleFolderName,
                                                NSString * _Nullable imageNameOrFilename);

/// 更明确的 bundle 图片加载 API。
FOUNDATION_EXPORT UIImage * _Nullable JobsLoadBundleImage(NSString * _Nullable blueFolderName,
                                                          NSString * _Nullable bundleName,
                                                          NSString * _Nullable bundleFolderName,
                                                          NSString * _Nullable imageNameOrFilename);

/// 更明确的 bundle 图片数据加载 API。
FOUNDATION_EXPORT NSData * _Nullable JobsLoadBundleImageData(NSString * _Nullable blueFolderName,
                                                             NSString * _Nullable bundleName,
                                                             NSString * _Nullable bundleFolderName,
                                                             NSString * _Nullable imageNameOrFilename);

/// 通过 bundle 图片数据创建图片。
FOUNDATION_EXPORT UIImage * _Nullable JobsLoadBundleImageFromData(NSString * _Nullable blueFolderName,
                                                                  NSString * _Nullable bundleName,
                                                                  NSString * _Nullable bundleFolderName,
                                                                  NSString * _Nullable imageNameOrFilename);

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSLOADINGIMAGE_85528F46B9 */

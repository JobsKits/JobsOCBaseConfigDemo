//
//  PHAssetCollectionChangeRequest+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_PHASSETCOLLECTIONCHANGEREQUEST_EXTRA_F6872F9E53
#define JOBS_HEADER_GUARD_PHASSETCOLLECTIONCHANGEREQUEST_EXTRA_F6872F9E53

#import <Photos/Photos.h> // 提供系统相册访问能力，可读取和管理照片、视频等媒体资源。

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface PHAssetCollectionChangeRequest (Extra)
/// 对系统方法 changeRequestForAssetCollection 的二次封装
+(JobsRetPHAssetCollectionChangeRequestByPHAssetCollectionBlock _Nonnull)initBy;
/// 对系统方法 creationRequestForAssetCollectionWithTitle 的二次封装
+(JobsRetPHAssetCollectionChangeRequestByStringBlock _Nonnull)initByTitle;
/// 对系统方法 addAssets 的二次封装
-(JobsRetPHAssetCollectionChangeRequestByIDBlock _Nonnull)add;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_PHASSETCOLLECTIONCHANGEREQUEST_EXTRA_F6872F9E53 */

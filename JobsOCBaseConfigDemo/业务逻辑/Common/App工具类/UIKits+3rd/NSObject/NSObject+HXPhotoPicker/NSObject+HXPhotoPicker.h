//
//  NSObject+HXPhotoPicker.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <objc/runtime.h>
#import <TargetConditionals.h>
#import <UIKit/UIKit.h>

#if __has_include(<HXPhotoPickerObjC/HXPhotoPicker.h>)
#import <HXPhotoPickerObjC/HXPhotoPicker.h>
#else
#import "HXPhotoPicker.h"
#endif

#if __has_include(<TKPermissionKit/TKPermissionKit.h>)
#import <TKPermissionKit/TKPermissionKit.h>
#else
#import "TKPermissionKit.h"
#endif

#if __has_include(<WHToast/WHToast.h>)
#import <WHToast/WHToast.h>
#else
#import "WHToast.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

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
///【二次封装HXPhotoPicker】弹出系统相册选择页面 + 调取系统相机进行拍摄
@interface NSObject (HXPhotoPicker)
<
HXCustomNavigationControllerDelegate
,UIImagePickerControllerDelegate
,UINavigationControllerDelegate
>

Prop_strong()HXPhotoManager *photoManager; /// 选取图片的数据管理类
-(JobsRetIDByHXPhotoManagerBlock _Nonnull)byPhotoManager;
Prop_strong()NSMutableArray <HXPhotoModel *>*historyPhotoDataMutArr; /// 与之相对应的是self.photoManager.afterSelectedArray
Prop_strong()NSMutableArray <HXPhotoModel *>*photosDataMutArr;
Prop_strong()NSMutableArray <HXPhotoModel *>*videosDataMutArr;
/// HXPhotoPicker 弹出系统相册选择页面
-(void)hx_invokeSysPhotoAlbumSuccessBlock:(jobsByIDBlock _Nullable)successBlock
                                failBlock:(jobsByIDBlock _Nullable)failBlock;
/// HXPhotoPicker 调取系统相机进行拍摄
-(void)hx_invokeSysCameraSuccessBlock:(jobsByIDBlock _Nullable)successBlock
                            failBlock:(jobsByIDBlock _Nullable)failBlock;
/// 调取系统相机进行拍摄
-(jobsByVoidBlock _Nonnull)invokeSysCamera;

@end

NS_ASSUME_NONNULL_END

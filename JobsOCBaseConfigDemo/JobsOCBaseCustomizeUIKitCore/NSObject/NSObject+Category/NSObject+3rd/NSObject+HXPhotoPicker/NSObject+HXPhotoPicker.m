//
//  NSObject+HXPhotoPicker.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2022/5/20.
//

#import "NSObject+HXPhotoPicker.h"

static NSString * const JobsSystemCameraSimulatorToast = @"iOS 模拟器不支持调用系统相机，请使用真机";

@implementation NSObject (HXPhotoPicker)
#pragma mark —— 一些公有方法
/// HXPhotoPicker 弹出系统相册选择页面
-(void)hx_invokeSysPhotoAlbumSuccessBlock:(jobsByIDBlock _Nullable)successBlock
                                failBlock:(jobsByIDBlock _Nullable)failBlock{
    /// 请求相册权限
    @jobs_weakify(self)
    [TKPermissionPhoto authWithAlert:YES
                               level:TKPhotoAccessLevelReadWrite
                          completion:^(BOOL granted) {
        @jobs_strongify(self)
        if (granted) {
            UIViewController *viewController = nil;
            if([self isKindOfClass:UIViewController.class]){
                viewController = (UIViewController *)self;
            }
            if([self isKindOfClass:UIView.class]){
                UIView *view = (UIView *)self;
                viewController = self.getViewControllerByView(view) ? : self.getCurrentViewController;
            }
            if(viewController){
                [viewController hx_presentSelectPhotoControllerWithManager:self.photoManager
                                                                   didDone:^(NSArray<HXPhotoModel *> *allList,
                                                                             NSArray<HXPhotoModel *> *photoList,
                                                                             NSArray<HXPhotoModel *> *videoList,
                                                                             BOOL isOriginal,
                                                                             UIViewController *viewController,
                                                                             HXPhotoManager *manager) {
                    if (successBlock) successBlock(jobsMakeHXPhotoPickerModel(^(__kindof HXPhotoPickerModel * _Nullable model) {
                        model.byAllList(allList)
                             .byPhotoList(photoList)
                             .byVideoList(videoList)
                             .byIsOriginal(isOriginal)
                             .byVc(viewController)
                             .byPhotoManager(manager);
                    }));
                } cancel:^(UIViewController *viewController, HXPhotoManager *manager) {
                    if (failBlock) failBlock(jobsMakeHXPhotoPickerModel(^(__kindof HXPhotoPickerModel * _Nullable model) {
                        model.byVc(viewController)
                             .byPhotoManager(manager);
                    }));
                }];
            }
        }else @"保存图片需要获取您的相册权限，请前往设置开启".jobsTr().toast();
    }];
}
/// HXPhotoPicker 调取系统相机进行拍摄（没有兼容横屏）
-(void)hx_invokeSysCameraSuccessBlock:(jobsByIDBlock _Nullable)successBlock
                            failBlock:(jobsByIDBlock _Nullable)failBlock{
#if TARGET_OS_SIMULATOR
    JobsSystemCameraSimulatorToast.jobsTr().toast();
    return;
#endif
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        /// 请求相机📷权限
        @jobs_weakify(self)
        [TKPermissionCamera authWithAlert:YES
                               completion:^(BOOL granted) {
            @jobs_strongify(self)
            if (granted) {
                UIViewController *viewController = nil;
                if([self isKindOfClass:UIViewController.class]){
                    viewController = (UIViewController *)self;
                }
                if([self isKindOfClass:UIView.class]){
                    UIView *view = (UIView *)self;
                    viewController = (UIViewController *)self.getViewControllerByView(view);
                }
                if(viewController){
                    [viewController hx_presentCustomCameraViewControllerWithManager:self.photoManager
                                                                               done:^(HXPhotoModel *photoModel,
                                                                                      HXCustomCameraViewController *viewController) {
                        if (successBlock) successBlock(jobsMakeHXPhotoPickerModel(^(__kindof HXPhotoPickerModel * _Nullable model) {
                            model.byCustomCameraVC(viewController)
                                 .byPhotoModel(photoModel);
                        }));
                    } cancel:^(HXCustomCameraViewController *viewController) {
                        NSSLog(@"取消了");
                        UIViewController *targetVC = viewController.navigationController ? : viewController;
                        [targetVC dismissViewControllerAnimated:YES completion:nil];
                        if (failBlock) failBlock(jobsMakeHXPhotoPickerModel(^(__kindof HXPhotoPickerModel * _Nullable model) {
                            model.byCustomCameraVC(viewController);
                        }));
                    }];
                }
            }else @"授权失败,无法使用相机.请在设置-隐私-相机中允许访问相机".jobsTr().toast();
        }];
    }else @"此设备不支持相机!".jobsTr().toast();
}
/// 完全意义上的调用系统的相机拍照功能
#pragma mark —— UIImagePickerControllerDelegate
/// 当用户拍照完成后，这个方法会被调用
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    /// 获取编辑后的图片（如果 allowsEditing 为 NO，则获取原图）
    UIImage *selectedImage = info[UIImagePickerControllerEditedImage] ? : info[UIImagePickerControllerOriginalImage];
    /// 在此处处理拍照得到的图片，例如保存到相册或显示在界面上
    if(self.objBlock) self.objBlock(selectedImage);
    /// 关闭相机界面
    [picker dismissViewControllerAnimated:YES completion:nil];
}
/// 用户取消拍照时调用这个方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    ((((jobsByImagePickerCtrlBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(imagePickerControllerDidCancel)))(self, @selector(imagePickerControllerDidCancel))))(picker);
}
-(jobsByImagePickerCtrlBlock _Nonnull)imagePickerControllerDidCancel{
    @jobs_weakify(self)
    return ^(UIImagePickerController * picker){
        @jobs_strongify(self)
        if (!self) return;
        [picker dismissViewControllerAnimated:YES completion:nil];
    };
}
#pragma mark —— Prop_strong()HXPhotoManager *photoManager;//选取图片的数据管理类
JobsKey(_photoManager)
@dynamic photoManager;
-(HXPhotoManager *)photoManager{
    HXPhotoManager *PhotoManager = Jobs_getAssociatedObject(_photoManager);
    if (!PhotoManager) {
        PhotoManager = HXPhotoManager.initByTypePhotoAndVideo;
        @jobs_weakify(self)
        PhotoManager.configuration = jobsMakeHXPhotoConfiguration(^(__kindof HXPhotoConfiguration * _Nullable config) {
            @jobs_strongify(self)
            config
                .byLocalFileName(self.appDisplayName.add(@"Models"))
                .byType(HXConfigurationTypeWXChat)
                .byShowOriginalBytes(YES)
                .byShowOriginalBytesLoading(YES)
                .byVideoMaximumSelectDuration(-1)
                .byLimitVideoSize(100 * 1024 * 1024)
                .bySelectVideoLimitSize(YES)
                .bySelectVideoBeyondTheLimitTimeAutoEdit(NO)
                .bySpecialModeNeedHideVideoSelectBtn(NO)
                .byVideoMaxNum(1)
                .byMaxNum(9)
                .byPhotoMaxNum(9)
                .bySelectTogether(NO);
        });
        /// ❤️导航栏用系统自带的，防止外界关闭了导航栏的bug❤️
        PhotoManager.viewWillAppear = ^(UIViewController *viewController) {
            /// 只会影响 viewWillAppear 和 viewWillDisappear 两个生命周期
            [viewController.navigationController setNavigationBarHidden:NO animated:NO];
        };Jobs_setAssociatedRETAIN_NONATOMIC(_photoManager, PhotoManager)
    };return PhotoManager;
}

-(void)setPhotoManager:(HXPhotoManager *)photoManager{
    Jobs_setAssociatedRETAIN_NONATOMIC(_photoManager, photoManager)
}
#pragma mark —— Prop_strong()NSMutableArray <HXPhotoModel *>*__block historyPhotoDataMutArr;//与之相对应的是self.photoManager.afterSelectedArray
JobsKey(_historyPhotoDataMutArr)
@dynamic historyPhotoDataMutArr;
-(NSMutableArray <HXPhotoModel *>*)historyPhotoDataMutArr{
    NSMutableArray <HXPhotoModel *>*HistoryPhotoDataMutArr = Jobs_getAssociatedObject(_historyPhotoDataMutArr);
    if (!HistoryPhotoDataMutArr) {
        /// < 保存本地的方法 >
        /// 保存本地的方法都是在主线程调用
        /// 获取保存在本地文件的模型数组
        /// @param addData 是否添加到manager的数据中
        HistoryPhotoDataMutArr = NSMutableArray.initBy([self.photoManager getLocalModelsInFileWithAddData:YES]);
        Jobs_setAssociatedRETAIN_NONATOMIC(_historyPhotoDataMutArr, HistoryPhotoDataMutArr)
    };return HistoryPhotoDataMutArr;
}

-(void)setHistoryPhotoDataMutArr:(NSMutableArray<HXPhotoModel *> *)historyPhotoDataMutArr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_historyPhotoDataMutArr, historyPhotoDataMutArr)
}
#pragma mark —— Prop_strong()NSMutableArray <HXPhotoModel *>*__block photosDataMutArr;
JobsKey(_photosDataMutArr)
@dynamic photosDataMutArr;
-(NSMutableArray<HXPhotoModel *> *)photosDataMutArr{
    NSMutableArray <HXPhotoModel *>*PhotosDataMutArr = Jobs_getAssociatedObject(_photosDataMutArr);
    if (!PhotosDataMutArr) {
        PhotosDataMutArr = NSMutableArray.array;
        Jobs_setAssociatedRETAIN_NONATOMIC(_photosDataMutArr, PhotosDataMutArr)
    };return PhotosDataMutArr;
}

-(void)setPhotosDataMutArr:(NSMutableArray<HXPhotoModel *> *)photosDataMutArr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_photosDataMutArr, photosDataMutArr)
}
#pragma mark —— Prop_strong()NSMutableArray <HXPhotoModel *>*__block videosDataMutArr;
JobsKey(_videosDataMutArr)
@dynamic videosDataMutArr;
-(NSMutableArray<HXPhotoModel *> *)videosDataMutArr{
    NSMutableArray <HXPhotoModel *>*VideosDataMutArr = Jobs_getAssociatedObject(_videosDataMutArr);
    if (!VideosDataMutArr) {
        VideosDataMutArr = NSMutableArray.array;
        Jobs_setAssociatedRETAIN_NONATOMIC(_videosDataMutArr, VideosDataMutArr)
    };return VideosDataMutArr;
}

-(void)setVideosDataMutArr:(NSMutableArray<HXPhotoModel *> *)videosDataMutArr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_videosDataMutArr, videosDataMutArr)
}

@end

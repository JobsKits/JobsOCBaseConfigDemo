//
//  NSObject+GKPhotoBrowser.m
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+GKPhotoBrowser.h"

@implementation GKPhotoBrowserConfigure (JobsDSL)
#define JobsGKPhotoBrowserConfigureDSL(_type_, _name_, _property_, _dataType_) \
-(JobsRetGKPhotoBrowserConfigureBy##_type_##Block _Nonnull)by##_name_{ \
    @jobs_weakify(self) \
    return ^__kindof GKPhotoBrowserConfigure *_Nullable(_dataType_ data){ \
        @jobs_strongify(self) \
        self._property_ = data; \
        return self; \
    }; \
}
JobsGKPhotoBrowserConfigureDSL(ShowStyle, ShowStyle, showStyle, GKPhotoBrowserShowStyle)
JobsGKPhotoBrowserConfigureDSL(HideStyle, HideStyle, hideStyle, GKPhotoBrowserHideStyle)
JobsGKPhotoBrowserConfigureDSL(BOOL, IsSingleTapDisabled, isSingleTapDisabled, BOOL)
JobsGKPhotoBrowserConfigureDSL(BOOL, IsHideSourceView, isHideSourceView, BOOL)
JobsGKPhotoBrowserConfigureDSL(BOOL, IsFollowSystemRotation, isFollowSystemRotation, BOOL)
#undef JobsGKPhotoBrowserConfigureDSL
@end

@implementation GKPhotoBrowser (JobsDSL)
-(JobsRetGKPhotoBrowserByConfigureBlock _Nonnull)byConfigure{
    @jobs_weakify(self)
    return ^__kindof GKPhotoBrowser *_Nullable(jobsByGKPhotoBrowserConfigureBlock _Nullable data){
        @jobs_strongify(self)
        if (data) data(self.configure);
        return self;
    };
}
-(JobsRetGKPhotoBrowserByBOOLBlock _Nonnull)byStatusBarShow{
    @jobs_weakify(self)
    return ^__kindof GKPhotoBrowser *_Nullable(BOOL data){
        @jobs_strongify(self)
        [self setStatusBarShow:data];
        return self;
    };
}
-(JobsRetGKPhotoBrowserByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof GKPhotoBrowser *_Nullable(id<GKPhotoBrowserDelegate> _Nullable data){
        @jobs_strongify(self)
        self.delegate = data;
        return self;
    };
}
@end

@implementation GKPhoto (JobsDSL)
-(JobsRetGKPhotoByImageBlock _Nonnull)byImage{
    @jobs_weakify(self)
    return ^__kindof GKPhoto *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.image = data;
        return self;
    };
}
-(JobsRetGKPhotoByURLBlock _Nonnull)byUrl{
    @jobs_weakify(self)
    return ^__kindof GKPhoto *_Nullable(NSURL *_Nullable data){
        @jobs_strongify(self)
        self.url = data;
        return self;
    };
}
-(JobsRetGKPhotoByImageBlock _Nonnull)byPlaceholderImage{
    @jobs_weakify(self)
    return ^__kindof GKPhoto *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.placeholderImage = data;
        return self;
    };
}
@end

@implementation NSObject (GKPhotoBrowser)
#pragma mark —— 一些私有方法
NS_INLINE __kindof GKPhoto *_Nonnull jobsMakeGKPhoto(jobsByGKPhotoBlock _Nonnull block){
    GKPhoto *data = GKPhoto.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof GKPhotoBrowser *_Nonnull jobsMakeGKPhotoBrowserByPhotosArray(NSArray <GKPhoto *>*photosArray,
                                                                                NSInteger currentIndex,
                                                                                jobsByGKPhotoBrowserBlock block) {
    GKPhotoBrowser *photoBrowser = [GKPhotoBrowser photoBrowserWithPhotos:photosArray currentIndex:currentIndex];
    if (block) block(photoBrowser);
    return photoBrowser;
}

-(JobsRetGKPhotoBrowserByPhotosArrayAndCurrentIndexBlock _Nonnull)makeGKPhotoBrowser{
    return ^GKPhotoBrowser *_Nullable(__kindof NSArray <GKPhoto *>*_Nullable photosArray,
                                      NSInteger currentIndex){
        return [GKPhotoBrowser photoBrowserWithPhotos:photosArray currentIndex:currentIndex];
    };
}

-(jobsByGKPhotoBrowserBlock _Nonnull)configPhotoBrowser{
    return ^(GKPhotoBrowser *_Nonnull browser){
        browser
            .byConfigure(^(__kindof GKPhotoBrowserConfigure * _Nullable data) {
                data
                    .byShowStyle(GKPhotoBrowserShowStyleNone)
                    .byHideStyle(GKPhotoBrowserHideStyleZoomScale)
                    .byIsSingleTapDisabled(YES)
                    .byIsHideSourceView(NO)
                    .byIsFollowSystemRotation(!(UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPhone));
            })
            .byStatusBarShow(YES)
            .byDelegate(self);
    };
}
#pragma mark —— 一些公有方法
/// 针对数据源是UIImage  *的GKPhotoBrowser
-(GKPhotoBrowser *)tapImageWithIndexPath:(NSIndexPath *)indexPath
                         imageDataMutArr:(NSMutableArray <UIImage *>*)imageDataMutArr{
    @jobs_weakify(self)
    return jobsMakeGKPhotoBrowserByPhotosArray(jobsMakeMutArr(^(__kindof NSMutableArray <GKPhoto *>*_Nullable data) {
        [imageDataMutArr enumerateObjectsUsingBlock:^(UIImage * _Nonnull obj,
                                                      NSUInteger idx,
                                                      BOOL * _Nonnull stop) {
            data.add(jobsMakeGKPhoto(^(GKPhoto * _Nonnull photo) {
                photo
                    .byImage(obj)
                    .byPlaceholderImage(@"plliza_empy_placehoder".img);
            }));
        }];
    }),indexPath.row,^(GKPhotoBrowser *_Nonnull browser){
        @jobs_strongify(self)
        self.configPhotoBrowser(browser);
    });
}
/// 针对数据源是NSURL  *的GKPhotoBrowser
-(GKPhotoBrowser *)tapImageWithIndexPath:(NSIndexPath *)indexPath
                          imageUrlMutArr:(NSMutableArray <NSURL *>*)imageUrlMutArr{
    @jobs_weakify(self)
    return jobsMakeGKPhotoBrowserByPhotosArray(jobsMakeMutArr(^(__kindof NSMutableArray <GKPhoto *>*_Nullable data) {
        [imageUrlMutArr enumerateObjectsUsingBlock:^(NSURL * _Nonnull obj,
                                                     NSUInteger idx,
                                                     BOOL * _Nonnull stop) {
            data.add(jobsMakeGKPhoto(^(GKPhoto * _Nonnull photo) {
                photo
                    .byUrl(obj)
                    .byPlaceholderImage(@"plliza_empy_placehoder".img);
            }));
        }];
    }),indexPath.row,^(GKPhotoBrowser *_Nonnull browser){
        @jobs_strongify(self)
        self.configPhotoBrowser(browser);
    });
}
/// 针对数据源是NSString  *的GKPhotoBrowser
-(GKPhotoBrowser *)tapImageWithIndexPath:(NSIndexPath *)indexPath
                       imageUrlStrMutArr:(NSMutableArray <NSString *>*)imageUrlStrMutArr{
    @jobs_weakify(self)
    return jobsMakeGKPhotoBrowserByPhotosArray(jobsMakeMutArr(^(__kindof NSMutableArray <GKPhoto *>*_Nullable data) {
        [imageUrlStrMutArr enumerateObjectsUsingBlock:^(NSString * _Nonnull obj,
                                                        NSUInteger idx,
                                                        BOOL * _Nonnull stop) {
            data.add(jobsMakeGKPhoto(^(GKPhoto * _Nonnull photo) {
                photo
                    .byUrl(obj.jobsURL())
                    .byPlaceholderImage(@"plliza_empy_placehoder".img);
            }));
        }];
    }),indexPath.row,^(GKPhotoBrowser *_Nonnull browser){
        @jobs_strongify(self)
        self.configPhotoBrowser(browser);
    });
}
#pragma mark —— GKPhotoBrowserDelegate
/// 滚动到一半时索引改变
-(void)photoBrowser:(GKPhotoBrowser *)browser
    didChangedIndex:(NSInteger)index{
}
/// 选择photoView时回调
-(void)photoBrowser:(GKPhotoBrowser *)browser
   didSelectAtIndex:(NSInteger)index{
}
/// 单击事件
-(void)photoBrowser:(GKPhotoBrowser *)browser
 singleTapWithIndex:(NSInteger)index{
}
/// 双击事件
-(void)photoBrowser:(GKPhotoBrowser *)browser
 doubleTapWithIndex:(NSInteger)index{
    self.savePic(browser);
}
/// 长按事件
-(void)photoBrowser:(GKPhotoBrowser *)browser
 longPressWithIndex:(NSInteger)index{
    self.savePic(browser);
}
/// 旋转事件
-(void)photoBrowser:(GKPhotoBrowser *)browser
onDeciceChangedWithIndex:(NSInteger)index
        isLandscape:(BOOL)isLandscape{
}
/// 缩放事件
-(void)photoBrowser:(GKPhotoBrowser *)browser
 zoomEndedWithIndex:(NSInteger)index
          zoomScale:(CGFloat)scale{
}
/// photoView复用回调
-(void)photoBrowser:(GKPhotoBrowser *)browser
       reuseAtIndex:(NSInteger)index
          photoView:(GKPhotoView *)photoView{
}
/// 保存按钮点击事件
-(void)photoBrowser:(GKPhotoBrowser *)browser
     onSaveBtnClick:(NSInteger)index
              image:(UIImage *)image{
}
/// 上下滑动消失
/// 开始滑动时
-(void)photoBrowser:(GKPhotoBrowser *)browser
  panBeginWithIndex:(NSInteger)index{
}
/// 结束滑动时 disappear：是否消失
-(void)photoBrowser:(GKPhotoBrowser *)browser
  panEndedWithIndex:(NSInteger)index
      willDisappear:(BOOL)disappear{
}
/// 布局子视图
-(void)photoBrowser:(GKPhotoBrowser *)browser
 willLayoutSubViews:(NSInteger)index{
}
/// browser完全消失回调
-(void)photoBrowser:(GKPhotoBrowser *)browser
didDisappearAtIndex:(NSInteger)index{
}
/// browser自定义加载方式时回调
-(void)photoBrowser:(GKPhotoBrowser *)browser
   loadImageAtIndex:(NSInteger)index
           progress:(float)progress
      isOriginImage:(BOOL)isOriginImage{
}
/// browser加载失败自定义弹窗
-(void)photoBrowser:(GKPhotoBrowser *)browser
  loadFailedAtIndex:(NSInteger)index error:(NSError *)error{
}
/// 自定义单个图片的加载失败文字，优先级高于failureText
-(NSString *)photoBrowser:(GKPhotoBrowser *)browser
        failedTextAtIndex:(NSInteger)index{
    return @"图片加载失败".jobsTr();
}
/// 自定义单个图片的加载失败图片，优先级高于failureImage
-(UIImage *)photoBrowser:(GKPhotoBrowser *)browser
      failedImageAtIndex:(NSInteger)index{
    return @"".jobsTr().img;
}
/// 视频播放状态回调
-(void)photoBrowser:(GKPhotoBrowser *)browser
videoStateChangeWithPhotoView:(GKPhotoView *)photoView
             status:(GKVideoPlayerStatus)status{
}
/// 视频播放进度回调
-(void)photoBrowser:(GKPhotoBrowser *)browser
videoTimeChangeWithPhotoView:(GKPhotoView *)photoView
        currentTime:(NSTimeInterval)currentTime
          totalTime:(NSTimeInterval)totalTime{
}

@end

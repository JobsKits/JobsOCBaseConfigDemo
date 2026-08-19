//
//  UIViewController+JPImageresizerView.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_JPIMAGERESIZERVIEW_8984F53BA6

#if __has_include(<JPImageresizerView/JPImageresizerView.h>)
#import <JPImageresizerView/JPImageresizerView.h>
#else
#import "JPImageresizerView.h"
#endif

#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_JPIMAGERESIZERVIEW_8984F53BA6

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface JPImageresizerAppearance (JobsDSL)
-(JobsRetJPImageresizerAppearanceByCorBlock _Nonnull)byStrokeColor;
-(JobsRetJPImageresizerAppearanceByBlurEffectBlock _Nonnull)byBgEffect;
-(JobsRetJPImageresizerAppearanceByCorBlock _Nonnull)byBgColor;
-(JobsRetJPImageresizerAppearanceByCGFloatBlock _Nonnull)byMaskAlpha;
@end

@interface UIViewController (JPImageresizerView)

#pragma mark —— BaseVC+JPImageresizerView
Prop_strong()JPImageresizerConfigure *configure;
Prop_strong()JPImageresizerView *imageresizerView;
Prop_assign()JPImageresizerConfigureType configureType;
///一些资源文件
Prop_strong()NSData *JPImageresizerView_data;
Prop_strong()UIImage *JPImageresizerView_img;
Prop_strong()NSURL *JPImageresizerView_url;
Prop_strong()AVURLAsset *JPImageresizerView_avURLAsset;
///Block回调
Prop_copy()jobsByIDBlock makeBlock;
Prop_copy()jobsByIDBlock fixErrorBlock;
Prop_copy()jobsByIDBlock fixStartBlock;
Prop_copy()jobsByIDBlock fixProgressBlock;
Prop_copy()jobsByIDBlock fixCompleteBlock;

@end

NS_ASSUME_NONNULL_END

//-(void)tailor:(UIImage *)img{
//    self.configureType = JPImageresizerConfigureType_1;
//    self.JPImageresizerView_img = img;
//    //图片裁剪 方式方法_2
//    JobsLog(@"图片裁剪中...");
//    @jobs_weakify(self)
//    [self.imageresizerView cropPictureWithCompressScale:0.5// 压缩比例，大于等于1按原图尺寸裁剪，小于等于0则返回nil（例：compressScale = 0.5，1000 x 500 --> 500 x 250）
//                                               cacheURL:[FileFolderHandleTool cacheURL:@"png"]
//                                             errorBlock:^(NSURL *cacheURL,
//                                                          JPImageresizerErrorReason reason) {
////                    @jobs_strongify(self)
//        switch (reason) {
//            case JPIEReason_NilObject:
//                JobsLog(@"资源为空");
//                break;
//            case JPIEReason_CacheURLAlreadyExists:
//                JobsLog(@"缓存路径已存在其他文件");
//                break;
//            case JPIEReason_NoSupportedFileType:
//                JobsLog(@" 不支持的文件格式");
//                break;
//             case JPIEReason_VideoAlreadyDamage:
//                JobsLog(@"视频文件已损坏");
//                break;
//            case JPIEReason_VideoExportFailed:
//                JobsLog(@"视频导出失败");
//                break;
//            case JPIEReason_VideoExportCancelled:
//                JobsLog(@"视频导出取消");
//                break;
//    }
//
//    }
//                                         completeBlock :^(UIImage *finalImage,
//                                                           NSURL *cacheURL,
//                                                           BOOL isCacheSuccess) {
//        @jobs_strongify(self)
//        JobsLog(@"图片裁剪完成");
//        // 裁剪完成，finalImage为裁剪后的图片
//        if (!finalImage && !cacheURL) {
//            JobsLog(@"裁剪失败");
//            return;
//        }
//        //本地
//        [self.headerBtn setImage:finalImage
//                        forState:UIControlStateNormal];
//        //网络上传
//        [self netWorking_MKUserInfoUploadImagePOST:finalImage];
//    }];
//}
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_JPIMAGERESIZERVIEW_8984F53BA6 */

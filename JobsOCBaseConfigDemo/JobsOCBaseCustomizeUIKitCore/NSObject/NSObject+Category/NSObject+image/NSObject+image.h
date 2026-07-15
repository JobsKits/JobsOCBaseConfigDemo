//
//  NSObject+image.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_IMAGE_AFF8740488
#define JOBS_HEADER_GUARD_NSOBJECT_IMAGE_AFF8740488

#import <UIKit/UIKit.h>
#import "NSString+URL.h"
#import "UIImage+YBGIF.h"
#import "NSString+Check.h"
#import "NSString+Sys.h"
#import "JobsStringUtilsHeader.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (image)
/// 获取本地普通图像
Prop_strong(readonly,nullable)UIImage *img;    // -(nullable UIImage *)img;
/// 获取本地GIF图像
Prop_strong(readonly,nullable)UIImage *gif_img;// -(nullable UIImage *)gif_img;
/// 获取系统内置图像
Prop_strong(readonly,nullable)UIImage *sys_img;// -(nullable UIImage *)sys_img;
/// 获取网络图像
-(void)fetchImageByPlaceholder:(UIImage *)placeholder
                    completion:(jobsByImageBlock _Nullable)completion;

-(JobsRetImageByStrBlock _Nonnull)imageByDataURL;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_IMAGE_AFF8740488 */

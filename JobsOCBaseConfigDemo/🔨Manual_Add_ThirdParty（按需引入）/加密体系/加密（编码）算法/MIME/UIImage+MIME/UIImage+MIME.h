//
//  UIImage+MIME.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIIMAGE_MIME_EFD86331F0
#define JOBS_HEADER_GUARD_UIIMAGE_MIME_EFD86331F0

#import <UIKit/UIKit.h>
#import "NSData+MIME.h"

#import "JobsByOCPods.h"

#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (MIME)
#pragma mark —— MIME编码的数据 <==> UIImage对象
///【类方法】以MIME编码的数据 转换成 UIImage对象
+(JobsRetImageByStrBlock _Nonnull)imageByMIMEString;
///【实例方法】以MIME编码的数据 转换成 UIImage对象
-(JobsRetImageByStrBlock _Nonnull)imageByMIMEString;
///【类方法】UIImage对象 转换成 以MIME编码的数据
+(JobsRetStrByImageBlock _Nonnull)MIMEStringByImage;
///【实例方法】UIImage对象 转换成 以MIME编码的数据
-(NSString *_Nullable)MIMEStr;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIIMAGE_MIME_EFD86331F0 */

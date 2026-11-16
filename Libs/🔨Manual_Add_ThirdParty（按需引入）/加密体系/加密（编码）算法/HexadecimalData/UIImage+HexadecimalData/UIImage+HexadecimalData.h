//
//  UIImage+HexadecimalData.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIIMAGE_HEXADECIMALDATA_9C30C15C85
#define JOBS_HEADER_GUARD_UIIMAGE_HEXADECIMALDATA_9C30C15C85

#import <UIKit/UIKit.h>

#import "JobsByOCPods.h"

#import "JobsMakes.h"

#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (HexadecimalData)
#pragma mark —— UIImage对象 ==> 16进制字符串
///【类方法】UIImage对象 转换为 16进制字符串
+(JobsRetStrByImageBlock _Nonnull)hexStringByImage;
///【实例方法】UIImage对象 转换为 16进制字符串
-(NSString *_Nullable)hexStr;
#pragma mark —— 16进制字符串 ==> UIImage对象
///【类方法】16进制字符串 转换为 UIImage对象
+(JobsRetImageByStrBlock _Nonnull)imageByHexString;
///【实例方法】16进制字符串 转换为 UIImage对象
-(UIImage *_Nullable)imageByHexString:(NSString *_Nonnull)hexString;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIIMAGE_HEXADECIMALDATA_9C30C15C85 */

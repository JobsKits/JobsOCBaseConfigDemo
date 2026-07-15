//
//  PicToStrStoreSubVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "NSObject+HXPhotoPicker.h"
#import "JobsLanMgr.h"
#import "JobsLoadingImageHeader.h"
#import "JobsBaseUI.h"
#import "JobsMakes.h"
#import "JobsByOCPods.h"
#import "JobsBlock.h"
#import "JobsDefines.h"
#import "UIImage+HexadecimalData.h"
#import "NSString+HexadecimalData.h"
#import "UIImage+Base16.h"
#import "NSString+Base16.h"
#import "UIImage+Base32.h"
#import "NSString+Base32.h"
#import "UIImage+Base64.h"
#import "NSString+Base64.h"
#import "UIImage+Base85.h"
#import "NSString+Base85.h"
#import "UIImage+MIME.h"
#import "NSString+MIME.h"

#ifndef PIC_TO_STR_STYLE_ENUM_DEFINED
#define PIC_TO_STR_STYLE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, PicToStrStyle) {
    PicToStrStyle_Hexadecimal = 0,/// 图片 转 十六进制
    PicToStrStyle_Base16,/// 图片 转 Base16字符编码
    PicToStrStyle_Base32,/// 图片 转 Base32字符编码
    PicToStrStyle_Base64,/// 图片 转 Base64字符编码
    PicToStrStyle_Base85,/// 图片 转 Base85字符编码
    PicToStrStyle_MIME,/// 图片 转 MIME
};
#endif /* PIC_TO_STR_STYLE_ENUM_DEFINED */

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface PicToStrStoreSubVC : BaseViewController

@end

NS_ASSUME_NONNULL_END

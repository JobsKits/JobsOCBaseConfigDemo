//
//  PicToStrStoreSubVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "NSObject+HXPhotoPicker.h"

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsLoadingImage/JobsLoadingImageHeader.h>)
#import <JobsLoadingImage/JobsLoadingImageHeader.h>
#else
#import "JobsLoadingImageHeader.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface PicToStrStoreSubVC : BaseViewController

@end

NS_ASSUME_NONNULL_END

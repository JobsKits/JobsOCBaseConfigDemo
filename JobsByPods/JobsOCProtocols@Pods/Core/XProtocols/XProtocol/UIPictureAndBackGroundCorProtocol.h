//
//  UIPictureAndBackGroundCorProtocol.h
//  JobsOCProtocols
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIPICTUREANDBACKGROUNDCORPROTOCOL_AE16F71882
#define JOBS_HEADER_GUARD_UIPICTUREANDBACKGROUNDCORPROTOCOL_AE16F71882

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@protocol UIPictureAndBackGroundCorProtocol <NSObject>
@optional
#pragma mark —— 图片和背景颜色
/// 关于导航栏的
Prop_strong(nullable)UIImage *navBgImage;
Prop_strong(nullable)UIColor *navBgCor;
/// 未选中状态
Prop_strong(nullable)UIImage *image;//【未选中状态】图片
Prop_strong(nullable)UIImage *bgImage;//【未选中状态】背景图片
Prop_copy(nullable)NSString *imageURLString;//【未选中状态】图片URL(字符串形式)
Prop_copy(nullable)NSString *bgImageURLString;//【未选中状态】背景图片URL(字符串形式)
Prop_strong(nullable)UIColor *bgCor;//【未选中状态】背景颜色
Prop_strong(nullable)UIImage *backBtnIMG;//【未选中状态】返回按钮的图标
Prop_strong(nullable)UIBackgroundConfiguration *bgConfig API_AVAILABLE(ios(14.0), tvos(14.0), watchos(7.0));
/// 选中状态
Prop_strong(nullable)UIImage *selectedImage_;//【选中状态】图片
Prop_strong(nullable)UIImage *bgSelectedImage;//【选中状态】背景图片
Prop_copy(nullable)NSString *selectedImageURLString;//【选中状态】图片URL(字符串形式)
Prop_copy(nullable)NSString *bgSelectedImageURLString;//【选中状态】背景图片URL(字符串形式)
Prop_strong(nullable)UIColor *bgSelectedCor;//【选中状态】背景颜色
Prop_strong(nullable)UIImage *backBtnSelectedIMG;//【选中状态】返回按钮的图标
Prop_strong(nullable)UIBackgroundConfiguration *bgSelectedConfig API_AVAILABLE(ios(14.0), tvos(14.0), watchos(7.0));
/// UI 控件
Prop_strong(nullable)UIImageView *bgImageView;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIPICTUREANDBACKGROUNDCORPROTOCOL_AE16F71882 */

//
//  UIImageView+RAC.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIIMAGEVIEW_RAC_B870A94458
#define JOBS_HEADER_GUARD_UIIMAGEVIEW_RAC_B870A94458

#import <UIKit/UIKit.h>

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (RAC)
/// RAC 监听UIImageView.image属性的变化：当输入值的时候，进行网络请求发送图片文件
-(void)uploadImageBlock:(jobsByImageBlock _Nullable)uploadImageBlock
          nilImageBlock:(jobsByVoidBlock _Nullable)nilImageBlock;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIIMAGEVIEW_RAC_B870A94458 */

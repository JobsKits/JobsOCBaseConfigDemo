//
//  NSObject+WHToast.h
//  WHToastExtra
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_WHTOAST_A8B4616A59
#define JOBS_HEADER_GUARD_NSOBJECT_WHTOAST_A8B4616A59

#import <Foundation/Foundation.h>

#if __has_include(<WHToast/WHToast.h>)
#import <WHToast/WHToast.h>
#else
#import "WHToast.h"
#endif

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
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

NS_ASSUME_NONNULL_BEGIN
/// 提示
@interface NSObject (WHToast)
#pragma mark —— 仅文字，展示在屏幕中间
+(jobsByStrBlock _Nonnull)jobsToastMsg;
-(jobsByStrBlock _Nonnull)jobsToastMsg;
#pragma mark —— 成功图标和文字，展示在屏幕中间
+(jobsByStrBlock _Nonnull)jobsToastSuccessMsg;
-(jobsByStrBlock _Nonnull)jobsToastSuccessMsg;
#pragma mark —— 失败图标和文字，展示在屏幕中间
+(jobsByStrBlock _Nonnull)jobsToastErrMsg;
-(jobsByStrBlock _Nonnull)jobsToastErrMsg;
#pragma mark —— 延时操作
+(jobsByStrBlock _Nonnull)jobsToastLoadingMsg;
-(jobsByStrBlock _Nonnull)jobsToastLoadingMsg;
#pragma mark —— 手动关闭WHToast，在主线程
+(jobsByVoidBlock _Nonnull)jobsToastHide;
-(jobsByVoidBlock _Nonnull)jobsToastHide;

@end

NS_ASSUME_NONNULL_END
#pragma mark —— 弹出提示
NS_INLINE void toastBy(NSString *_Nullable msg){
    if(!msg || ![msg isKindOfClass:NSString.class]){
        msg = @"数据错误".jobsTr();
    }NSObject.jobsToastMsg(msg);
}

NS_INLINE void toastErr(NSString *_Nullable msg){
    if(!msg || ![msg isKindOfClass:NSString.class]){
        msg = @"数据错误".jobsTr();
    }NSObject.jobsToastErrMsg(msg);
}
#endif /* JOBS_HEADER_GUARD_NSOBJECT_WHTOAST_A8B4616A59 */

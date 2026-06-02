//
//  TKPermissionPublic.h
//  TKPermissionKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
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

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_10_0
typedef UNAuthorizationOptions TKPermissionUNAuthorizationOptions;
#else
typedef UIUserNotificationType TKPermissionUNAuthorizationOptions;
#endif

NS_ASSUME_NONNULL_BEGIN

@interface TKPermissionPublic : NSObject
/// 自定义未授权时，权限提示信息block，如果该属性存在则alertTitleXXX相关方法不执行。
Prop_copy(nullable)TKPermissionCustomMsgBlock blockCustomMsg;

+(instancetype)shared;
/// 包装UIAlertController, 具有两个按钮
/// @param title  标题
/// @param msg  内容
/// @param leftTitle 左边按钮文字
/// @param rightTitle 右边按钮文字
+(void)alertTitle:(NSString *)title
              msg:(NSString *)msg
        leftTitle:(NSString *)leftTitle
       rightTitle:(NSString *)rightTitle;
/// 包装UIAlertController,只有一个按钮
/// @param title 标题
/// @param msg 内容
/// @param actionTitle  按钮文字
+(void)alertActionTitle:(NSString *)title 
                    msg:(NSString *)msg
            actionTitle:(NSString *)actionTitle;
/// 权限提示alert，两个按钮
+(void)alertPromptTips:(NSString *)msg;
/// 简单弹窗，一个按钮
+(void)alertTips:(NSString *)msg;

@end

NS_ASSUME_NONNULL_END

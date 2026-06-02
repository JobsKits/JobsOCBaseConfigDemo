//
//  NSObject+SYSAlertController.h
//  SYSAlertControllerExtra
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_SYSALERTCONTROLLER_03BAD88877
#define JOBS_HEADER_GUARD_NSOBJECT_SYSALERTCONTROLLER_03BAD88877

#import <UIKit/UIKit.h>
#import <SYSAlertControllerExtra/NSMutableArray+Extra.h>

#if __has_include(<WHToast/WHToast.h>)
#import <WHToast/WHToast.h>
#else
#import "WHToast.h"
#endif

#if __has_include(<ReactiveObjC/RACmetamacros.h>)
#import <ReactiveObjC/RACmetamacros.h>
#else
#import "RACmetamacros.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTScope.h>)
#import <ReactiveObjC/RACEXTScope.h>
#else
#import "RACEXTScope.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTKeyPathCoding.h>)
#import <ReactiveObjC/RACEXTKeyPathCoding.h>
#else
#import "RACEXTKeyPathCoding.h"
#endif

//#if __has_include(<ReactiveObjC/RACEXTRuntimeExtensions.h>)
//#import <ReactiveObjC/RACEXTRuntimeExtensions.h>
//#else
//#import "RACEXTRuntimeExtensions.h"
//#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<WHToastExtra/WHToastExtra.h>)
#import <WHToastExtra/WHToastExtra.h>
#else
#import "WHToastExtra.h"
#endif

#if __has_include(<JobsOCRuntimeKits/JobsOCRuntimeKits.h>)
#import <JobsOCRuntimeKits/JobsOCRuntimeKits.h>
#else
#import "JobsOCRuntimeKits.h"
#endif

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
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
/**
 * 使用说明
 *  btnTitleArr（按钮标题） 和 alertBtnAction（按钮触发的方法），原则上一一对应，可以接受null，如果没有实质性的触发（仅仅希望点击以后使弹框消失，可以传空 @[@""]，从而调用defaultFunc进行占位，否则引发野指针错误）

 isSeparateStyle 的含义
 在一般的模式（呈现在屏幕正中央） ：如果为YES 那么有实质性进展的键位在右侧，否则在左侧
 在sheet模式：是否分组显示（标题 + 副标题）（取消）
 
 *  targetVC，你不能要求每一个触发的点都是VC，也可以是View，所以将上个版本的集成在VC里面的弹框摘出来，但是推弹框出现需要调用系统方法presentViewController，所以这里必须手动传一个标的VC
 *  message、title 你不想要就传nil，传@"".tr 系统会为你留位置,从而造成界面问题（空一坨出来）
 *  showLoginAlertViewWithTargetVC 是一种登录样式
 */
NS_ASSUME_NONNULL_BEGIN

@interface NSObject (SYSAlertController)
/// 屏幕正中央的Alert
/// @param config 配置文件
/// @param alertVCBlock 返回这个UIAlertController *
/// @param completionBlock 结束完成以后的block
+(void)showSYSAlertViewConfig:(nonnull SYSAlertControllerConfig *)config
                 alertVCBlock:(nullable jobsByIDBlock)alertVCBlock
              completionBlock:(nullable jobsByVoidBlock)completionBlock;
/// 屏幕下部出现的Alert
/// @param config 配置文件
/// @param alertVCBlock 返回这个UIAlertController *
/// @param completionBlock 结束完成以后的block
+(void)showSYSActionSheetConfig:(nonnull SYSAlertControllerConfig *)config
                   alertVCBlock:(nullable jobsByIDBlock)alertVCBlock
                completionBlock:(nullable jobsByVoidBlock)completionBlock;

+(void)showLoginAlertViewWithTargetVC:(UIViewController *)targetVC;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_SYSALERTCONTROLLER_03BAD88877 */

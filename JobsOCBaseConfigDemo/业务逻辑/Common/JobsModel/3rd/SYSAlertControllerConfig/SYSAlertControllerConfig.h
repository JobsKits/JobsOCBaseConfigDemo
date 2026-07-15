//
//  SYSAlertControllerConfig.h
//  SYSAlertControllerExtra
//
//  Created by Jobs on 2026年5月13日，星期三.
//
#ifndef SYSAlertControllerConfig_h
#define SYSAlertControllerConfig_h

#import <Foundation/Foundation.h>
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

/// 配置文件
@interface SYSAlertControllerConfig : NSObject

Prop_strong(nullable)NSString *title;// 标题，没有可传nil，如果传空字符@“”会多处一行空白
Prop_strong(nullable)NSString *message;// 副标题，没有可传nil，如果传空字符@“”会多处一行空白
Prop_assign()BOOL isSeparateStyle;// 如果为YES 那么有实质性进展的键位在右侧，否则在左侧
Prop_strong(nullable)UIViewController *targetVC;// 作用域,alertBtnActionArr在targetVC的m文件去找对应的方法，没有则向外抛出崩溃
Prop_strong(nullable)id funcInWhere;// // 执行方法的位置，它可以是VC、view、也可以是任意NSObject子类。当不传值的时候 funcInWhere == targetVC
Prop_assign()BOOL animated; // 是否开启动画效果
Prop_strong(nullable)UIControl *sender;
// 核心参数
Prop_strong(nullable)NSArray <NSString*>*btnTitleArr;// 按钮名称的数组
Prop_strong(nullable)NSArray <NSString*>*alertBtnActionArr;// 与btnTitleArr相对的按钮的触发事件，如果带形参，则只写方法名，形参的传递在具体的调用类里面实现。取消方法直接传@“”，方法内部做默认处理
Prop_copy(nullable)NSArray *parametersArr;// @【所有的参数形成数据束，一个方法对应一个数据束的形式，包装成方法的第一个参数】

@end

NS_ASSUME_NONNULL_END
/**

    使用示例
    {

     SYSAlertControllerConfig *config = SYSAlertControllerConfig.new;
     config.title = @"是否取消对其关注？";
     config.isSeparateStyle = NO;
     config.btnTitleArr = @[@"确定",@"取消"];
     config.alertBtnActionArr = @[@"unfollow:",@"".tr];
     config.parametersArr = @[@{@"btn":btn,
                                @"plazaCommunityListModel":plazaCommunityListModel},@"".tr];
     config.targetVC = NSObject.getCurrentViewController;
     config.funcInWhere = self;
     config.animated = YES;

     [NSObject showSYSAlertViewConfig:config
                         alertVCBlock:nil
                      completionBlock:nil];
     }

     {

     SYSAlertControllerConfig *config = SYSAlertControllerConfig.new;
     config.isSeparateStyle = YES;
     config.btnTitleArr = @[@"保存图片",@"取消"];
     config.alertBtnActionArr = @[@"savePic",@"".tr];
     config.targetVC = self.saveImageModel.photoBrowser;
     config.funcInWhere = self;
     config.animated = YES;

     [NSObject showSYSActionSheetConfig:config
                           alertVCBlock:nil
                        completionBlock:nil];
     }
 **/

#endif /* SYSAlertControllerConfig_h */

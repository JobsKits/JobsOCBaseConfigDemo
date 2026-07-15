//
//  UIWindow+JobsAppTools.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "JobsByOCPods.h"
#import "JobsAppToolsHeader.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIWindow (JobsAppTools)
/// 横屏模式下的Window（宽高互换）
-(__kindof UIWindow *)landscape;

@end

NS_ASSUME_NONNULL_END

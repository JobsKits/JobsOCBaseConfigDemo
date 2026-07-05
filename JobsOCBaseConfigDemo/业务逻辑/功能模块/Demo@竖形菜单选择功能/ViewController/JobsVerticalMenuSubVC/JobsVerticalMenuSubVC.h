//
//  JobsVerticalMenuSubVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#import "JobsByOCPods.h"

#import "JobsOCDSL.h"

#import "JobsBaseUI.h"

#import "JobsDefines.h"

#import "JobsVerticalMenuSubView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsVerticalMenuSubVC : BaseViewController
/// 对应左侧栏目下标
Prop_assign()NSUInteger contentIndex;

@end

NS_ASSUME_NONNULL_END

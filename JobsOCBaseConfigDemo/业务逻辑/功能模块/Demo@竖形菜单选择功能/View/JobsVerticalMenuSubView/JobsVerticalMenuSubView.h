//
//  JobsVerticalMenuSubView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

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

#import "GoodsClassModel.h"
#import "ThreeClassCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsVerticalMenuSubView : BaseView
/// 按左侧栏目下标刷新右侧内容
-(jobsByNSUIntegerBlock _Nonnull)reloadContentByIndex;

@end

NS_ASSUME_NONNULL_END

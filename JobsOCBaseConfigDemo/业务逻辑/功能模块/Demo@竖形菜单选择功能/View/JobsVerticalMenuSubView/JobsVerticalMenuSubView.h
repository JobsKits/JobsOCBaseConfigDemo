//
//  JobsVerticalMenuSubView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "JobsByOCPods.h"
#import "JobsBlock.h"
#import "GoodsClassModel.h"
#import "NSMutableArray+Extra.h"
#import "ThreeClassCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsVerticalMenuSubView : BaseView
/// 按左侧栏目下标刷新右侧内容
-(jobsByNSUIntegerBlock _Nonnull)reloadContentByIndex;

@end

NS_ASSUME_NONNULL_END

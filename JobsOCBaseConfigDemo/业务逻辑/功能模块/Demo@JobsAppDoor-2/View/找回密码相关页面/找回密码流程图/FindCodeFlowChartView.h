//
//  FindCodeFlowChartView.h
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

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
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

@interface FlowChartSingleElementView : BaseView

Prop_strong()UIImageView *bacKIMGV;
Prop_strong()UILabel *titleLab;
Prop_strong()UILabel *subTitleLab;

@end

@interface FindCodeFlowChartView : BaseView
///一共几个流程节点
Prop_assign()NSInteger flowNum;
///当前流程序号 从0开始
Prop_assign()NSInteger currentFlowSerialNum;
Prop_strong()NSMutableArray <NSString *>*titleMutArr;
Prop_strong()NSMutableArray <NSString *>*subTitleMutArr;
Prop_strong()NSMutableArray <UIImage *>*backImageMutArr;

@end

NS_ASSUME_NONNULL_END

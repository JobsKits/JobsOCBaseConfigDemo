//
//  JobsOCSearcherView.h
//  JobsOCSearcher
//
//  Created by Jobs on 2026年7月5日，星期日.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCSEARCHVIEW_D42C6F7846

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#define JOBS_HEADER_GUARD_JOBSOCSEARCHVIEW_D42C6F7846

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#if __has_include(<JobsOCSearcher/JobsOCSearcherConfig.h>)
#import "JobsOCSearcherConfig.h"
#else
#import "JobsOCSearcherConfig.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCSearcherView : UIView
<
UITableViewDelegate,
UITableViewDataSource,
UITextFieldDelegate
>

Prop_strong(readonly)UITextField *textField;
Prop_strong(readonly)JobsOCSearcherConfig *config;
Prop_copy(readonly)NSArray <NSString *>*historySearches;

-(JobsRetJobsOCSearcherViewByConfigBlock _Nonnull)byConfig;
-(instancetype)initWithConfig:(JobsOCSearcherConfig *_Nullable)config;
/// 链式配置搜索推荐词元；传 nil / 空数组时隐藏搜索推荐模块。
-(JobsRetJobsOCSearcherViewByNSArrayNSStringBlock _Nonnull)byRecommendSearches;
-(jobsByJobsOCSearcherConfigBlock _Nonnull)reloadWithConfig;
-(jobsByVoidBlock _Nonnull)reloadHistorySearches;
-(jobsByStrBlock _Nonnull)saveHistoryByText;
-(jobsByStrBlock _Nonnull)deleteHistoryByText;
-(void)clearHistory;
-(jobsByVoidBlock _Nonnull)jobsClearHistory;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCSearcherView
-(JobsRetJobsOCSearcherViewByMASConstraintBlock _Nonnull)byRecommendSectionHeightConstraint;
-(JobsRetJobsOCSearcherViewByMASConstraintBlock _Nonnull)bySearchButtonLeftConstraint;
-(JobsRetJobsOCSearcherViewByMASConstraintBlock _Nonnull)bySearchButtonWidthConstraint;
-(JobsRetJobsOCSearcherViewByNSArrayNSStringBlock _Nonnull)byHistorySearches;
-(JobsRetJobsOCSearcherViewByNSArrayUIButtonBlock _Nonnull)byRecommendButtonArr;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCSearcherView
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSOCSEARCHVIEW_D42C6F7846 */

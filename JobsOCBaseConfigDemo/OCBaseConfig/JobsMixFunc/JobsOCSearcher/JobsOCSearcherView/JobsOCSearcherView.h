//
//  JobsOCSearcherView.h
//  JobsOCSearcher
//
//  Created by Jobs on 2026年7月5日，星期日.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCSEARCHVIEW_D42C6F7846
#define JOBS_HEADER_GUARD_JOBSOCSEARCHVIEW_D42C6F7846

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCSearcher/JobsOCSearcherConfig.h>)
#import "JobsOCSearcherConfig.h"
#else
#import "JobsOCSearcherConfig.h"
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

-(instancetype)initWithConfig:(JobsOCSearcherConfig *_Nullable)config;
/// 链式配置搜索推荐词元；传 nil / 空数组时隐藏搜索推荐模块。
-(__kindof JobsOCSearcherView *_Nullable(^)(NSArray <NSString *>*_Nullable recommendSearches))byRecommendSearches;
-(void)reloadWithConfig:(JobsOCSearcherConfig *_Nullable)config;
-(void)reloadHistorySearches;
-(void)saveHistoryByText:(NSString *_Nullable)text;
-(void)deleteHistoryByText:(NSString *_Nullable)text;
-(void)clearHistory;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSOCSEARCHVIEW_D42C6F7846 */

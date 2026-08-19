//
//  JobsOCSearcherConfig.h
//  JobsOCSearcher
//
//  Created by Jobs on 2026年7月5日，星期日.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCSEARCHCONFIG_3F1F3D6545
#define JOBS_HEADER_GUARD_JOBSOCSEARCHCONFIG_3F1F3D6545

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import "JobsBlock.h"
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import "JobsDefines.h"
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCSearcherConfig : NSObject

Prop_copy()NSString *placeholder;
Prop_copy()NSString *searchButtonTitle;
Prop_copy()NSString *recommendTitle;
Prop_copy()NSString *historyTitle;
Prop_copy()NSString *historyStorageKey;
Prop_assign()NSUInteger maxHistoryCount;
Prop_assign()BOOL dismissKeyboardWhenCancel;
Prop_copy(nullable)jobsByStrBlock searchTextDidChangeBlock;
Prop_copy(nullable)jobsByStrBlock searchConfirmBlock;
Prop_copy(nullable)jobsByStrBlock itemSelectedBlock;
Prop_copy(nullable)jobsByStrBlock historyDeleteBlock;
Prop_copy(nullable)jobsByArrBlock historyChangedBlock;
Prop_copy(nullable)jobsByVoidBlock cancelBlock;
Prop_copy(nullable)jobsByVoidBlock clearHistoryBlock;

+(JobsRetJobsOCSearcherConfigByVoidBlock _Nonnull)defaultConfig;
-(JobsRetJobsOCSearcherConfigByStrBlock _Nonnull)byPlaceholder;
-(JobsRetJobsOCSearcherConfigByStrBlock _Nonnull)bySearchButtonTitle;
-(JobsRetJobsOCSearcherConfigByStrBlock _Nonnull)byRecommendTitle;
-(JobsRetJobsOCSearcherConfigByStrBlock _Nonnull)byHistoryTitle;
-(JobsRetJobsOCSearcherConfigByStrBlock _Nonnull)byHistoryStorageKey;
-(JobsRetJobsOCSearcherConfigByNSUIntegerBlock _Nonnull)byMaxHistoryCount;
-(JobsRetJobsOCSearcherConfigByBOOLBlock _Nonnull)byDismissKeyboardWhenCancel;
-(JobsRetJobsOCSearcherConfigByJobsByStrBlock _Nonnull)bySearchTextDidChangeBlock;
-(JobsRetJobsOCSearcherConfigByJobsByStrBlock _Nonnull)bySearchConfirmBlock;
-(JobsRetJobsOCSearcherConfigByJobsByStrBlock _Nonnull)byItemSelectedBlock;
-(JobsRetJobsOCSearcherConfigByJobsByStrBlock _Nonnull)byHistoryDeleteBlock;
-(JobsRetJobsOCSearcherConfigByJobsByArrBlock _Nonnull)byHistoryChangedBlock;
-(JobsRetJobsOCSearcherConfigByJobsByVoidBlock _Nonnull)byCancelBlock;
-(JobsRetJobsOCSearcherConfigByJobsByVoidBlock _Nonnull)byClearHistoryBlock;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSOCSEARCHCONFIG_3F1F3D6545 */

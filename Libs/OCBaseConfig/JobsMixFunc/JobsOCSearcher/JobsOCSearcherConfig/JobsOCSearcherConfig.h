//
//  JobsOCSearcherConfig.h
//  JobsOCSearcher
//
//  Created by Jobs on 2026年7月5日，星期日.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCSEARCHCONFIG_3F1F3D6545
#define JOBS_HEADER_GUARD_JOBSOCSEARCHCONFIG_3F1F3D6545

#import <UIKit/UIKit.h>

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
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

@interface JobsOCSearcherConfig : NSObject

/// UI copy accepts a localization key or an already translated string; rendering resolves the current global language.
Prop_copy(nullable)NSString *cancelButtonTitle;
Prop_copy(nullable)NSString *clearHistoryButtonTitle;
Prop_copy(nullable)NSString *deleteHistoryButtonTitle;
Prop_copy(nullable)NSString *emptyHistoryTitle;
Prop_copy(nullable)NSString *emptyHistoryMessage;
Prop_copy(nullable)NSString *emptyResultsTitle;
Prop_copy(nullable)NSString *emptyResultsMessage;
Prop_copy(nullable)NSString *clearQueryButtonTitle;
Prop_copy(nullable)NSString *historyScope;
Prop_copy(nullable)NSString *accessibilityIdentifierPrefix;
Prop_strong(nullable)UIColor *pageBackgroundColor;
Prop_strong(nullable)UIColor *inputBackgroundColor;
Prop_strong(nullable)UIColor *textColor;
Prop_strong(nullable)UIColor *secondaryTextColor;
Prop_strong(nullable)UIColor *accentColor;
Prop_strong(nullable)UIColor *separatorColor;
Prop_assign()BOOL inputOnly;
Prop_copy(nullable)jobsByStrBlock editingDidBeginBlock;
Prop_assign()BOOL showsCancelButton;
Prop_assign()BOOL showsSearchButton;
Prop_assign()BOOL persistsHistory;
Prop_strong(nullable)NSUserDefaults *historyDefaults;

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

-(JobsRetJobsOCSearcherConfigByStrBlock _Nonnull)byCancelButtonTitle;
-(JobsRetJobsOCSearcherConfigByStrBlock _Nonnull)byClearHistoryButtonTitle;
-(JobsRetJobsOCSearcherConfigByStrBlock _Nonnull)byDeleteHistoryButtonTitle;
-(JobsRetJobsOCSearcherConfigByStrBlock _Nonnull)byEmptyHistoryTitle;
-(JobsRetJobsOCSearcherConfigByStrBlock _Nonnull)byEmptyHistoryMessage;
-(JobsRetJobsOCSearcherConfigByStrBlock _Nonnull)byEmptyResultsTitle;
-(JobsRetJobsOCSearcherConfigByStrBlock _Nonnull)byEmptyResultsMessage;
-(JobsRetJobsOCSearcherConfigByStrBlock _Nonnull)byClearQueryButtonTitle;
-(JobsRetJobsOCSearcherConfigByStrBlock _Nonnull)byHistoryScope;
-(JobsRetJobsOCSearcherConfigByStrBlock _Nonnull)byAccessibilityIdentifierPrefix;
-(JobsRetJobsOCSearcherConfigByCorBlock _Nonnull)byPageBackgroundColor;
-(JobsRetJobsOCSearcherConfigByCorBlock _Nonnull)byInputBackgroundColor;
-(JobsRetJobsOCSearcherConfigByCorBlock _Nonnull)byTextColor;
-(JobsRetJobsOCSearcherConfigByCorBlock _Nonnull)bySecondaryTextColor;
-(JobsRetJobsOCSearcherConfigByCorBlock _Nonnull)byAccentColor;
-(JobsRetJobsOCSearcherConfigByCorBlock _Nonnull)bySeparatorColor;
-(JobsRetJobsOCSearcherConfigByBOOLBlock _Nonnull)byInputOnly;
-(JobsRetJobsOCSearcherConfigByJobsByStrBlock _Nonnull)byEditingDidBeginBlock;
-(JobsRetJobsOCSearcherConfigByBOOLBlock _Nonnull)byShowsCancelButton;
-(JobsRetJobsOCSearcherConfigByBOOLBlock _Nonnull)byShowsSearchButton;
-(JobsRetJobsOCSearcherConfigByBOOLBlock _Nonnull)byPersistsHistory;
-(JobsRetJobsOCSearcherConfigByNSUserDefaultsBlock _Nonnull)byHistoryDefaults;

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

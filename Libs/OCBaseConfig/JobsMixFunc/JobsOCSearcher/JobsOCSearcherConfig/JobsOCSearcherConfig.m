//
//  JobsOCSearcherConfig.m
//  JobsOCSearcher
//
//  Created by Jobs on 2026年7月5日，星期日.
//

#import "JobsOCSearcherConfig.h"

@implementation JobsOCSearcherConfig

-(instancetype)init{
    if (self = [super init]) {
        _showsSearchButton = YES;
        _persistsHistory = YES;
        _dismissKeyboardWhenCancel = YES;
        _maxHistoryCount = 20;
    }
    return self;
}

+(JobsRetJobsOCSearcherConfigByVoidBlock _Nonnull)defaultConfig{
    return ^JobsOCSearcherConfig *{
        return JobsOCSearcherConfig.new
            .byPlaceholder(@"请输入搜索内容")
            .bySearchButtonTitle(@"搜索")
            .byRecommendTitle(@"搜索推荐")
            .byHistoryTitle(@"搜索历史")
            .byHistoryStorageKey(@"JobsOCSearcherHistoryData")
            .byCancelButtonTitle(@"取消")
            .byClearHistoryButtonTitle(@"清空")
            .byDeleteHistoryButtonTitle(@"删除")
            .byEmptyHistoryTitle(@"暂无搜索历史")
            .byEmptyHistoryMessage(@"输入关键词开始搜索。")
            .byEmptyResultsTitle(@"没有匹配结果")
            .byEmptyResultsMessage(@"试试其他关键词，或清空后查看搜索历史。")
            .byClearQueryButtonTitle(@"清空关键词")
            .byShowsCancelButton(NO)
            .byShowsSearchButton(YES)
            .byPersistsHistory(YES)
            .byMaxHistoryCount(20)
            .byDismissKeyboardWhenCancel(YES);
    };
}

#define JobsOCSearcherConfigObjectDSL(_type_, _name_, _property_, _dataType_) \
-(JobsRetJobsOCSearcherConfigBy##_type_##Block _Nonnull)by##_name_{ \
    @jobs_weakify(self) \
    return ^__kindof JobsOCSearcherConfig *_Nullable(_dataType_ data){ \
        @jobs_strongify(self) \
        self._property_ = data; \
        return self; \
    }; \
}

JobsOCSearcherConfigObjectDSL(Str, Placeholder, placeholder, NSString *_Nullable)
JobsOCSearcherConfigObjectDSL(Str, SearchButtonTitle, searchButtonTitle, NSString *_Nullable)
JobsOCSearcherConfigObjectDSL(Str, RecommendTitle, recommendTitle, NSString *_Nullable)
JobsOCSearcherConfigObjectDSL(Str, HistoryTitle, historyTitle, NSString *_Nullable)
JobsOCSearcherConfigObjectDSL(Str, HistoryStorageKey, historyStorageKey, NSString *_Nullable)
JobsOCSearcherConfigObjectDSL(JobsByStr, SearchTextDidChangeBlock, searchTextDidChangeBlock, jobsByStrBlock _Nullable)
JobsOCSearcherConfigObjectDSL(JobsByStr, SearchConfirmBlock, searchConfirmBlock, jobsByStrBlock _Nullable)
JobsOCSearcherConfigObjectDSL(JobsByStr, ItemSelectedBlock, itemSelectedBlock, jobsByStrBlock _Nullable)
JobsOCSearcherConfigObjectDSL(JobsByStr, HistoryDeleteBlock, historyDeleteBlock, jobsByStrBlock _Nullable)
JobsOCSearcherConfigObjectDSL(JobsByArr, HistoryChangedBlock, historyChangedBlock, jobsByArrBlock _Nullable)
JobsOCSearcherConfigObjectDSL(JobsByVoid, CancelBlock, cancelBlock, jobsByVoidBlock _Nullable)
JobsOCSearcherConfigObjectDSL(JobsByVoid, ClearHistoryBlock, clearHistoryBlock, jobsByVoidBlock _Nullable)

JobsOCSearcherConfigObjectDSL(Str, CancelButtonTitle, cancelButtonTitle, NSString *_Nullable)
JobsOCSearcherConfigObjectDSL(Str, ClearHistoryButtonTitle, clearHistoryButtonTitle, NSString *_Nullable)
JobsOCSearcherConfigObjectDSL(Str, DeleteHistoryButtonTitle, deleteHistoryButtonTitle, NSString *_Nullable)
JobsOCSearcherConfigObjectDSL(Str, EmptyHistoryTitle, emptyHistoryTitle, NSString *_Nullable)
JobsOCSearcherConfigObjectDSL(Str, EmptyHistoryMessage, emptyHistoryMessage, NSString *_Nullable)
JobsOCSearcherConfigObjectDSL(Str, EmptyResultsTitle, emptyResultsTitle, NSString *_Nullable)
JobsOCSearcherConfigObjectDSL(Str, EmptyResultsMessage, emptyResultsMessage, NSString *_Nullable)
JobsOCSearcherConfigObjectDSL(Str, ClearQueryButtonTitle, clearQueryButtonTitle, NSString *_Nullable)
JobsOCSearcherConfigObjectDSL(Str, HistoryScope, historyScope, NSString *_Nullable)
JobsOCSearcherConfigObjectDSL(Str, AccessibilityIdentifierPrefix, accessibilityIdentifierPrefix, NSString *_Nullable)
JobsOCSearcherConfigObjectDSL(Cor, PageBackgroundColor, pageBackgroundColor, UIColor *_Nullable)
JobsOCSearcherConfigObjectDSL(Cor, InputBackgroundColor, inputBackgroundColor, UIColor *_Nullable)
JobsOCSearcherConfigObjectDSL(Cor, TextColor, textColor, UIColor *_Nullable)
JobsOCSearcherConfigObjectDSL(Cor, SecondaryTextColor, secondaryTextColor, UIColor *_Nullable)
JobsOCSearcherConfigObjectDSL(Cor, AccentColor, accentColor, UIColor *_Nullable)
JobsOCSearcherConfigObjectDSL(Cor, SeparatorColor, separatorColor, UIColor *_Nullable)
JobsOCSearcherConfigObjectDSL(BOOL, ShowsCancelButton, showsCancelButton, BOOL)
JobsOCSearcherConfigObjectDSL(BOOL, ShowsSearchButton, showsSearchButton, BOOL)
JobsOCSearcherConfigObjectDSL(BOOL, PersistsHistory, persistsHistory, BOOL)
JobsOCSearcherConfigObjectDSL(NSUserDefaults, HistoryDefaults, historyDefaults, NSUserDefaults *_Nullable)

JobsOCSearcherConfigObjectDSL(BOOL, InputOnly, inputOnly, BOOL)
JobsOCSearcherConfigObjectDSL(JobsByStr, EditingDidBeginBlock, editingDidBeginBlock, jobsByStrBlock _Nullable)

#undef JobsOCSearcherConfigObjectDSL

-(JobsRetJobsOCSearcherConfigByNSUIntegerBlock _Nonnull)byMaxHistoryCount{
    @jobs_weakify(self)
    return ^__kindof JobsOCSearcherConfig *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.maxHistoryCount = MIN(MAX(data, 1), 1000);
        return self;
    };
}

-(JobsRetJobsOCSearcherConfigByBOOLBlock _Nonnull)byDismissKeyboardWhenCancel{
    @jobs_weakify(self)
    return ^__kindof JobsOCSearcherConfig *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.dismissKeyboardWhenCancel = data;
        return self;
    };
}

@end

//
//  JobsOCSearcherConfig.m
//  JobsOCSearcher
//
//  Created by Jobs on 2026年7月5日，星期日.
//

#import "JobsOCSearcherConfig.h"

@implementation JobsOCSearcherConfig
+(JobsRetJobsOCSearcherConfigByVoidBlock _Nonnull)defaultConfig{
    return ^JobsOCSearcherConfig *{
        return JobsOCSearcherConfig.new
            .byPlaceholder(@"请输入搜索内容")
            .bySearchButtonTitle(@"搜索")
            .byRecommendTitle(@"🔍搜索推荐")
            .byHistoryTitle(@"⏰搜索历史")
            .byHistoryStorageKey(@"JobsOCSearcherHistoryData")
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

#undef JobsOCSearcherConfigObjectDSL

-(JobsRetJobsOCSearcherConfigByNSUIntegerBlock _Nonnull)byMaxHistoryCount{
    @jobs_weakify(self)
    return ^__kindof JobsOCSearcherConfig *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.maxHistoryCount = data;
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

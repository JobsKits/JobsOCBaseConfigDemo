//
//  JobsOCSearcherConfig.m
//  JobsOCSearcher
//
//  Created by Jobs on 2026年7月5日，星期日.
//

#import "JobsOCSearcherConfig.h"

@implementation JobsOCSearcherConfig

+(instancetype)defaultConfig{
    JobsOCSearcherConfig *config = JobsOCSearcherConfig.new;
    config.placeholder = @"请输入搜索内容";
    config.searchButtonTitle = @"搜索";
    config.recommendTitle = @"🔍搜索推荐";
    config.historyTitle = @"⏰搜索历史";
    config.historyStorageKey = @"JobsOCSearcherHistoryData";
    config.maxHistoryCount = 20;
    config.dismissKeyboardWhenCancel = YES;
    return config;
}

@end

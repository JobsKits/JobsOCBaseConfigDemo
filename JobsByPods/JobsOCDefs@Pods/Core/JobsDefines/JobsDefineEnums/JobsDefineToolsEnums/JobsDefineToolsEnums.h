//
//  JobsDefineToolsEnums.h
//  JobsOCDefs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsDefineToolsEnums_h
#define JobsDefineToolsEnums_h
#pragma mark —— 🔧工具
#ifndef JOBS_APP_DOOR_BG_TYPE_ENUM_DEFINED
#define JOBS_APP_DOOR_BG_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsAppDoorBgType) {
    JobsAppDoorBgType_Image = 0,  // 背景只是一张图
    JobsAppDoorBgType_Video       // 背景是视频资源
};
#endif /* JOBS_APP_DOOR_BG_TYPE_ENUM_DEFINED */
/// 无数据占位图的类型
#ifndef JobsEmptyViewType_h
#define JobsEmptyViewType_h
typedef NS_OPTIONS(NSUInteger, JobsEmptyViewType) {
    JobsEmptyViewTypeNone       = 0,
    JobsEmptyViewTypeLabel      = 1 << 0,
    JobsEmptyViewTypeButton     = 1 << 1,
    JobsEmptyViewTypeCustomView = 1 << 2,
};
#endif /* JobsEmptyViewType_h */
/// 刷新阶段
#ifndef REFRESHING_TYPE_ENUM_DEFINED
#define REFRESHING_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, RefreshingType) {
    RefreshingType_BeginRefreshing = 0, // 刷新阶段@开始
    RefreshingType_EndRefreshing        // 刷新阶段@结束
};
#endif /* REFRESHING_TYPE_ENUM_DEFINED */
/// 比较结果
#ifndef COMPARE_RES_ENUM_DEFINED
#define COMPARE_RES_ENUM_DEFINED
typedef NS_ENUM(NSInteger, CompareRes) {
    CompareRes_Error,
    CompareRes_MoreThan, // 比较结果@大于
    CompareRes_Equal,    // 比较结果@等于
    CompareRes_LessThan  // 比较结果@小于
};
#endif /* CompareRes */
/// 搜索策略
#ifndef JOBS_SEARCH_STRATEGY_ENUM_DEFINED
#define JOBS_SEARCH_STRATEGY_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsSearchStrategy) {
    JobsSearchStrategy_Accurate = 0,// 搜索策略@精确查询
    JobsSearchStrategy_Fuzzy        // 搜索策略@模糊查询
};
#endif /* JOBS_SEARCH_STRATEGY_ENUM_DEFINED */
/// 统计
#ifndef StatisticsAlphabetNumberType_h
#define StatisticsAlphabetNumberType_h
typedef NS_ENUM(NSInteger, StatisticsAlphabetNumberType) {
    StatisticsAlphabetNumberType_Chinese = 0,  // 统计汉字字数
    StatisticsAlphabetNumberType_English       // 统计英文字母数字
};
#endif /* StatisticsAlphabetNumberType_h */
/// 行为
#ifndef JobsInvokePolicy_h
#define JobsInvokePolicy_h
typedef NS_ENUM(NSInteger, JobsInvokePolicy) {
    JobsInvokePolicyNone = 0,      // 普通：直接执行
    JobsInvokePolicyThrottle,      // 节流：间隔内只执行一次（leading）
    JobsInvokePolicyDebounce,      // 防抖：静默期后执行（trailing）
    JobsInvokePolicyOnce,          // 一次性：触发后解绑
};
#endif /* JobsInvokePolicy_h */

#endif /* JobsDefineToolsEnums_h */

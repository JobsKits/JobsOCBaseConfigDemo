//
//  JobsDefineActivityEnums.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsDefineActivityEnums_h
#define JobsDefineActivityEnums_h
#pragma mark —— 🎡活动相关
/// 奖励发放
#ifndef REWARDDISTRIBUTIONTYPE
#define REWARDDISTRIBUTIONTYPE
typedef NS_ENUM(NSInteger, RewardDistributionType) {
    REWARDDISTRIBUTIONTYPE_AUTO = 1,        // 奖励发放@自动发放
    REWARDDISTRIBUTIONTYPE_MANUAL = 2       // 奖励发放@人工审核
};
#endif /* REWARDDISTRIBUTIONTYPE */
/// 活动状态
#ifndef JOBS_ACTIVE_STATE_ENUM_DEFINED
#define JOBS_ACTIVE_STATE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsActiveState) {
    JobsActiveState_Undefined = 0, // 未定义
    JobsActiveState_参与活动,
    JobsActiveState_等级不符,
    JobsActiveState_正在参与活动,
    JobsActiveState_已参与过活动,
    JobsActiveState_All
};
#endif /* JOBS_ACTIVE_STATE_ENUM_DEFINED */
/// 活动类型
#ifndef ACTIVITYTYPE
#define ACTIVITYTYPE
typedef NS_ENUM(NSInteger, ActivityType){
    ACTIVITYTYPE_NORMAL = 0,       // 活动类型@日常
    NEEDREALNAME_SIGNIN = 1,       // 活动类型@签到
    NEEDREALNAME_DEPOSITPROMO = 2  // 活动类型@存款优惠
};
#endif /* ACTIVITYTYPE */
/// 活动周期
#ifndef ACTIVITYDURATION
#define ACTIVITYDURATION
typedef NS_ENUM(NSInteger, ActivityDuration) {
    ACTIVITYDURATION_LONGTERM = 1,          // 活动周期@长期有效
    ACTIVITYDURATION_SPECIFIEDTIME = 2      // 活动周期@指定时间
};
#endif /* ACTIVITYDURATION */
/// 活动分类
#ifndef ACTIVITYCATEGORY
#define ACTIVITYCATEGORY
typedef NS_ENUM(NSInteger, ActivityCategory) {
    ACTIVITYCATEGORY_NEWBIE = 0,            // 活动分类@新手
    ACTIVITYCATEGORY_DAILY = 1,             // 活动分类@日常
    ACTIVITYCATEGORY_PROMOTION = 2,         // 活动分类@优惠
    ACTIVITYCATEGORY_LIMITEDTIME = 3        // 活动分类@限时
};
#endif /* ACTIVITYCATEGORY */
/// 活动状态
#ifndef ACTIVITYSTATUS
#define ACTIVITYSTATUS
typedef NS_ENUM(NSInteger, ActivityStatus) {
    ACTIVITYSTATUS_DELETED = -2,            // 活动状态@删除
    ACTIVITYSTATUS_EXPIRED = -1,            // 活动状态@过期
    ACTIVITYSTATUS_DISABLED = 0,            // 活动状态@禁用
    ACTIVITYSTATUS_PREHEATING = 1,          // 活动状态@预热
    ACTIVITYSTATUS_OPEN = 2                 // 活动状态@开启
};
#endif /* ACTIVITYSTATUS */

#endif /* JobsDefineActivityEnums_h */

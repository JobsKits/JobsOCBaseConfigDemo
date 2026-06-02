//
//  JobsDefineStateEnums.h
//  JobsOCDefs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsDefineStateEnums_h
#define JobsDefineStateEnums_h
#pragma mark —— 状态相关
/// 开关状态
#ifndef JOBS_SWITCH_TYPE_ENUM_DEFINED
#define JOBS_SWITCH_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsSwitchType) {
    JobsSwitchType_Open = 0,  // 开关状态@启用（正常）
    JobsSwitchType_Close = 1, // 开关状态@停用
};
#endif /* JOBS_SWITCH_TYPE_ENUM_DEFINED */
/// 开关状态
#ifndef JOBS_SWITCH_TYPE2_ENUM_DEFINED
#define JOBS_SWITCH_TYPE2_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsSwitchType2) {
    JobsSwitchType2_Close = 0, // 停用
    JobsSwitchType2_Open = 1   // 启用（正常）
};
#endif /* JOBS_SWITCH_TYPE2_ENUM_DEFINED */
/// 启用/禁用状态
#ifndef STATUSSETTING
#define STATUSSETTING
typedef NS_ENUM(NSInteger, StatusSetting) {
    STATUSSETTING_STARTED = 0,     // 开始
    STATUSSETTING_DISABLED = 1     // 禁用
};
#endif /* STATUSSETTING */
///
#ifndef BitsMonitorRunMode_h
#define BitsMonitorRunMode_h
typedef NS_ENUM(NSUInteger, BitsMonitorRunMode) {
    BitsMonitorAutoRun = 0,  // 自启动模式
    BitsMonitorManualRun = 1 // 手动启动模式
};
#endif /* BitsMonitorRunMode_h */
///
#ifndef JOBS_HEADERFOOTER_VIEW_STYLE_ENUM_DEFINED
#define JOBS_HEADERFOOTER_VIEW_STYLE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsHeaderFooterViewStyle) {
    JobsHeaderFooterViewStyleNone = 0,
    JobsHeaderViewStyle,
    JobsFooterViewStyle
};
#endif /* JOBS_HEADERFOOTER_VIEW_STYLE_ENUM_DEFINED */
/// 👍点赞
#ifndef RBCLikeButtonStatus_DEFINED
#define RBCLikeButtonStatus_DEFINED
typedef NS_ENUM(NSInteger, RBCLikeButtonStatus) {
    RBCLikeButtonStatusHadThumbs,       // 已点赞
    RBCLikeButtonStatusNoneThumbs,      // 未点赞
    RBCLikeButtonStatusThumbsing,       // 正在点赞
    RBCLikeButtonStatusCancelThumbsing  // 正在取消点赞
};
#endif /* RBCLikeButtonStatus_DEFINED */

#endif /* JobsDefineStateEnums_h */

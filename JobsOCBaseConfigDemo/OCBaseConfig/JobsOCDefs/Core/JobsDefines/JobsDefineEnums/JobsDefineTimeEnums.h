//
//  JobsDefineTimeEnums.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsDefineTimeEnums_h
#define JobsDefineTimeEnums_h
#pragma mark —— 时间相关
/// 时间相关@查询时间类型
#ifndef JOBS_QUERY_TIME_TYPE_DEFINED
#define JOBS_QUERY_TIME_TYPE_DEFINED
typedef NS_ENUM(NSInteger, JobsQueryTimeType) {
    JobsQueryTimeType_SpecificTime = 0, // 查询时间类型@具体时间
    JobsQueryTimeType_Today,            // 查询时间类型@当天
    JobsQueryTimeType_Yesterday,        // 查询时间类型@昨天
    JobsQueryTimeType_Within7Days,      // 查询时间类型@7天内
    JobsQueryTimeType_Within30Days      // 查询时间类型@30天内
};
#endif /* JOBS_QUERY_TIME_TYPE_DEFINED */
/// 时间相关@定义
#ifndef JOBS_ORDER_DATE_ENUM_DEFINED
#define JOBS_ORDER_DATE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsOrderDate) {
    JobsOrderDate_Undefined,
    JobsOrderDate_Today = 0,    // 时间定义@今天
    JobsOrderDate_Yesterday,    // 时间定义@昨天
    JobsOrderDate_In7Days,      // 时间定义@近7天内
    JobsOrderDate_InOneMonth,   // 时间定义@一个月内
    JobsOrderDate_All           // 时间定义@全部
};
#endif /* JOBS_ORDER_DATE_ENUM_DEFINED */
/// 时间相关@表示单位
#ifndef INTERVAL_STYLE_ENUM_DEFINED
#define INTERVAL_STYLE_ENUM_DEFINED
typedef NS_ENUM(NSUInteger, IntervalStyle) {
    intervalBySec = 0,       // 单位：秒
    intervalByMilliSec       // 单位：毫秒
};
#endif /* INTERVAL_STYLE_ENUM_DEFINED */
/// 时间相关@时区
#ifndef JOBS_TimeZoneType
#define JOBS_TimeZoneType
typedef NS_ENUM(NSInteger, TimeZoneType) {
    TimeZoneTypeUTC,           // 时区@协调世界时
    TimeZoneTypeGMT,           // 时区@格林尼治标准时间
    TimeZoneTypePST,           // 时区@太平洋标准时间 (美国和加拿大)
    TimeZoneTypeEST,           // 时区@东部标准时间 (美国和加拿大)
    TimeZoneTypeCST,           // 时区@中部标准时间 (美国和加拿大)
    TimeZoneTypeMST,           // 时区@山地标准时间 (美国和加拿大)
    TimeZoneTypeCSTChina,      // 时区@中国标准时间
    TimeZoneTypeJST,           // 时区@日本标准时间
    TimeZoneTypeBST,           // 时区@英国夏令时
    TimeZoneTypeAEST,          // 时区@澳大利亚东部标准时间
    TimeZoneTypeAWST,          // 时区@澳大利亚西部标准时间
    TimeZoneTypeCET,           // 时区@欧洲中部时间
    TimeZoneTypeMSK,           // 时区@莫斯科标准时间
    TimeZoneTypeIST,           // 时区@印度标准时间
    TimeZoneTypeBRT,           // 时区@巴西利亚时间
    TimeZoneTypeCSTMexico,     // 时区@墨西哥城时间
    TimeZoneTypeART,           // 时区@阿根廷时间
    TimeZoneTypeHST,           // 时区@夏威夷标准时间
    TimeZoneTypeAKST,          // 时区@阿拉斯加标准时间
    TimeZoneTypeCEST,          // 时区@中欧夏令时
    TimeZoneTypeEET,           // 时区@欧洲东部时间
    TimeZoneTypeWET,           // 时区@欧洲西部时间
    TimeZoneTypeNST,           // 时区@纽芬兰标准时间
    TimeZoneTypeAST,           // 时区@大西洋标准时间
    TimeZoneTypePDT,           // 时区@太平洋夏令时
    TimeZoneTypeMDT,           // 时区@山地夏令时
    TimeZoneTypeCDT,           // 时区@中部夏令时
    TimeZoneTypeEDT,           // 时区@东部夏令时
    TimeZoneTypeNZST,          // 时区@新西兰标准时间
    TimeZoneTypeHKT,           // 时区@香港时间
    TimeZoneTypeSGT,           // 时区@新加坡时间
    TimeZoneTypeMYT,           // 时区@马来西亚时间
    TimeZoneTypeKST            // 时区@韩国标准时间
    // 可以继续添加更多时区类型...
};
#endif /* JOBS_TimeZoneType */
/// iOS系统基本的3大定时器类型@其他类型的定时器均由此二次封装而成（NSTimer / GCD / CADisplayLink）
#ifndef JOBS_TIMER_TYPE_ENUM_DEFINED
#define JOBS_TIMER_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSUInteger, JobsTimerType) {
    JobsTimerTypeNSTimer = 0,        // NSTimer@RunLoop
    JobsTimerTypeGCD,                // GCD@dispatch_source_t
    JobsTimerTypeDisplayLink,        // CAD@displayLink（帧驱动）
    JobsTimerTypeRunLoop             // CFRunLoopTimer（对齐 Swift JobsTimerKind.runLoop）
};
#endif /* JOBS_TIMER_TYPE_ENUM_DEFINED */
/// 模式@初始化NSTimer定时器
#ifndef ScheduledTimerType_h
#define ScheduledTimerType_h
typedef NS_ENUM(NSUInteger, ScheduledTimerType) {
    ScheduledTimerType_0 = 0, // scheduledTimerWithTimeInterval/repeats/block
    ScheduledTimerType_1,     // scheduledTimerWithTimeInterval/invocation/repeats
    ScheduledTimerType_2      // scheduledTimerWithTimeInterval/target/selector/userInfo/repeats
};
#endif /* ScheduledTimerType_h */
/// 定时器@当前状态
#ifndef JOBS_TIMER_STATE_ENUM_DEFINED
#define JOBS_TIMER_STATE_ENUM_DEFINED
typedef NS_ENUM(NSUInteger, JobsTimerState) {
    JobsTimerStateIdle = 0,          // 定时器当前状态@初始
    JobsTimerStateRunning,           // 定时器当前状态@运行中
    JobsTimerStatePaused,            // 定时器当前状态@暂停
    JobsTimerStateResume,            // 定时器当前状态@恢复运行状态
    JobsTimerStateFinished,          // 定时器当前状态@正常结束（非重复模式）
    JobsTimerStateCanceled           // 定时器当前状态@手动取消或者结束
};
#endif /* JOBS_TIMER_STATE_ENUM_DEFINED */
/// 定时器@模式
#ifndef JOBS_TIMER_STYLE_ENUM_DEFINED
#define JOBS_TIMER_STYLE_ENUM_DEFINED
typedef NS_ENUM(NSUInteger, JobsTimerStyle) {
    TimerStyle_clockwise = 0,        // 定时器模式@顺时针
    TimerStyle_anticlockwise         // 定时器模式@逆时针（倒计时）
};
#endif /* JOBS_TIMER_STYLE_ENUM_DEFINED */
/// 时间@显示风格
#ifndef SHOW_TIME_TYPE_ENUM_DEFINED
#define SHOW_TIME_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSUInteger, ShowTimeType) {
    ShowTimeType_SS = 0, // 时间显示风格@秒
    ShowTimeType_MMSS,   // 时间显示风格@分秒
    ShowTimeType_HHMMSS, // 时间显示风格@时分秒
};
#endif /* SHOW_TIME_TYPE_ENUM_DEFINED */
///（时间）文本@显示类型
#ifndef CEQUENCE_FOR_SHOW_TITLE_RUNING_STR_TYPE_DEFINED
#define CEQUENCE_FOR_SHOW_TITLE_RUNING_STR_TYPE_DEFINED
typedef NS_ENUM(NSUInteger, CequenceForShowTitleRuningStrType) {
    CequenceForShowTitleRuningStrType_front = 0, // TitleRuningStr 在前 | 首在前
    CequenceForShowTitleRuningStrType_tail       // TitleRuningStr 在后 | 首在后
};
#endif /* CEQUENCE_FOR_SHOW_TITLE_RUNING_STR_TYPE_DEFINED */

#endif /* JobsDefineTimeEnums_h */

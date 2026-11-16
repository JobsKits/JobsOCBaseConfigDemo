//
//  JobsDefineBizEnums.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsDefineBizEnums_h
#define JobsDefineBizEnums_h
#pragma mark —— 业务相关
/// 平台维护状态
#ifndef JOBS_APP_STATUS_ENUM_DEFINED
#define JOBS_APP_STATUS_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsAppStatus) {
    JobsAppStatus_Undefined = 0,
    JobsAppStatus_Maintenance,// 平台维护中
    JobsAppStatus_OK,         // 平台正常
    JobsAppStatus_Close,      // 平台关闭
    JobsAppStatus_All
};
#endif /* JOBS_APP_STATUS_ENUM_DEFINED */
/// 跳转类型@记录是什么触发登录操作的（登录成功继续进行流程）
#ifndef FMLOGINWORK
#define FMLOGINWORK
typedef NS_ENUM(NSInteger, FMLoginWork){
    FMLoginWork_Default = 0,
    FMLoginWork_MyFav,
    FMLoginWork_MyBank
};
#endif /* FMLOGINWORK */
/// 是否有子游戏
#ifndef HASSUBSETTING
#define HASSUBSETTING
typedef NS_ENUM(NSInteger, HasSubSetting) {
    HASSUBSETTING_NO = 0,     // 没有子游戏
    HASSUBSETTING_YES = 1     // 有子游戏
};
#endif /* HASSUBSETTING */
/// 是否热门
#ifndef ISHOTGAMESETTING
#define ISHOTGAMESETTING
typedef NS_ENUM(NSInteger, IsHotGameSetting) {
    ISHOTGAMESETTING_HOT = 0,     // 是热门游戏
    ISHOTGAMESETTING_NOT_HOT = 1  // 不是热门游戏
};
#endif /* ISHOTGAMESETTING */
/// 广告标签类型
#ifndef FM_AD_TAG_TYPE_DEFINED
#define FM_AD_TAG_TYPE_DEFINED
typedef NS_ENUM(NSInteger, FMAdTagType) {
    FMAdTagType_All = 0,             // 广告标签类型@全部广告
    FMAdTagType_LimitedTime,         // 广告标签类型@限时广告
    FMAdTagType_NewAccount,          // 广告标签类型@新账户广告
    FMAdTagType_Daily                // 广告标签类型@日常广告
};
#endif /* FM_AD_TAG_TYPE_DEFINED */
/// 教程标签类型
#ifndef FM_TUTORIAL_Type_DEFINED
#define FM_TUTORIAL_Type_DEFINED
typedef NS_ENUM(NSInteger, FMTutorialType) {
    FMTutorialType_常见教程 = 1,         // 教程标签类型@常见教程
    FMTutorialType_关于我们 = 2,         // 教程标签类型@关于我们
};
#endif /* FM_TUTORIAL_Type_DEFINED */
/// 代理线设置
#ifndef AGENTLINESETTING
#define AGENTLINESETTING
typedef NS_ENUM(NSInteger, AgentLineSetting) {
    AGENTLINESETTING_ALL = 1,               // 代理线设置@全部参与
    AGENTLINESETTING_EXCLUDE = 2,           // 代理线设置@排除代理线
    AGENTLINESETTING_SPECIFIED = 3          // 代理线设置@指定代理线
};
#endif /* AGENTLINESETTING */
/// 电子标签类型
#ifndef ELECTRONICLABELTYPESETTING
#define ELECTRONICLABELTYPESETTING
typedef NS_ENUM(NSInteger, ElectronicLabelTypeSetting) {
    ELECTRONICLABELTYPE_HOT = 1,  // 电子标签类型@热门
    ELECTRONICLABELTYPE_NEW = 2   // 电子标签类型@新品
};
#endif /* ELECTRONICLABELTYPESETTING */
/// 业务来源
#ifndef BUSINESSSOURCESETTING
#define BUSINESSSOURCESETTING
typedef NS_ENUM(NSInteger, BusinessSourceSetting) {
    BUSINESSSOURCE_MEMBER = 1,  // 业务来源@会员（默认）
    BUSINESSSOURCE_AGENT = 2    // 业务来源@代理
};
#endif /* BUSINESSSOURCESETTING */
/// 来源类型
#ifndef SOURCE_TYPE_ENUM_DEFINED
#define SOURCE_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSUInteger, SourceType) {
    SourceType_Home = 0,     // 来源@来自首页
    SourceType_Favorite      // 来源@来自收藏
};
#endif /* SOURCE_TYPE_ENUM_DEFINED */
/// 数据来源
#ifndef DATA_SOURCE_TYPE_ENUM_DEFINED
#define DATA_SOURCE_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSUInteger, DataSourceType) {
    DataSourceType_Unknown = 0,    // 数据来源@未知
    DataSourceType_Login,          // 数据来源@登录
    DataSourceType_Register,       // 数据来源@注册
    DataSourceType_ForgotPassword, // 数据来源@忘记密码
    DataSourceType_SettingNewPwd   // 数据来源@修改密码
};
#endif /* DATA_SOURCE_TYPE_ENUM_DEFINED */
/// 首页游戏列表名
#ifndef HOMEBARLISTSTYLE
#define HOMEBARLISTSTYLE
typedef NS_ENUM(NSInteger, HomeBarListStyle){
    HomeBarListStyle_Sports = 1001101,     // 首页游戏列表名@Sports体育
    HomeBarListStyle_LiveCasino = 1001102, // 首页游戏列表名@Live_Casino真人
    HomeBarListStyle_TableGames = 1001103, // 首页游戏列表名@Table_Games棋牌
    HomeBarListStyle_SlotsGames = 1001104, // 首页游戏列表名@Slots_Games电子
    HomeBarListStyle_Lottery = 1001105,    // 首页游戏列表名@Lottery彩票
    HomeBarListStyle_ESport = 1001106      // 首页游戏列表名@ESport电竞
};
#endif /* HOMEBARLISTSTYLE */
/// 绑定状态
#ifndef BINDSTYLE
#define BINDSTYLE
typedef NS_ENUM(NSInteger, BindStyle){
    NoBinded = 0,// 绑定状态@未绑定
    Binded = 1   // 绑定状态@已绑定
};
#endif /* BINDSTYLE */
/// 绑定状态
#ifndef NEEDREALNAME
#define NEEDREALNAME
typedef NS_ENUM(NSInteger, NeedRealName){
    NEEDREALNAME_NONEED = 0,  // 绑定状态@不需要
    NEEDREALNAME_NEED1 = 1,   // 绑定状态@需要-单姓名
    NEEDREALNAME_NEEDMORE = 2 // 绑定状态@需要-可以多姓名
};
#endif /* NEEDREALNAME */
///
#ifndef MOVE_DIRECTION_ENUM_DEFINED
#define MOVE_DIRECTION_ENUM_DEFINED
typedef NS_ENUM(NSInteger, FM_action_type){
    FM_action_type_Signin = 0,        // 注册
    FM_action_type_Login,             // 登录
    FM_action_type_forgotPwd,         // 忘记密码
    FM_action_type_BindMobilePhone,   // 绑定手机号
    FM_action_type_BindBankCard,      // 绑定银行卡
    FM_action_type_BindEwallet,       // 绑定加密货币地址
    M_action_type_Withdraw            // 提现
};
#endif /* MOVE_DIRECTION_ENUM_DEFINED */
///
#ifndef FMGAMELISTSTYLE
#define FMGAMELISTSTYLE
typedef NS_ENUM(NSInteger, FMGameListStyle){
    FMGameListStyle_New = 0,   // 最新
    FMGameListStyle_Hot = 1,   // 热门
    FMGameListStyle_All = 2,   // 全部
    FMGameListStyle_Fav = 3,   // 最爱
};
#endif /* FMGAMELISTSTYLE */
/// 广告类型
#ifndef FMADSTYPE
#define FMADSTYPE
typedef NS_ENUM(NSInteger, FMAdsType){
    FMAdsType_homeBanner = 0,    // 广告类型@首页天顶轮播大Banner
    FMAdsType_ = 1,              // 广告类型@导航栏4小Banner
    FMAdsType_hotRecommend = 2,  // 广告类型@APP首页右下3Banner
    FMAdsType_memberCentral = 3, // 广告类型@APP会员中心
    FMAdsType_promotionArea = 4, // 广告类型@活动推广专区
    FMAdsType_announcement = 5,  // 广告类型@公告
    FMAdsType_homeWindowPop = 6, // 广告类型@首页弹窗广告
};
#endif /* FMAFMADSTYPEdsType */
/// 跳转类型
#ifndef FMJUMPTYPE
#define FMJUMPTYPE
typedef NS_ENUM(NSInteger, FMJumpType){
    FMJumpType_DESIGNATED_GAME = 0, // 跳转类型@指定游戏
    FMJumpType_STADIUM = 1,         // 跳转类型@场馆大厅
    FMJumpType_ACTIVITY = 2,        // 跳转类型@活动模块
    FMJumpType_WEBURL = 3,          // 跳转类型@网站地址
    FMJumpType_NO = 4               // 跳转类型@不跳转
};
#endif /* FMJUMPTYPE */
/// 客服平台标识
#ifndef JOBS_CUSTOMER_CONTACT_STYLE_ENUM_DEFINED
#define JOBS_CUSTOMER_CONTACT_STYLE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsCustomerContactStyle) {
    JobsCustomerContactStyle_Undefined = 0,   // 客服平台标识@未定义
    JobsCustomerContactStyle_QQ = 1,          // 客服平台标识@QQ
    JobsCustomerContactStyle_Skype,           // 客服平台标识@Skype
    JobsCustomerContactStyle_Telegram,        // 客服平台标识@Telegram
    JobsCustomerContactStyle_whatsApp,        // 客服平台标识@WhatsApp
    JobsCustomerContactStyle_手机号码,          // 客服平台标识@手机号码
    JobsCustomerContactStyle_OnlineURL,       // 客服平台标识@onlineURL
    JobsCustomerContactStyle_All
};
#endif /* JOBS_CUSTOMER_CONTACT_STYLE_ENUM_DEFINED */
/// 消息类型
#ifndef JOBS_MSG_TYPE_ENUM_DEFINED
#define JOBS_MSG_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsMsgType) {
    JobsMsgType_Undefined = 0, // 消息类型@未定义
    JobsMsgType_Notify,        // 消息类型@通知
    JobsMsgType_Activity,      // 消息类型@活动
    JobsMsgType_Notice,        // 消息类型@公告
    JobsMsgType_Bonus,         // 消息类型@红利
    JobsMsgType_All,
};
#endif /* JOBS_MSG_TYPE_ENUM_DEFINED */
/// 更新类型
#ifndef JOBS_UPDATE_TYPE_ENUM_DEFINED
#define JOBS_UPDATE_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsUpdateType) {
    JobsUpdate_Undefined,// 更新类型@不更新
    JobsUpdateBySys,     // 更新类型@系统强制更新
    JobsUpdateByUser,    // 更新类型@用户手动更新
    JobsUpdate_All,      // 更新类型@系统自动更新
};
#endif /* JOBS_UPDATE_TYPE_ENUM_DEFINED */

#endif /* JobsDefineBizEnums_h */

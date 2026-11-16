//
//  JobsDefineOrderEnums.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsDefineOrderEnums_h
#define JobsDefineOrderEnums_h
#pragma mark —— 订单相关
/// 支付类型
#ifndef JOBS_PAY_TYPE_ENUM_DEFINED
#define JOBS_PAY_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsPayType) {
    JobsPayType_Undefined,
    JobsPayType_银行卡,
    JobsPayType_支付宝,
    JobsPayType_微信,
    JobsPayType_数字货币,
    JobsPayType_人工后台操作上下分,
    JobsPayType_AppBalance,       // 支付类型@App余额支付
    JobsPayType_MataValue,        // 支付类型@Mata值支付
    JobsPayType_MataCreditScore,  // 支付类型@信用分支付
    JobsPayType_All
};
#endif /* JOBS_PAY_TYPE_ENUM_DEFINED */
/// 默认支付类型
#ifndef JOBS_PAY_DEFAULT_TYPE_ENUM_DEFINED
#define JOBS_PAY_DEFAULT_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsPayDefaultType) {
    JobsPayDefaultType_Undefined,
    JobsPayDefaultType_Main,  // 主支付类型
    JobsPayDefaultType_Other, // 副支付类型
    JobsPayDefaultType_All
};
#endif /* JOBS_PAY_DEFAULT_TYPE_ENUM_DEFINED */
/// 订单类型
#ifndef JOBS_ORDER_TYPE_ENUM_DEFINED
#define JOBS_ORDER_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsOrderType) {
    JobsOrderType_Undefined,
    JobsOrderType_商城订单,
    JobsOrderType_信用分订单,
    JobsOrderType_课程订单,
    JobsOrderType_All
};
#endif /* JOBS_ORDER_TYPE_ENUM_DEFINED */
/// 存取款
#ifndef BankStyle_Def
#define BankStyle_Def
typedef NS_ENUM(NSInteger, BankStyle) {
    Deposit,   // 存款
    Withdraw,  // 提款
};
#endif/* BankStyle_Def */
/// 订单状态
#ifndef JOBS_ORDER_STATE_ENUM_DEFINED
#define JOBS_ORDER_STATE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsOrderState) {
    JobsOrderState_Undefined,///
    JobsOrderState_Due,          // 订单状态@待付款订单
    JobsOrderState_WaitSent,     // 订单状态@已付款.待发货订单
    JobsOrderState_WaitReceived, // 订单状态@已发货.待收货订单
    JobsOrderState_Evaluate,     // 订单状态@已完成收货的订单，并且待评价
    JobsOrderState_Finished,     // 订单状态@已完成收货的订单，并且已经评价
    JobsOrderState_待审核订单,
    JobsOrderState_已审核订单,
    JobsOrderState_订单出款错误,
    JobsOrderState_订单已经被删除,
    JobsOrderState_All/// 全部订单
};
#endif /* JOBS_ORDER_STATE_ENUM_DEFINED */
/// 交易订单类型
#ifndef JOBS_TRANSACTION_TYPE_DEFINED
#define JOBS_TRANSACTION_TYPE_DEFINED
typedef NS_ENUM(NSInteger, JobsTransactionType) {
    JobsTransactionType_All = -1,             // 交易订单类型@查询全部
    JobsTransactionType_Deposit = 1,          // 交易订单类型@充值（存款）
    JobsTransactionType_Withdraw = 2,         // 交易订单类型@提现
    JobsTransactionType_Transfer = 3,         // 交易订单类型@转账
    JobsTransactionType_Rebate = 5,           // 交易订单类型@返水
    JobsTransactionType_Bonus = 6,            // 交易订单类型@红利
    JobsTransactionType_SystemAdjustment = 7, // 交易订单类型@系统调整
    JobsTransactionType_Live = 8              // 交易订单类型@直播
};
#endif /* JOBS_TRANSACTION_TYPE_DEFINED */
/// 交易订单统一状态
#ifndef JOBS_TRANSACTION_STATUS_DEFINED
#define JOBS_TRANSACTION_STATUS_DEFINED
typedef NS_ENUM(NSInteger, JobsTransactionStatus) {
    JobsTransactionStatus_All = -1,       // 交易订单统一状态@查询全部
    JobsTransactionStatus_Processing = 0, // 交易订单统一状态@处理中
    JobsTransactionStatus_Success,        // 交易订单统一状态@成功
    JobsTransactionStatus_Failure,        // 交易订单统一状态@失败
    JobsTransactionStatus_Review          // 交易订单统一状态@审核中
};
#endif /* JOBS_TRANSACTION_STATUS_DEFINED */
/// 交易类型
#ifndef JOBS_TRANSACTION_DIRECTION_DEFINED
#define JOBS_TRANSACTION_DIRECTION_DEFINED
typedef NS_ENUM(NSInteger, JobsTransactionDirection) {
    JobsTransactionDirection_Income = 0, // 交易类型@收入
    JobsTransactionDirection_Expense     // 交易类型@支出
};
#endif /* JOBS_TRANSACTION_DIRECTION_DEFINED */
/// 线上支付渠道
#ifndef FM_WALLET_TYPE_DEFINED
#define FM_WALLET_TYPE_DEFINED
typedef NS_ENUM(NSInteger, FMWalletType) {
    FMWalletType_GCash = 1,    // 线上支付渠道@GCash
    FMWalletType_MayaPay,      // 线上支付渠道@MayaPay
    FMWalletType_GrabPay       // 线上支付渠道@GrabPay
};
#endif /* FM_WALLET_TYPE_DEFINED */
/// 资金渠道
#ifndef JOBS_FUNDS_CHANNEL_ENUM_DEFINED
#define JOBS_FUNDS_CHANNEL_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsFundsChannel) {
    JobsFundsChannel_AllBank = 0,
    JobsFundsChannel_FortunePay,
    JobsFundsChannel_GCash,
    JobsFundsChannel_instarPay,
    JobsFundsChannel_Lazada,
    JobsFundsChannel_maya,
    JobsFundsChannel_pisopay,
    JobsFundsChannel_QRPh,
    JobsFundsChannel_UnionBank,
};
#endif /* JOBS_FUNDS_CHANNEL_ENUM_DEFINED */
/// 提现类型
#ifndef FM_WITHDRAWAL_TYPE_DEFINED
#define FM_WITHDRAWAL_TYPE_DEFINED
typedef NS_ENUM(NSInteger, FMWithdrawalType) {
    FMWithdrawalType_BankCard = 0,   // 提现类型@银行卡提现
    FMWithdrawalType_Exclusive,      // 提现类型@专属提现
    FMWithdrawalType_USDT,           // 提现类型@USDT提现
    FMWithdrawalType_EBPay,          // 提现类型@EBpay提现
    FMWithdrawalType_EWallet         // 提现类型@电子钱包提现
};
#endif /* FM_WITHDRAWAL_TYPE_DEFINED */
/// 结算状态
#ifndef SETTLEFLAG
#define SETTLEFLAG
typedef NS_ENUM(NSInteger, SettleFlag) {
    SettleFlag_NO = 0,// 结算状态@未结算
    SettleFlag_YES    // 结算状态@已结算
};
#endif /* SETTLEFLAG */
/// 提现额度
#ifndef JOBS_WITHDRAWAL_TYPE_ENUM_DEFINED
#define JOBS_WITHDRAWAL_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsWithdrawalAmountType) {
    JobsWithdrawalAmountType_Normal = 0,       // 提现额度@普通提现
    JobsWithdrawalAmountType_LargeAmount = 1,  // 提现额度@大额提现
};
#endif /* JOBS_WITHDRAWAL_TYPE_ENUM_DEFINED */

#endif /* JobsDefineOrderEnums_h */
